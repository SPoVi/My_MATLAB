%% Robótica Industrial Práctica 2 - Problema de velocidad
clear 
close 
clc

%% 2.3.1. Problema de velocidad, Jacobianos y singularidades --------------
%--------------------------------------------------------------------------
EduBot
% Cargar el robot puma560
puma560

%% 1. Cálculo de singularidades
% Calculo matriz Jacobiana
J = jacob0(p560, qstretch)

% Utilice el comando 'det' para calcular el determinantes de la matriz
detJ = det(J)

% Cuando el robot este completamente estirado habra otra singularidad
q1 = qr;
det(jacob0(p560, q1))

%% 2. Problema de velocidades
q2 = [0 -pi/4 0 0 0.1 0];
% Visualizar configuracion
plot(p560, q2)

% Velocidad articular y/o cartesiana
J2 = jacob0(p560, q2)
v = [0 0.5 0 0 0 0];           % Velocidad
vartic2 = inv(J2)*v'

% Repetir para q3
q3 = [0 0 -pi/4 0 0.001 0];
plot(p560, q3)

J3 = jacob0(p560, q3)
v = [0 0.5 0 0 0 0];           % Velocidad
vartic2 = inv(J3)*v'
%% 2.3.2. Modelado Dinámico del robot RRR ---------------------------------
%--------------------------------------------------------------------------

%% 1. Modelo dinámico de forma compacta
% Cálculo simbólico del modelo dinámico compacto del robot RRR

syms t1 t2 t3 real;         % Variavles articulares theta1, theta2 y theta3
syms vt1 vt2 vt3 real;      % Vel. de las var. artic thetas prima
syms at1 at2 at3 real;      % Vel. de las var. artic  thetas segunda

syms l1 l2 real;            % Longitudes de los elementos
syms m1 m2 m3 real;         % Masas de los elementos
syms Ixx1 Iyy1 Izz1;        % Incercias de los elementos
syms Ixx2 Iyy2 Izz2;
syms Ixx3 Iyy3 Izz3;
syms g real;                % Valor de la gravedad
grav = [0 -g 0]             % Eje y


% Matriz con los parámetros cinemáticos y dinámicos del manipulador
Mdyn = [ 0 l1 0 0 0 m1 0 0 0 Ixx1 Iyy1 Izz1 0 0 0 0 1 0 0 0
         0 l2 0 0 0 m2 0 0 0 Ixx2 Iyy2 Izz2 0 0 0 0 1 0 0 0
         0 0  0 0 0 m3 0 0 0 Ixx3 Iyy3 Izz3 0 0 0 0 1 0 0 0];

% Creamos vectores de posición, velcoidad y aceleración
q = [t1 t2 t3]
vq = [vt1 vt2 vt3]
aq = [at1 at2 at3]

% Modelo dinamico compacto

tau = rne(Mdyn, q, vq, aq, grav)

% Calculo de matrices de incercia, coriolis y gravedad
D = inertia(Mdyn,q);
C = coriolis(Mdyn, q, vq)';
G = gravity(Mdyn, q, grav)';

% Simplificamos
D = simplify(D)
C = simplify(C)
G = simplify(G)

%% 2. Modelo Dinámico Directo y simulacion del comportamiento dinámico

% a) Creacion de la funcio tau3gdl.m

% b) Mdyn de forma numerica
m1 = 4.7; m2 = 2.6; m3 = 1.1;   % masas
l1 = 0.8; l2 = l1;              % distancias
Ixx1 = 0; Iyy1 = 0; Izz1 = 0;         % Incercias
Ixx2 = 0; Iyy2 = 0; Izz2 = 0;
Ixx3 = 0.05; Iyy3 = 0.1; Izz3 = 0.1;
t1 = 0; t2 = 0; t3 = 0;               % Tiempo

Mdyn = [ 0 l1 0 0 0 m1 0 0 0 Ixx1 Iyy1 Izz1 0 0 0 0 1 0 0 0
         0 l2 0 0 0 m2 0 0 0 Ixx2 Iyy2 Izz2 0 0 0 0 1 0 0 0
         0 0  0 0 0 m3 0 0 0 Ixx3 Iyy3 Izz3 0 0 0 0 1 0 0 0];
     
% Los centro de masas se ubican en los sistemas de referencia, por tanto,
% dado el dibujo del enunciado, los valores de los centros de masas para
% este robot son cero.
     
% Generar objeto robot
rob = robot(Mdyn); rob.gravity = [0 -9.8 0]';

