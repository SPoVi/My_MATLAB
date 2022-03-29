% pso_pi.m
% Autor: Sergio Pons
% TIA - Tema7 - OPTIMIZATION
% Fecha: 05/10/2020

%% == Limpiar ==
clear all; close all; clc;

%% == Parámetros del algoritmo ==

niter = 200;        % nº iteraciones
nVar = 2;           % nº variables
nPart =50;          % nº particulas
w = 0.5;            % peso (inertia)
wmax = 0.9;
wmin = 0.2;
nmax = 100;
phi1max = 0.5;      % L1: Coeficiente del optimo local. random (0.5,1)
phi2max = 0.1;      % L2: Coeficiente del optimo global

% Si L1 > L2 = exploracion
% Si L1 < L2 = explotacion 

%% == Inicialización de las partículas ==

X = zeros(nVar, nPart);
C = zeros(1, nPart);

for i = 1:nPart
    C(i) = inf;
    while C(i) >= inf
        X(:,i) = random('uniform',0,20,nVar,1);   % Acualizacion de una columna entera 
        C(i) = CalcularCoste_PI(X(:,i));
    end
end

% Matrices donde se guardan las mejores posciones obtenidas
Xopt = X;   % Posiciones optimas
Copt = C;   % Costes optimos

[Copt_global, RefMin] = min(Copt);
Xopt_global = Xopt(:, RefMin);
V = random('uniform', 0.1, 0.1, nVar, nPart);

% Graficas
subplot(2,1,1);
plot(X(1,:), X(2,:), 'xg');
xlabel('Posiciones X1');
ylabel('Posiciones X2');
title("Posiciones X");
hold on
grid
subplot(2,1,2);
plot(1, Copt_global, 'xm'); % Primer valor de la funcion de coste
grid
hold on
xlabel('No. iteraciones');
ylabel('Coste');
title("Coste optimo global");


%% == Bucle princpipal del PSO ==
   % Calcular las velocidades de cada una de las particulas
   % Actualizar posiciones de las particulas
   % Calculas el coste y obtener el coste optimo global
   
for k = 1:niter
   % fprintf("Entrando en bucle principal\n");  
   for i = 1:nPart % 5
       % fprintf("--Entrando en bucle secundario\n");
       phi1 = random('uniform',0,phi1max,1,1);
       phi2 = random('uniform',0,phi2max,1,1);
       % Pesos (inercias)
       w = (wmax - wmin)*(nmax-k)/nmax + wmin;
       if w < wmin
           w = wmin;
       end
       
       % Actualizacion de velocidades y posiciones
       V(:,i) = w * V(:,i) + phi1max * (Xopt(:,i) - X(:,i)) + phi2max *...
                (Xopt_global-X(:,i));
       X(:,i) = X(:,i) + V(:,i);
       C(i) = CalcularCoste_PI(X(:,i));
       
       % Coste óptimo local
       if C(i) < Copt(i)
           Copt(i) = C(i);
           Xopt(:,i) = X(:,i);
           
           % Coste optimo global
           if Copt(i) < Copt_global % Solo hay un unico min global
               Copt_global = Copt(i); 
               Xopt_global = Xopt(:,1);
               %fprintf("--------Actualizados optimos globales\n") 
           end
       end    
   end
   
   % Gaficar
   subplot(2,1,1);
   plot(X(1,:), X(2,:), 'xr');
   %grid
   hold on
   subplot(2,1,2);
   plot(k, Copt_global, 'xb');
   %pause(0.1)
   %k % Mostrar iteracion 
end

% Mostar en ventana de comandos
Xopt_global
Copt_global


%% == Comprobacion ==
K1 = 10;
a = 10;
%H = tf([K1], [1 a 0]);          % FT de la planta (de clase)
H = tf([K1], [1 2*a a*a]);     % FT de la planta modificada

Kp = Xopt_global(1);
Ti = Xopt_global(2);
R = tf([Kp*Ti Kp], [Ti 0]);     % FT del controlador

HLC = feedback(R*H,1);          % Lazo cerrado
figure
step(HLC,10)
grid on

stepinfo(HLC)   % Mostrar resultados a entrada escalon






