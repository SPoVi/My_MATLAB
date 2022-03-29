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
% En ControlLaw

% = Matrices en continua =
% En ControlLaw

% = Modelo de espacio de destados = 
% En ControlLaw

% = Discretizacion =
Td=0.05;            % Periodo de discretizacion
% En ControlLaw

% = Matrices del model discretizado
% En Controlaw
% Inicializadas vacías para que no de error en la ejecucion
parameters.A = [];
parameters.B = [];
parameters.C = [];

%% Calculo de los parametros y matrices del controlador
%Horizonte de predicción
h = 20;   % inicialmente 10 y 10. linea azul
hu = h;
parameters.h=h;
parameters.hu=hu;

% Ponderaciones
q_delta = 0.1;
q_tau = 0.01;
r_vx = 0.001;
r_y = 10;
% r_psi = 10;

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
% En ControlLaw

%Matrices de ponderacion
parameters.Q=Q;
parameters.R=R;


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
urad = 10 * pi /180;
parameters.constraints.Umin=[-urad -500]';
parameters.constraints.Umax=[urad 500]';

% Salidas
% - ancho carril (y)
% - velocidad (vx)                
% Definidaas en la Ley de Control (son variantes)

%% Vector de Referencia==> Trackdata ==> NO BORRAR
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
load('trackdatafile.mat');
