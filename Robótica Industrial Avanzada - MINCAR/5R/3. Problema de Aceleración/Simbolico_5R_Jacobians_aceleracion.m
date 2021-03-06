%Dinámica simbólico 5R

%% Variables cinemáticas

syms qa1 qa2  real;
syms qna1 qna2  real;

syms x y real;

syms vqa1 vqa2 real;    % Para resolver el problema de aceleración necesitamos conocer las velocidades
syms vqna1 vqna2 real;  % Hay que generarlas en simbolico

syms vx vy real;

%% Parámetros

syms L1 L2 l1 l2 real;
syms a1x a1y a2x a2y real;

%% Agrupaciones de variables y vectores

% Vector OAi de posición de los motores
a1=[a1x;a1y];
a2=[a2x;a2y];

% Vector de velocidades

vqa=[vqa1 vqa2]';
vqna=[vqna1 vqna2]';

vq=[vqa;vqna];

vpx=[vx;vy];

%Vector de variables articulares
q=[qa1 qa2 qna1 qna2]';

px=[x;y];

%% Ecuaciones de Cierre

EC1=a1+L1*[cos(qa1);sin(qa1)]+l1*[cos(qa1+qna1); sin(qa1+qna1)]-px;
EC2=a2+L2*[cos(qa2);sin(qa2)]+l2*[cos(qa2+qna2); sin(qa2+qna2)]-px;

%% Jacobianas de velocidad de las cadenas serie

% Cadena serie 1

q1=[qa1;qna1]; %Variables articulares de la cadena 1
Jq1=jacobian(EC1, q1)

Jx1=jacobian(EC1,px)

% Cadena serie 2

q2=[qa2;qna2]; %Variables articulares de la cadena 1
Jq2=jacobian(EC2, q2)

Jx2=jacobian(EC2,px)

%% Jacobianas de aceleración de las cadenas serie

% Cadena serie 1

dJq1=diff(Jq1, qa1)*vqa1+diff(Jq1, qna1)*vqna1 % En este caso no se utiliza jacobian porque Jq1 no es un vector es una matriz de 2x2, 
                                               % por lo que se deriva uno por uno por cada parámetro
dJx1=diff(Jx1,x)*vx+diff(Jx1,y)*vy

% Cadena serie 2

dJq2=diff(Jq2, qa2)*vqa2+diff(Jq2, qna2)*vqna2

dJx2=diff(Jx2,x)*vx+diff(Jx2,y)*vy



