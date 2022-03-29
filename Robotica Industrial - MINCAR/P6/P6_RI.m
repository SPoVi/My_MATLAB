%% Practica 5 - Robotica Industrial
% Autor: Sergio Pons Villanueva
close all
clear all
clc
%% Iniciar Edubot
EduBot
% Recuerda cargar previamente los archivos en MATLAB, Set Path
%% 6.2. Trabajo Previo - Mdyn

% Variables
l1=0.3; l2=0.2;
m1=0.25; m2=0.2; mc=0;

% Matriz de parámetros dinámica 
Mdyn=[ 0 l1 0 0 0 m1 0 0 0 0 0 0 0 0 0 0 1 0 0 0
       0 l2 0 0 0 m2 0 0 0 0 0 0 0 0 0 0 1 0 0 0];
   
%% Trabajo en la sesion
%% 6.3.1. Interpolacion en el espacio articular y cartesiano
%% 6.3.1.1 - Creacion del Robot
rob=robot(Mdyn);
rob.gravity=[0 -9.8 0]';
%% 6.3.1.2 - Interpolacion en el espacio articular
% Configuraciones articulares:
q1=[0 0]; %rad
q2=[pi/3 pi/2]; %rad

% a) interpolador de orden 7
N=40; %Puntos
Tini=0; Tfin=3; %Tiempos de ejecucion inicial y final
[Q, vQ, aQ]=jtraj(q1, q2, N); %Trayectoria de la coord. articular
time=linspace(Tini,Tfin,N);

%b) Plotear posicion, velocidad y aceleracion de cada articulacion
subplot(3,1,1)
plot(time, Q)
title('Posición')
xlabel('Tiempo')
ylabel('Posición')
legend('q1','q2')
grid
subplot(3,1,2)
plot(time, vQ)
title('Velocidad')
xlabel('Tiempo')
ylabel('Velocidad')
legend('q1','q2')
grid
subplot(3,1,3)
plot(time, aQ)
title('Aceleración')
xlabel('Tiempo')
ylabel('Aceleración')
legend('q1','q2')
grid

%c) Visualizar la animacion de dicha trayectoria
figure
plot(rob,Q)

%d) Posicion TCP del robot en el plano XY
Q1=Q(:,1);
Q2=Q(:,2);
X=l1*cos(Q1)+l2*cos(Q1+Q2);
Y=l1*sin(Q1)+l2*sin(Q1+Q2);
figure
plot(X,Y)
grid
title('Posicion del TCP del tobot en el plano XY')

%% 6.3.1.3 - Interpolacion en el espacio cartesiano

%a) Matrices de transformacion T1 y T2 asociadas a las configuraciones
%articuales q1 y q2 definidas anteiormente
T1 = fkine(rob, q1);
T2 = fkine(rob, q2);

%b) Trayectoria en el espacio cartesiano que permita ir de la localizacion
%inicial T1 a la final T2 en 3 segundos. Dicretizada en 40 puntos.
%N=40, 30 ó 20 no converge
N=10; %Puntos intermedios
Tini=0; %Tiempo ejecucion
Tfin=3;
T=ctraj(T1, T2, N); %Trayectoria coordenada articular
time=linspace(Tini,Tfin,N);

%c) Utilizando el modelo cinemático inverso, calcular la secuencia de
%posiciones articulares a las que se corresponde la secuencia de
%localizaciones T
Q=ikine(rob,T,q1,[1 1 0 0 0 0]);

%d) Visualizar la animacion de la trayectoria
figure
plot(rob,Q)

%e) Plotear la posición del TCP del robot en el plano XY
Q1=Q(:,1);
Q2=Q(:,2);
X=l1*cos(Q1)+l2*cos(Q1+Q2);
Y=l1*sin(Q1)+l2*sin(Q1+Q2);
figure
plot(X,Y)
grid
title('Posición del TCP del tobot en el plano XY')
%% 6.3.2 - Control Cinemático del robot 2R
% Puntos en el espacio cartesiano
P1=[0.2 0.4 0]; % m
P2=[0.2 0.3 0]; % m
P3=[0.1 0.3 0]; % m
P4=[0.1 0.4 0]; % m

% 6.3.2.1 - Matrices de transformacion
T1=transl(P1);
T2=transl(P2);
T3=transl(P3);
T4=transl(P4);

% 6.3.2.2 - Mediante la cinemática inversa obtener las configuraciones 
%articulares
q1=ikine(rob,T1,[0 0],[1 1 0 0 0 0]);
q2=ikine(rob,T2,[0 0],[1 1 0 0 0 0]);
q3=ikine(rob,T3,[0 0],[1 1 0 0 0 0]);
q4=ikine(rob,T4,[0 0],[1 1 0 0 0 0]);

% 6.3.2.3 - interpolar la trayectoria rectangular usando el interpolador 
% parabólico parab y plotear las trayectorias mediante el comando subplot3.
QArray=[ q1' q2' q3' q4' q1'];
t0=0;               % Tiempo inicial
ac=5*ones(2,5);     % Aceleración
tij=1*ones(1,4);    % Tiempo entre puntos a interpolar
step=1e-2;          % Discretización
[Qcoef, time,Q, vQ, aQ, intervs] = parab(QArray, ac, t0, tij, step);
subplot3(time, Q, vQ, aQ)

%% 6.3.3 - Control Dinámico del robot 2R
%% 6.3.3.1. - Control PD de articulación independiente
%EdubotSimulateModel('PD',rob, time,Q, vQ, aQ, {Kp Kv});

%a) Simular el comportamiento dinamico del robot ante la trayectoria
%definida en la seccion anteiror.
Kp=75;
Kv=2;
EdubotSimulateModel('PD',rob, time,Q, vQ, aQ, {Kp Kv});

