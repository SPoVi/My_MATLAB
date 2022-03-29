%% === PENDULO == 
% Autor: Sergio Pons
% Fecha: 12/11/2020
% Fecha ultima mod:

%% == Limpiar ==
close all; clear all; clc;

%% == Descripcion ==
% Se trata de un coche que prende maneter en equilibrio una barra durante
% el mayor tiempo posible.

% El rango de angulos aceptado para moverse es de -5 a 5 grados.
%% == Fase 1: Incializacion de los parametros ==

% Numero de estados
% Rango de grados sobre los que se movera la barra
Nstates = 21;
smax = 10;  
smin = -10;
grades = smin:1:smax; % grados

% Numero de acciones
% Velocidades a las cuales se podrá mover el vehiculo
Nactions = 10;
actions = [-200, -100, -50, -25, -10, 10, 25, 50, 100, 200];   % ms
% Los valores negativos indican desplazamiento hacia la izquieda, y los
% positivos hacia la derecha
% Incluir el 0 ?? No, para asi generar movimiento siempre

% Q-tabla
% Al controlar una unica variable, theta, solo habra una matriz Q(s,a).
% Si fueran controlar el desplazamiento por una ruta, las variables serian
% x e y, por lo que sería una matriz que contiene matrices Q(s,a) (mirar
% ejemplo del robot "robot_Qlearning_v2.m")
Q_values = zeros(Nstates,Nactions);

% Recompensas (una columna)
% Valor objetivo 0 grados 
target = 0;
error = target - grades;
rewards = -abs(error);



%% == Fase 2: Entrenamiento del modelo ==

% 1 - Elegir posicion inicial no terminal.
%
% 2 - Elegir una accion para el estado actual.
%
% 3 - Realizar la accion escogida y desplazarse al siguientes estado.
%
% 4 - Recivir la recompensa por moverse al siguiente estado y calcular la
% diferencia temporal (TD)
%
% 5 - Actuzalizar el Q-Valor del Estado anterior (del que veniamos)
%
% 6 - En el caso de que el nuevo estado sea terminal ir al paso 1, sino al
% paso 2.

%% == Fase 3: Entrenamiento de la IA ==
epsilon = 0.9;
discount_factor = 0.9;  % Gamma
learning_rate = 0.8;    % Alpha

% Al controlar únicamente una variable, theta, el entorno y el indice
% coinciden, ambos son el numero de estados.
env_rows = Nstates;     % Entorno
row_index = Nstates;
col_index = Nactions;

% Numero de episodios
episodes = 500; %1500
iterations = 2000; % 2000

% Limite
limit = 5; % abs grado limite
reward = 0;    % Inicializacion

for episode = 1:episodes
    %fprintf("===================== Episodio %d  \n",episode);
    % Obtener la posicion de partida episode
    [row_index] = get_starting_location(env_rows,rewards);

    % Continuar realizando acciones mientras no se alcance una situacion
    % terminal
    for iteration = 1:iterations
        % Elegir una accion a realizar
        
        action_index = get_next_action(epsilon,row_index,Q_values);

        % Realizar la accion escogida y transicionar
        old_row_index = row_index; % Guardar posiciones
        [row_index] = get_next_location(row_index, actions,action_index,env_rows);

        if abs(grades(row_index)) >= limit % Excede el limite
            if reward <= target
                %fprintf("Recompensa Negativa\n")
                % Recibir al recompensa por moverse al siguiente estado
                %reward = reward - 100; % negativas
                reward = - 100;
                
                
                old_Q_value = Q_values(old_row_index);
                
                % Temporal Difference
                temporal_difference = reward + (discount_factor * max(Q_values(row_index,:)) - old_Q_value);

                % Actualizar el Q-valor del estado previo
                new_Q_value = old_Q_value + (learning_rate * temporal_difference);
                Q_values(old_row_index,action_index) = new_Q_value;
                
            else
                %fprintf("Passed %d %d\n", episode,iteration);    
            end
        elseif abs(grades(row_index)) < limit
            %fprintf("Recompensa positiva\n");
            % Recibir al recompensa por moverse al siguiente estado
            %reward = reward +  1; 
            %reward = 1;
            reward = rewards(row_index);
            
            old_Q_value = Q_values(old_row_index);

            % Temporal Difference
            temporal_difference = reward + (discount_factor * max(Q_values(row_index,:)) - old_Q_value);

            % Actualizar el Q-valor del estado previo
            new_Q_value = old_Q_value + (learning_rate * temporal_difference);
            Q_values(old_row_index,action_index) = new_Q_value;
        end
    end
end
fprintf("\n##################################")
fprintf("\n      FIN DEL ENTRENAMIENTO\n");
fprintf("##################################\n")

%% == Parte 4: Ejecuccion ==
positions = []; % Posicioon angular en la que se va encontrando el pendulo
tsim = 1:1:100; % Tiempo de simulacion (s)
epsilon = 1; % No realize mov aleatorios, siempre haga el mejor

% == Mantener el equilibrio dentro del limite : -+5 ==
% Posicion inicial dentro del limite
current_state = randi(Nstates);

while abs(rewards(current_state)) > limit
    [current_state] = get_starting_location(env_rows,rewards);
end
positions = grades(current_state);

% Continuar moviendose durante el tiempo de simulacion 
for t = 1:tsim(end)
    
    % Obtener la mejor accion a realizar
    action_index = get_next_action(epsilon,current_state,Q_values);
    
    % Moverse a la siguiente posicion, añadirla a la lista
    current_state = get_next_location(current_state,actions, action_index, env_rows);
    positions = [positions grades(current_state)];
    
end
fprintf("\n##################################")
fprintf("\n      FIN DE LA EJECUCION\n");
fprintf("##################################\n")
plot(positions)
ylabel("Grados");
xlabel("Iteración");
title("Movimiento del péndulo");
%% == FUNCIONES ==

% Funcion: ES UN ESTADO TERMINAL ?
function [out] = is_terminal_state(current_row_index,rewards)
if rewards(current_row_index) == -1
    out = false; % No es un estado terminal
else
    out = true; % Es un estado terminal
end
end

% Funcion: POSICION DE PARTIDA
function [current_row_index] = get_starting_location(Nstates,rewards)

% Obtener fila y columna aleatoria
current_row_index = randi(Nstates);

% Mientras sea un estado terminal seguir calculando la posicion inicial
% while (is_terminal_state(current_row_index, rewards) == 1)
%     current_row_index = randi(Nstates);
% end
end

% Funcion: SIGUIENTE ACCION
function [ref] = get_next_action(epsilon,current_row_index,Q_values)
aux = rand(1);
if aux < epsilon
    % ArgMax Q(s,a)
   %fprintf("Argmax")
    [Qmax,ref] = max(Q_values(current_row_index,:));
else
    %fprintf("Accion aleatoria\n");
    ref = randi(10); % Accion aleatoria    
end
end

% Funcion: PROXIMA UBICACION
% Se puede modificar para que dependiendo de la velocidad cambie más
% estados (de saltos mas grandes)
function [new_row_index] = get_next_location(current_row_index,actions, action_index, env_rows)
new_row_index = current_row_index;

% No se deben superar los margenes del entorno [1,21] (-10 a 10 grados)
% Coger el signo para ver el desplazamiento
if (sign(actions(action_index))) == -1 && (current_row_index > 1) % se desplaza a la izquierda (arriba en la fila de estados
    new_row_index = new_row_index -1;
    
elseif (sign(actions(action_index))) == 1 && (current_row_index < env_rows) % se desplaza hacia la derecha (abajo en la fial de estados)
    new_row_index = new_row_index + 1;
end
end

