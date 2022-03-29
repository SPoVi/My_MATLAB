%% === Q-Learning : Robot path ===
% Artículo original: 
%https://colab.research.google.com/drive/1E2RViy7xmor0mhqskZV14_NUj2jMpJz3

% Modificado por:               Sergio Pons
% Ultima fecha de modificación: 04/11/2020

%% == Limpiar ==
close all; clear all; clc;

%% == Paso 1: Definir el entorno ==
% El entorno será una matriz de 5x5, es decir, 25 casillas o estados por 
% las que puede desplazarse el agente de la IA
env_rows = 11;
env_cols = 11;

%  == Creacion de los Q-valores ==
% Creación de una hipervector (vector de matrices) que contenga los
% Q-valores para cada pareja de estado acción.
%
% Se creará un vector de 11 matrices (env_rows) de 11x4 (env_cols x
% nAcciones)
%
% Las relaciones entre cada estado-accion, Q(s,a), se inicializan a cero.

Q_values = zeros(env_cols,4,env_rows);

% == Definir las acciones ==
% Codigos numericos de las acciones: 1=up, 2=right, 3=down, 4=left
actions = ["up","right","down","left"];

% == Definir las recompensas ==
% Se creara una matriz que contenga las recompensas de cada casilla o
% estado
% Se inicializan en el peor caso de recompensa: -100
% Este valor indica estanteria, por donde no puede pasar el robot.
rewards = -100 * ones(env_rows,env_cols);
%
% Ubicacion de la recompensa objetivo en el mapa
rewards(1,6) = 100;
% image(rewards)
% colorbar
%
% Definir los pasillos por los que se puede desplazar el robot
aisle = {};             % diccionario

% Las filas 0 y 10 no se modifican, son -100 para todas los estados
reward_row_1 = 2:10;        % Fila 2 de la matriz de recompensas
reward_row_2 = [2 8 10];
reward_row_3 = [2:8,10];
reward_row_4 = [2 8];
reward_row_5 = 1:11;
reward_row_6 = 6;
reward_row_7 = [2:10];
reward_row_8 = [4 8];
reward_row_9 = 1:11;

aisle{1} = reward_row_1;
aisle{2} = reward_row_2;
aisle{3} = reward_row_3;
aisle{4} = reward_row_4;
aisle{5} = reward_row_5;
aisle{6} = reward_row_6;
aisle{7} = reward_row_7;
aisle{8} = reward_row_8;
aisle{9} = reward_row_9;

% Modificacion de la matriz de recompensas
for i = 1:numel(aisle)          %nº de filas que se modifican
    for j = 1:numel(aisle{i})
        rewards(i+1,aisle{i}(j)) = -1;
    end     
end

%% == Paso 2: Descripción del Entrenamiento del modelo ==
% El proceso de entrenamiento consta de los siguientes pasos
%
%   1 - Elegir una posicion aleatoria, no terminal (-100 o 100) donde el
%   agente empieze su nuevo episodio.
%
%   2 - Elegir una accion para el Estado actual. La eleccion se realizará
%   usando el algoritmo "epsilon-greedy". Lo que hace este algoritmo es
%   elegir la accion mas prometedora, pero ocasionalmente elige otra menos
%   prometedora para que el agente explore el entorno.
%
%   3 - Realizar la accion escogida, y desplazarse al siguiente estado.
%
%   4 - Recivir la recompensa por moverse al siguiente estado y calcular la
%   diferencia temporal (TD)
%
%   5 - Actualizar el Q-valor el Estado anterior (del que veniamos)
%
%   6 - En el caso de que el nuevo estado sea terminal ir al paso 1, sino
%   al paso 2.
%
% == Definir funciones que ayudan al codigo ==
% - Funcion: ES UN ESTADO TERMINAL ?
%   Comprobar si es un Estado terminal (-100 o 100)
%   @is_terminal_state(current_row_index, current_col_index, rewards)
%   out: Boolean
% - Funcion: POSICION DE PARTIDA
%   Elegir aleatoriamente un punto de partida inicial que no sea Estado
%   terminal
%   @get_starting_location(env_rows, env_cols,rewards)
%   out: current_row_index, current_col_index
%
% - Funcion: SIGUIENTE ACCION
%   Algoritmo "epsilon-greedy" determina que accion realizar a continuacion
%   Si el valor escogido aleatoriamente enter 0 y 1 es menor que epsilon se
%   escogerá la accion mas prometedora (con mayor valor) de la Q-tabla.
%   Si no se tomará una accion aleatoria
%   @get_next_action(epsilon,current_row_index, current_col_index)
%   out: ref (de la accion a realizar 1 a 4)
%
% - Funcion: PROXIMA UBICACION (ESTADO)
%   Obtener la proxima ubicacion (estado) basandose en la accion escogida
%   @get_next_location(current_row_index, current_col_index, actions, action_index, env_rows, env_cols)
%   out: new_row_index, new_col_index
%
% - Funcion: CAMINO MAS CORTO
%   Obtener el camino mas corto entre cualquier posicion y el destino
%   objetivo (por las vias)
%   @get_shortest_path(@is_terminal_state,@get_next_action,start_row_index, start_col_index,rewards,shortest_path,epsilon, actions, env_rows, env_cols)
%   out: shortest_path (lista)

