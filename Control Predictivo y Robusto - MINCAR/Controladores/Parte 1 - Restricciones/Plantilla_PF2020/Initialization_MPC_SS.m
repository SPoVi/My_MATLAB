    function [parameters, trackdata,Td]=Initialization_MPC_SS;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Esta funcion se ejecuta antes de la simulacion del bloque MPC SS Control
% y permite calcular los parametros del MPC que pueden ser
% calculados offline. Estos par?metros se almacenanan en parameters.
%
% Trackdata almacena los datos de trayectoria y límites de velocidad.
%
% Td es el periodo de discretizaci?n, que se usar? para definir cada cuanto
% se ejecuta el controlador
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

parameters=[];
Ref=[];
Td=[];


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Rellena este documento. 

%% Inicializacion de variables
% = Parametros del modelo =
a = 0.9269;         % m
b = 0.7591;         % m
m = 611.5;          % kg
Rf = 0.265;         % m
Rr = 0.281;         % m
Iz = 430.166;       % kg m2
froll = 0.002;      %  
Cr = 42550.81/1.8;  % N/rad
Cf = 352.54/2;      % N/rad
g = 9.81;           % m/s2

% = Matrices en continua =
Ac = [0 0 0 1 0 0;
      0 0 0 0 1 0;
      0 0 0 0 0 1;
      0 0 0 -froll*g 0 0;
      0 0 0 0 (-2*(Cf+Cr)/m) 2*(Cr*b-Cf*a)/m;
      0 0 0 0 2*(Cr*b-Cf*a)/Iz -2*(Cf*a^2+Cr*b^2)/Iz];

Bc = [0 0;
     0 0;
     0 0;
     0 2/(Rr*m);
     2*Cf/m 0 ;
     2*Cf*a/Iz 0];
 % Controlas velocidad (dx), distancia al borde de carril (y) y giro del
 % vehiculo (yaw)
 %Para dos salidas: vx y
 Cc = [0 1 0 0 0 0;
       0 0 0 1 0 0];

Dc = 0;

% = Modelo de espacio de destados = 
sc = ss(Ac,Bc,Cc,Dc);

% = Discretizacion =
Td=0.05;            % Periodo de discretizacion
sd = c2d(sc,Td);

% = Matrices del model discretizado
parameters.A = sd.a;
parameters.B = sd.b;
parameters.C = sd.c;

%% Calculo de los parametros y matrices del controlador
%Horizonte de predicción
h = 30;   % inicialmente 10 y 10. linea azul
hu = 20;
parameters.h=h;
parameters.hu=hu;

% Ponderaciones
q_delta = 0.1;
q_tau = 0.1;
r_vx = 1;
r_y = 10;
r_psi = 10;  % No utilizar al principio

q = [q_delta 0; 0 q_tau];          % ponderacion de la accion de control. 
r = [r_y 0; 0 r_vx];               % ponderacion del error  de referencia.

% Matrices de ponderacion

O = zeros(2); % Los bloques que son 0, se componene de matrices nulas nuxnu(numero entradas)

% Matriz de ponderacion de la accion de control
Q = cell(hu); % Matriz de celdas de huxhu
for i = 1:hu
    for j = 1:hu
        if(i==j)
            Q{i,j} = q; % Asigno q en las diagonales
        else
            Q{i,j} = O; % Asigno la matriz de ceros en el resto
        end
    end
end
Q = cell2mat(Q); % Convertir matriz de celdas en matriz numerica

% Matriz de ponderacion del error de seguimiento
R = cell(h);  % Matriz de celdas de hxh bloques
for i = 1:h
    for j = 1:h
        if(i==j)
            R{i,j} = r; % Asignar r a las diagonales
        else
            R{i,j} = O; % Asignar matriz de ceros al resto
        end
    end
end
R = cell2mat(R); % Convertir matriz de celdas en matriz numerica

% = Calculo de matrices G, F y Gp =
[G,Gp,F]=CreateMPC_SSMIMO_hu_Du_Matrices(parameters.A,parameters.B,parameters.C,parameters.h,parameters.hu);

%Matrices de ponderacion
parameters.Q=Q;
parameters.R=R;
%Matrices de la ecuacion de prediccion vectorial
parameters.F=F;
parameters.G=G;
parameters.Gp=Gp;

% No necesario, solo realizado para ver su funcionamiento sin restricciones
parameters.K=inv(G'*R*G+Q)*G'*R;
parameters.K12 = parameters.K(1:2,:); %las dos primeras filas por haber dos variables de control (entradas)

%% Restricciones
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Variacion de las entradas (control): 
% - variacion angulo de las ruedas: 5 
% - variacion par maximo: 50
% Grados a radianes
durad = 5 * pi/180;
parameters.constraints.Dumin=[-durad -50]';
parameters.constraints.Dumax=[durad 50]';

% Entradas (control)
% - angulo de las ruedas: 15 
% - par maximo: 500
% Grados a radianes
urad = 15 * pi /180;
parameters.constraints.Umin=[-urad -500]';
parameters.constraints.Umax=[urad 500]';

% Salidas
% - ancho carril (y)
% - velocidad (vx)                
% Definidas en la Ley de Control (son variantes en el tiempo)

%% Vector de Referencia==> Trackdata ==> NO BORRAR
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
load('trackdatafile.mat');
