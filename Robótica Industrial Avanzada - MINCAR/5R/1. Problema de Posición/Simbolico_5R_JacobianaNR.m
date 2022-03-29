%Cinemática Simbólico 5R==> Jacobiana NR

%% Variables necesarias
%Coordenadas articulares activas y pasivas
syms qa1 qa2 real;

%Coordenadas de salida
syms x y  real;

%Longitudes de las barras
syms l1 l2 real;
syms L1 L2 real;

%Posición de los puntos A1 y A2
syms OAx1 OAy1 real;
syms OAx2 OAy2 real;

X=[x;y]

%Vectores

va1=[OAx1 OAy1]'; %Vector A1
va2=[OAx2 OAy2]'; %Vector A2

vL1=[L1*cos(qa1); L1*sin(qa1)]; %Vector L1
vL2=[L2*cos(qa2); L2*sin(qa2)]; %Vector L2

vpx=[x;y]; %Vector de px


%% Ecuación de cierre f(x,qa)

EcCierre=[...
    (va1+vL1-vpx)'*(va1+vL1-vpx)-l1^2
    (va2+vL2-vpx)'*(va2+vL2-vpx)-l2^2];


%% Jacobiana

J=jacobian(EcCierre,X)