%% == Parte 3: Entrenamiento de la IA ==
epsilon = 0.9;
discount_factor = 0.9;  % Gamma. Descue
learning_rate = 0.9;    % Alpha
% El factor de descuento se usará cuando calculemos los valores de la 
% diferencia temporal para especificar por cuánto se deben descontar las 
% recompensas futuras.

% Hacer que corra el programa durante 10000 episodios de entrenamiento
episodes = 10000;

for episode = 1:episodes
    
    % Obtener posicion de partida
    [row_index, col_index] = get_starting_location(env_rows, env_cols,rewards);
    
    % Continuar realizando acciones mientras que no se alcance una
    % situacion terminal (100 o -100)
    while is_terminal_state(row_index,col_index,rewards) == 0
        
        % Elegir la accion a realizar
        action_index = get_next_action(epsilon,row_index,col_index,Q_values);
        
        % Realizar la accion escogida y transicionar
        old_row_index = row_index;  % Guardar posiciones antiguas
        old_col_index = col_index;
        [row_index, col_index] = get_next_location(row_index,col_index, actions, action_index, env_rows, env_cols);
        
        % Recibir la recompensa por moverse al siguiente estado
        reward = rewards(row_index, col_index); % st+1, nuevo estado
        old_Q_value = Q_values(old_col_index,action_index, old_row_index);
        
        % Diferencia Temporal (TD)
        temporal_difference = reward + (discount_factor * max(Q_values(col_index,:,row_index))) - old_Q_value;
        
        % Actualizar el Q-valor del Estado previo
        new_Q_value = old_Q_value + (learning_rate * temporal_difference);
        Q_values(old_col_index,action_index,old_row_index) = new_Q_value;
        
    end
end
fprintf("\n##################################")
fprintf("\n      FIN DEL ENTRENAMIENTO\n");
fprintf("##################################\n")

%% == Parte 4 : Ejecuccion ==

% == Encontrar las rutas mas cortas ==
% Posicion de salida:
start_row_index = 6;
start_col_index = 8;
% shortest_path = get_shortest_path(@is_terminal_state, @get_next_location, start_row_index, start_col_index,rewards,epsilon, actions, env_rows, env_cols)
if is_terminal_state(start_row_index, start_col_index,rewards) == 1
    fprintf("Estado terminal\n");
    return
else % es una posicion de partida valida
    current_row_index = start_row_index;
    current_col_index = start_col_index;
    
    shortest_path = {[current_row_index, current_col_index]};
    
    % Continuar moviendose mientras no se alcance la meta
    while is_terminal_state(current_row_index, current_col_index, rewards) == 0
        % Obtener la mejor accion a realiar
        %   @get_next_action(epsilon,current_row_index, current_col_index)
        action_index = get_next_action(epsilon,current_row_index, current_col_index,Q_values);
        
        % Moverse a la siguiente posicion en la ruta, añadir la nueva
        % posicion a la lista
        [current_row_index, current_col_index] = get_next_location(current_row_index, current_col_index, actions, action_index, env_rows, env_cols)
        shortest_path{numel(shortest_path)+1} = [current_row_index, current_col_index];
    end