% c) Utilizar fdyn para integrar la din direc y simular comportamiento

% Posicion y velocidad arciular iniciales
q0 = [0 0 0 ]; %rad
vq0 = [0 0 0]; %rad/s

% Tiempo inicia y final de simulacion en segundos
tini = 0; tfin = 10;

% Simulación del robot usando el modelo directo
[tsim,q,vq]=fdyn(rob, tini, tfin, 'tau3gdl', q0, vq0)

% d) Visualizar
% Visualizar la aminacion del robot
plot(rob,q)
% VIsualaizar la evolucion de la trayectoria en plano XY
a = q(:, 1);
b = q(:, 2);
c = a + b;
x = l1*cos(a)+ l2*cos(c);
y = l1*sin(a) + l2*sin(c);
plot(x,y)

% Valores de las variables articulares
figure;plot(tsim,q)
legend('q1','q2','q3')

%% 3. Modelo dinámico del robot serie personal ----------------------------
%--------------------------------------------------------------------------
clear
clc 
close all
%% 1. Creacion de matriz de parámatros dinamicos 
%Variables
% masas en kg
m1=8.3589;
m2=8.2646;
m3=0.8765;
m4=0.1;     % Establecido por el enunciado 
%m4 = 2.5;  % Modificar a 2,5 para resultado mas logico
m5=m4;
m6=m4;

% Distancias en m 
l1 = 0.33; 
l2 = 0.05; 
l3 = 0.33; 
l4 = 0.035; 
l5 = 0.335; 
l6 = 0.08;

% posicion del centro de masas
px1 = l2/2; py1 = 0;      pz1 = l1/2;    % S0 - elemento 1
px2 = 0;    py2 = -l3/2;  pz2 = 0;       % S1 - elemento 2
px3 = l4/2; py3 = 0;      pz3 = 0;       % S2 - elemento 3
% Para los ultimos 3 estan concentrados en la interseccion de los
% elementos, en este caso en S4 y S5
px4 = 0;    py4 = 0;      pz4 = l5;      % S3 - elemento 4
px5 = 0;    py5 = 0;      pz5 = 0;       % S4 - elemento 5
px6 = 0;    py6 = 0;      pz6 = 0;       % S5 - elelento 6

% Inercias
Ixx1=0; Iyy1=0.1076; Izz1=Iyy1;
Ixx2=0; Iyy2=0.084;  Izz2=Iyy2;
Ixx3=0; Iyy3=0.0001; Izz3=Iyy3;

Ixx4=0; Iyy4=0.1; Izz4=Iyy4;
Ixx5=0; Iyy5=0.1; Izz5=Iyy5;
Ixx6=0; Iyy6=0.1; Izz6=Iyy6;

%Matriz con los parámetros cinemáticos y dinámicos del manipulador
Mdyn = [ -pi/2 l2  0      l1    0 m1 px1 py1 pz1 Ixx1 Iyy1 Izz1 0 0 0 0 1 0 0 0
         0     l3  -pi/2  0     0 m2 px2 py2 pz2 Ixx2 Iyy2 Izz2 0 0 0 0 1 0 0 0
         -pi/2 l4  0      0     0 m3 px3 py3 pz3 Ixx3 Iyy3 Izz3 0 0 0 0 1 0 0 0
         pi/2  0     0    l5    0 m4 px4 py4 pz4 Ixx4 Iyy4 Izz4 0 0 0 0 1 0 0 0
         -pi/2 0     0    0     0 m5 px5 py5 pz5 Ixx5 Iyy5 Izz5 0 0 0 0 1 0 0 0
         0     0     0    l6    0 m6 px6 py6 pz6 Ixx6 Iyy6 Izz6 0 0 0 0 1 0 0 0];

rob=robot(Mdyn)     % Creacion de mi robot personal
rob.gravity = [0 -9.8 0]';

%% 2. Integrar dinamica directa del robot
% Posición y velocidad articular iniciales
q0= [0 0 0 0 0 0];% rad
vq0=[0 0 0 0 0 0];% rad/s
% Tiempo inicial y final de simulación en segundos
tini=0; tfin=2;
% Simulación del robot usando el modelo directo
[tsim,q,vq]=fdyn(rob, tini, tfin, 'tau6gdl', q0 ,vq0)

% Visualizar
% Visualizar la aminacion del robot
plot(rob,q)

% Valores de las variables articulares
figure;plot(tsim,q)
legend('q1','q2','q3','q4','q5','q6')
