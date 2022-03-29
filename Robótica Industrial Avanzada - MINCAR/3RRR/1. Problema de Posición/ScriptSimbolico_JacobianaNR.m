%Script para el cálculo de las Jacobiana N-R

%% Declaración de variables simbólicas

syms qa1 qa2 qa3 real;

syms x y tz  real;

syms l1 l2 l3 real;
syms L1 L2 L3 real;

syms a1x a1y real;
syms a2x a2y real;
syms a3x a3y real;

syms d1x d1y real;
syms d2x d2y real;
syms d3x d3y real;

%% Vectores

a1=[a1x ;a1y];
a2=[a2x ;a2y];
a3=[a3x ;a3y];

d1=[d1x ;d1y];
d2=[d2x ;d2y];
d3=[d3x ;d3y];

P=[x;y];

%% Conjuntos de variables

X=[x;y;tz];


%% Cálculo de la Ecuacion fi(x,qai)=0 % Se puede meter de esta forma o definiendo los vectores

 f=[...
     (a1x - x + L1*cos(qa1) - d1x*cos(tz) + d1y*sin(tz))^2 - l1^2 + (y - a1y - L1*sin(qa1) + d1y*cos(tz) + d1x*sin(tz))^2
     (a2x - x + L2*cos(qa2) - d2x*cos(tz) + d2y*sin(tz))^2 - l2^2 + (y - a2y - L2*sin(qa2) + d2y*cos(tz) + d2x*sin(tz))^2
     (a3x - x + L3*cos(qa3) - d3x*cos(tz) + d3y*sin(tz))^2 - l3^2 + (y - a3y - L3*sin(qa3) + d3y*cos(tz) + d3x*sin(tz))^2
    ];

%% Jacobiana

J= jacobian (f,X)