end
% Mostrar resultados
clc
fprintf("\n#############################");
fprintf("\n      CAMINO MAS CORTO");
fprintf("\n#############################");
% Mostrar camino
for c = 1:numel(shortest_path)
    shortest_path{c}
end
%% == Definicion de funciones

% Funcion:  ES UN ESTADO TERMINAL ? 0 - NO ; 1 - SI
function [out] = is_terminal_state(current_row_index, current_col_index, rewards)
if rewards(current_row_index, current_col_index) == -1
    out =  false;   % 0
else
    out = true;     % 1
end
end

% - Funcion: POSICION DE PARTIDA
function [current_row_index, current_col_index] = get_starting_location(env_rows, env_cols,rewards)

% Obtener una fila y columna aleatoria
current_row_index = randi(env_rows);
current_col_index = randi(env_cols);

% Mientras sea un estado terminal seguir calculando la posicion inicial
while (is_terminal_state(current_row_index, current_col_index,rewards) == 1)
    current_row_index = randi(env_rows)
    current_col_index = randi(env_cols)
end
end

% - Funcion: SIGUIENTE ACCION
function [ref] = get_next_action(epsilon,current_row_index,current_col_index,Q_values)
aux = rand(1);
if aux < epsilon
    % (fila de la matriz interna (columna del mapa), todas las columnas d
    % la matriz interna(acciones), fila de la matriz del mapa (matriz
    % externa)
    [Qmax,ref]=max(Q_values(current_col_index,:,current_row_index)); 
else
    ref = randi(4); % Accion aleatoria
end
end

% - Funcion: PROXIMA UBICACION (ESTADO)
function [new_row_index, new_col_index] = get_next_location(current_row_index, current_col_index, actions, action_index, env_rows, env_cols)
new_row_index = current_row_index;
new_col_index = current_col_index;

% No se deben superar los margenes del entorno (1,env_cols, env_row, 1)
if (actions(action_index) == 'up') && (current_row_index > 1) 
    new_row_index = new_row_index - 1;
    
elseif (actions(action_index) == 'right') && (current_col_index < (env_cols))
    new_col_index = new_col_index + 1;
    
elseif (actions(action_index) == 'down') && (current_row_index < (env_rows))
    new_row_index = new_row_index + 1;
    
elseif (actions(action_index) == 'left') && (current_col_index > 1)
    new_col_index = new_col_index -1;
end
end

% - Funcion: CAMINO MAS CORTO
% function [shortest_path] = get_shortest_path(@is_terminal_state, @get_next_location, start_row_index, start_col_index,rewards,epsilon, actions, env_rows, env_cols,Q_values)
% 
% % Volver inmediatamente si no es una posicion valida para comenzar (-100 o
% % 100)
% % @is_terminal_state(current_row_index, current_col_index, rewards)
% if is_terminal_state(start_row_index, start_col_index,rewards) == 1
%     return
% else % es una posicion de partida valida
%     current_row_index = start_row_index;
%     current_col_index = start_col_index;
%     
%     shortest_path = {[current_row_index, current_col_index]};
%     
%     % Continuar moviendose mientras no se alcance la meta
%     while is_terminal_state(current_row_index, current_col_index, rewards) == 0
%         % Obtener la mejor accion a realiar
%         %   @get_next_action(epsilon,current_row_index, current_col_index)
%         action_index = get_next_action(epsilon,current_row_index, current_col_index,Q_values);
%         
%         % Moverse a la siguiente posicion en la ruta, añadir la nueva
%         % posicion a la lista
%         [current_row_index, current_col_index] = get_next_location(current_row_index, current_col_index, actions, action_index, env_rows, env_cols)
%         shortest_path{numel(shortest_path)} = [current_row_index, current_col_index];
%     end
% end
% end