%b) Modificar las ganancias para tener un menor error de seguimiento
%% b1) Aumentamos la ganacia de posicion
% Valores obtenidos en el trabajo previo
Kp=100;
Kv=2;
EdubotSimulateModel('PD',rob, time,Q, vQ, aQ, {Kp Kv});
%% b2) Aumentamos la ganacia de velocidad  -> Mejora significativa
Kp=75;
Kv=20;
EdubotSimulateModel('PD',rob, time,Q, vQ, aQ, {Kp Kv});

%% b3) Aumentamos ambas ganancias -> Mejor que las anteriores
Kp=100;
Kv=20;
EdubotSimulateModel('PD',rob, time,Q, vQ, aQ, {Kp Kv});

%% b4) Reducimos ambas ganancias a la mitad -> Empeora la respuesta
Kp=37.5;
Kv=1;
EdubotSimulateModel('PD',rob, time,Q, vQ, aQ, {Kp Kv});
%% 6.3.3.2. - Control CTC
%EdubotSimulateModel('CTC',rob, time,Q, vQ, aQ, {Kp Kv});
%EdubotSimulateModel('CTC',rob, time,Q, vQ, aQ, {Kp Kv Mdyn_est});
% a) Sintonizar el PD con los valores obtenidos en el trabajo previo
Kp = 100;  % wn^2
Kv = 20;   % 2*d*wn
EdubotSimulateModel('CTC', rob, time, Q, vQ, aQ, {Kp Kv});

%% b) Suponer que el robot levanta una carga mc = 0.5kg
% b1) Generar la nueva matriz dinámica del robot Mdyn
% Modificamos Mdyn
Mdyn(2, 6) = Mdyn(2, 6) + 0.5; % m2+mc
%Creacion nuevo robot
rob = robot(Mdyn);
rob.gravity = [0 -9.8 0]';

% b2) Generar Mdyn_est que no considere la carga
Mdyn_est = Mdyn;
Mdyn_est(2, 6) = Mdyn_est(2, 6) - 0.5;

% b3) Simular el CTC definido por Mdyn_est
EdubotSimulateModel('CTC', rob, time, Q, vQ, aQ, {Kp Kv Mdyn_est});

%% 6.3.4. Control Dinámico del robot personal
%% Robot personal - LRMate200iD

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

probot=robot(Mdyn)     % Creacion de mi robot personal
probot.gravity = [0 -9.8 0]';

%% Robot personal 3DGL
% Debido a que los tres últimos elementos giran mucho no se ha podido 
%generar la trayectoria. Por ello se ha pasado a un robot de 3 GDL 
%eliminando los elementos de la punta.

Mdyn = [ -pi/2 l2  0      l1    0 m1 px1 py1 pz1 Ixx1 Iyy1 Izz1 0 0 0 0 1 0 0 0
         0     l3  -pi/2  0     0 m2 px2 py2 pz2 Ixx2 Iyy2 Izz2 0 0 0 0 1 0 0 0
         -pi/2 l4  0      0     0 m3 px3 py3 pz3 Ixx3 Iyy3 Izz3 0 0 0 0 1 0 0 0];

probot=robot(Mdyn)     % Creacion de mi robot personal
probot.gravity = [0 -9.8 0]';

%% 6.3.4.1 Generar trayectoria referencia
% Puntos en el espacio cartesiano
P1=[0.2 0.2 0.3]; %m
P2=[0.2 0.2 0.2]; %m
P3=[0.3 0.2 0.2]; %m
P4=[0.3 0.2 0.3]; %m
% Matrices de transformacion
T1=transl(P1);
T2=transl(P2);
T3=transl(P3);
T4=transl(P4);
% Mediante la cinemática inversa obtener las configuraciones 
%articulares
q0=[0 0 0 0 0 0];
q1=ikine(probot,T1,q0);
q2=ikine(probot,T2,q0);
q3=ikine(probot,T3,q0);
q4=ikine(probot,T4,q0);


% Interpolar la trayectoria rectangular usando el interpolador 
% parabólico parab y plotear las trayectorias mediante el comando subplot3.
QArray=[ q1' q2' q3' q4' q1'];

%% Qarray modificado a mano

QArray = [10.2102   -8.6394   -2.5536    6.8712   10.2102;
          -7.1393  -26.3128   -2.8615   -5.4441   -7.1393;
           2.7818    2.9373    0.1477    0.6415    2.7818;
            0.2     -0.8       0.5       0.7       0.1;
           -0.1       0.3       0.1       0.1       0.1;
           -0.2      0.1       -0.1       -0.8      0.2]

%%
t0=0;               %Tiempo inicial
ac=5*ones(6, 5);    % Aceleración
tij=1*ones(1, 4);   % Tiempo entre puntos a interpolar
step=1e-2;          % Discretización
[Qcoef, time,Q, vQ, aQ, intervs] = parab(QArray, ac, t0, tij, step);

%% 6.3.4.2 Sintonizar CTC
d = 1;        % críticamente amortiguado
wn = 5;       % rad/s
Kp = wn^2;    % wn^2
Kv = 2*d*wn;
%% 6.3.4.3  CTC
EdubotSimulateModel('CTC', probot, time, Q, vQ, aQ, {Kp Kv});