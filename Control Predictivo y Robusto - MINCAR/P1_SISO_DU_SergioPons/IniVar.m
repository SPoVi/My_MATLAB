%% Práctica 1 - CPyR 
% Autor :               Sergio Pons
% Fecha creacion:       17/11/2020
% Ultima modificacion:  22/11/2020
%% == Limpiar ==
%clear all; close all; clc;

%% == 1. Iniciacion de variables ==
Km = 0.5;   % Coeficiente del motor [Nm/V]
Jm = 0.001;  % Incercia [kg m2]
Bm = 0.05;   % Coef. de rozamiento lineal [Nms]
Nm = 2;

% = Matrices en continua =
Ac = -Bm/Jm;
Bc = Km/Jm;
Cc = Nm;
Dc = 0;

%% == 2. Modelo de espacio de estados ==
sc = ss(Ac,Bc,Cc,Dc);

%% == 3. Determinar periodo de discretizacion ==
Td = 0.002;     % Tiempo de muestreo 10 veces superior a la w más rápida
sd = c2d(sc,Td);

%% == 4. Simular el sistema discreto ==
step(sc,sd);
grid;
% Determinar si el periodod de discretizacion es correcto en base a los
% resultados y si no es asi modificarlo

%% == 5. Extraer matrices A,B,C ==
A = sd.a;
B = sd.b;
C = sd.c;

%% == 6. Codificacion de referenia ==
N = 100;
Ref = [zeros(floor(N/4),1); 100*ones(floor(N/4),1); 200*ones(floor(N/4),1); 
-100*ones(N-floor(3*N/4),1)]';

% = Datos = 
h = 10; % horizonte
q = 1; % ponderacion de la accion de control
r = 1;  % ponderacion del error  de referencia

% = Matrices de ponderacion = En este caso no hace falta, dado que
% utilizamos únicamente la primera fila de la matriz K.
% [ny,nx] = size(C);
% [nx,nu] = size(B);
% % MAtrices de ponderacion en el horizonte
% Q = zeros(hu*nu);
% for i = 1:nu:hu*nu
%     Q(i:i+nu-1, i:i+nu-1) = q;
% end
% 
% R = zeros(h*ny);
% for i = 1:ny:h*ny
%     R(i:i+nu-1, i:i+nu-1) = r;
% end
%% == 7. Calculo de matrices G y F ==
[G,F,Gp]=CreateMPC_SS_Du_Matrices(A,B,C,h);

%% == 8. Calculo de la ganancia ==
%SI no hay restricciones, la solución óptima se reduce al cálculo de la ganancia K
K=inv(G'*r*G+q*eye(h))*G'*r;
K1=K(1,:);

