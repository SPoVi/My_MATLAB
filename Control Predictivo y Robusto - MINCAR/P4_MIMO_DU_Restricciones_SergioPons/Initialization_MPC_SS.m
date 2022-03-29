function [parameters, Ref,Td]=Initialization_MPC_SS;
% Autor:
% Modificado por: Sergio Pons
% Fecha: 01/12/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Esta funcion se ejecuta antes de la simulacion del bloque MPC SS Control
% SISO u(k) y permite calcular los parametros del MPC que pueden ser
% calculados offline. Estos par?metros se almacenanan en parameters.
%
% Ref almacena la referencia offline calculada para la simulaci?n. Ten en
% cuenta que si la simulaci?n es mayor que el n?mero de datos en Ref, se
% tomar? el ?ltimo valor como constante.
%
% Td es el periodo de discretizaci?n, que se usar? para definir cada cuanto
% se ejecuta el controlador
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

parameters=[];
Ref=[];
Td=[];

%% Inicializacion de variables
m1 = 0.5; % Masa [Kg]
m2 = 0.1; % Masa [Kg]
b1 = 0.5; % Friccion viscosa [N/(m/s)]
b2 = 0.1; % Friccion viscosa [N/(m/s)]
K1 = 0.01; % [N/(m/s)]
K2 = 0.01; % [N/(m/s)]

% = Matrices en continua =
Ac = [-b1/(m1+m2) 0 -K1/(m1+m2) 0;
      1 0 0 0;
      -K2/m2 0 -b2/m2 0;
      0 0 1 0];
Bc = [1/(m1+m2) 0;
      0 0;
      0 1/m2;
      0 0];
Cc = [0 1 0 0;
      0 0 0 1];
Dc = 0;

% Modelo de espacio de estados
sc = ss(Ac,Bc,Cc,Dc);
%% Periodo de Discretizacion
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Td=0.25;
sd = c2d(sc,Td);

%% Matrices del modelo discretizado
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
parameters.A=sd.a;
parameters.B=sd.b;
parameters.C=sd.c;

%% Calculo de los parametros y matrices del controlador
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Horizonte de prediccion h = 5 y hu = 3
parameters.h=5;
parameters.hu=3;
% =  Ponderaciones =
q = 3; % ponderacion de la accion de control. 
r = 1;  % ponderacion del error  de referencia. 
q = [q 0;
     0 q];
r = [r 0;
     0 10*r];
% = Matrices de ponderacion = 
[ny,nx] = size(parameters.C);
[nx,nu] = size(parameters.B);

Q = zeros(parameters.hu*nu);
for i = 1:nu:parameters.hu*nu
    Q(i:i+nu-1, i:i+nu-1) = q;
end

R = zeros(parameters.h*ny);
for i = 1:ny:parameters.h*ny
    R(i:i+nu-1, i:i+nu-1) = r;
end

% = Calculo de matrices G, F y Gp =
[G,Gp,F]=CreateMPC_SSMIMO_hu_Du_Matrices(parameters.A,parameters.B,parameters.C,parameters.h,parameters.hu);

%Matrices de ponderacion
parameters.Q=Q;
parameters.R=R;
%Matrices de la ecuaci?n de predicci?n vectorial
parameters.F=F;
parameters.G=G;
parameters.Gp=Gp;

parameters.K=inv(G'*R*G+Q)*G'*R;
parameters.K12 = parameters.K(1:2,:);
%% Restricciones
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Variacion de las entradas
parameters.constraints.Dumin=[-0.12 -0.1]';
parameters.constraints.Dumax=[0.12 0.1]';
% Entradas
parameters.constraints.Umin=[-0.4 -0.15]';
parameters.constraints.Umax=[0.4 0.15]';
% Salidas
parameters.constraints.Ymin=[-1 -1]'; % Cambiar a -0.9 (valor  ref) para ultima grafica
parameters.constraints.Ymax=[1 1]'; % Cambiar a 0.9 (valor ref) para ultima grafica


%% Vector de Referencia
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
N = 100;
Ref = [zeros(1,floor(N/4)) 0.9*ones(1,N-floor(N/4));
        zeros(1,floor(N/2)) -0.9*ones(1,N-floor(N/2))];