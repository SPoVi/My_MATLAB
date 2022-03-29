
%Script para el cálculo de las Jacobianas de velocidad 

%% Declaración de variables simbólicas

syms qa1 qa2 qa3 real;
syms qna1 qna2 qna3 real;

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
qa= [ qa1 ; qa2  ; qa3 ];
qna=[qna1 ; qna2 ; qna3];

%% Variables articulares de cada cadena cinemática

q1=[qa1; qna1];
q2=[qa2; qna2];
q3=[qa3; qna3];


%% Cálculo de las ecuaciones de cierre vectoriales

%   Código del alumno aquí
R=[cos(tz) -sin(tz); sin(tz) cos(tz)];
EC1=a1+[L1*cos(qa1);L1*sin(qa1)]+[l1*cos(qa1+qna1);l1*sin(qa1+qna1)]-R*d1-P;
EC2=a2+[L2*cos(qa2);L2*sin(qa2)]+[l2*cos(qa2+qna2);l2*sin(qa2+qna2)]-R*d2-P;
EC3=a3+[L3*cos(qa3);L3*sin(qa3)]+[l3*cos(qa3+qna3);l3*sin(qa3+qna3)]-R*d3-P;

%% Cálculo de las Jacobianas

%   Código del alumno aquí
Jx1=jacobian(EC1,X)		
Jx2=jacobian(EC2,X)			
Jx3=jacobian(EC3,X)	

Jq1=jacobian(EC1,q1)			
Jq2=jacobian(EC2,q2)			
Jq3=jacobian(EC3,q3)	





