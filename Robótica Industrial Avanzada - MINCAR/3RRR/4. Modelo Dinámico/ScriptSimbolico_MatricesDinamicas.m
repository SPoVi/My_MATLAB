%Script para el cálculo de las matrices dinámicas

%% Variables de entrada y salida

syms qa1 qa2 qa3 real;
syms qna1 qna2 qna3 real;
syms x y z tz real


syms vqa1 vqa2 vqa3 real;
syms vqna1 vqna2 vqna3 real;
syms vx vy vz vtz real;

%% Agrupaciones

X=[x;y;tz];                 %Posiciones
qa= [ qa1 ; qa2  ; qa3 ];
qna=[qna1 ; qna2 ; qna3];
q=[qa;qna];

vX=[vx;vy;vtz];             %Velocidades
vqa= [vqa1 ; vqa2  ; vqa3 ];
vqna=[vqna1 ;vqna2 ; vqna3];
vq=[vqa;vqna];



%% Parámetros del robot

syms a1x a1y real; %Puntos fijos
syms a2x a2y real;
syms a3x a3y real;

a1=[a1x ;a1y];  
a2=[a2x ;a2y];
a3=[a3x ;a3y];


syms d1x d1y real; %Geometria plataforma
syms d2x d2y real;
syms d3x d3y real;


d1=[d1x ;d1y];
d2=[d2x ;d2y];
d3=[d3x ;d3y];

syms l1 l2 l3 real; %Longitudes elementos
syms L1 L2 L3 real;

syms Lcl1  Lcl2  Lcl3 real; % Centros de gravedad
syms LcL1  LcL2  LcL3 real;

syms mL1 mL2 mL3 real;  %Masas
syms ml1 ml2 ml3 real;
syms mp real;

syms IL1 IL2 IL3 real; %Inercias respecto de z (caso plano)
syms Il1 Il2 Il3 real;
syms Ip real;

syms g real;    %Gravedad


%% Cálculo de matrices de masa  Mi y energía potencial Ui

% Cadena serie 1 - Elemento L1 ============================================

CML1=a1+LcL1*[cos(qa1); sin(qa1)];

%Velocidad del CM:
EvCML1=jacobian(CML1,q);
EWCML1=[ 1 0 0 0 0 0];

ML1=simplify(mL1*EvCML1'*EvCML1+IL1*EWCML1'*EWCML1);

UML1=g*mL1* CML1(2);

% Cadena serie 1 - Elemento l1 ============================================

CMl1=a1+ L1*[cos(qa1); sin(qa1)]+Lcl1*[cos(qa1+qna1); sin(qa1+qna1)];

%Velocidad del CM:
EvCMl1=jacobian(CMl1,q);
EWCMl1=[ 1 0 0 1 0 0];

Ml1=simplify(ml1*EvCMl1'*EvCMl1+Il1*EWCMl1'*EWCMl1);

UMl1= g*ml1*CMl1(2);

% Cadena serie 2 - Elemento L2 ============================================

CML2=a2+LcL2*[cos(qa2); sin(qa2)];

%Velocidad del CM:
EvCML2=jacobian(CML2,q);
EWCML2=[ 0 1 0 0 0 0];

ML2=simplify(mL2*EvCML2'*EvCML2+IL2*EWCML2'*EWCML2);

UML2=g*mL2* CML2(2);

% Cadena serie 2 - Elemento l2 ============================================

CMl2=a2+ L2*[cos(qa2); sin(qa2)]+Lcl2*[cos(qa2+qna2); sin(qa2+qna2)];

%Velocidad del CM:
EvCMl2=jacobian(CMl2,q);
EWCMl2=[ 0 1 0 0 1 0];

Ml2=simplify(ml2*EvCMl2'*EvCMl2+Il2*EWCMl2'*EWCMl2);

UMl2= g*ml2*CMl2(2);

% Cadena serie 3 - Elemento L3 ============================================

CML3=a3+LcL3*[cos(qa3); sin(qa3)];

%Velocidad del CM:
EvCML3=jacobian(CML3,q);
EWCML3=[ 0 0 1 0 0 0];

ML3=simplify(mL3*EvCML3'*EvCML3+IL3*EWCML3'*EWCML3);

UML3=g*mL3* CML3(2);

% Cadena serie 3 - Elemento l3 ============================================

CMl3=a3+ L3*[cos(qa3); sin(qa3)]+Lcl3*[cos(qa3+qna3); sin(qa3+qna3)];

%Velocidad del CM:
EvCMl3=jacobian(CMl3,q);
EWCMl3=[ 0 0 1 0 0 1];

Ml3=simplify(ml3*EvCMl3'*EvCMl3+Il3*EWCMl3'*EWCMl3);

UMl3= g*ml3*CMl3(2);

% Plataforma  =============================================================

Mp=[(mp)*eye(2) zeros(2,1); zeros(1,2) (Ip) ];

Up=(mp)*g*y;

%% Cálculo de matrices de inercia de subsistemas

%% Matriz de Masas

Dq=simplify(ML1+ML2+ML3+Ml1+Ml2+Ml3)

% No incluimos la de la plataforma ¡¡¡¡ Depende de las otras coord ¡¡¡ 

% Si no se realiza de forma estructura se puede visualizar las energías
% cinéticas e ir sacando los parámteros:

%Términos vqa1^2
%Dq(1,1)= mL1*LcL1^2 + IL1 + ml1*L1^2 + 2*ml1*cos(qna1)*L1*Lcl1 + ml1*Lcl1^2 + Il1 ;
%Terminos vqa2^2
%Dq(2,2)=mL2*LcL2^2 + IL2 + ml2*L2^2 + 2*ml2*cos(qna2)*L2*Lcl2 + ml2*Lcl2^2 + Il2;
%Terminos vqa3^2
%Dq(3,3)= mL3*LcL3^2 + IL3 + ml3*L3^2 + 2*ml3*cos(qna3)*L3*Lcl3 + ml3*Lcl3^2 + Il3; 
%Términos vqna1^2
%Dq(4,4)=ml1*Lcl1^2 + Il1;
%Terminos vqna2^2
%Dq(5,5)=ml2*Lcl2^2 + Il2;
%Terminos vqna3^2
%Dq(6,6)=ml3*Lcl3^2 + Il3;

%Dq: Términos cruzados==> Son simétricos

%Términos vqa1*vqna1
%Dq(1,4)=ml1*Lcl1^2 + L1*ml1*cos(qna1)*Lcl1 + Il1;
%Términos vqna1*vqa1
%Dq(4,1)=Dq(1,4);

%Términos vqa2*vqna2
%Dq(2,5)=ml2*Lcl2^2 + L2*ml2*cos(qna2)*Lcl2 + Il2;
%Términos vqna2*vqa2
%Dq(5,2)=Dq(2,5);

%Términos vqa3*vqna3
%Dq(3,6)= ml3*Lcl3^2 + L3*ml3*cos(qna3)*Lcl3 + Il3;
%Términos vqna3*vqa3
%Dq(6,3)=Dq(3,6);


% Dx

Dx=Mp   % PLATAFORMA ¡¡¡¡¡


%% Cálculo de vector de gravedad de subsistemas

U=simplify(UML1+UML2+UML3+UMl1+UMl2+UMl3);
Gq=[diff(U,qa1);diff(U,qa2);diff(U,qa3);diff(U,qna1);diff(U,qna2);diff(U,qna3)]

Gx=[diff(Up,x);diff(Up,y);diff(Up,tz)] 

%% Cálculo de matriz de Coriolis

%Se realiza automáticamente a partir de Dx y Dq

%C(a,va)=dD(a,va)-0.5*[va'*diff(D,a)]

dDq=diff(Dq,qa1)*vqa1   + diff(Dq,qa2)*vqa2   + diff(Dq,qa3)*vqa3 +...
    diff(Dq,qna1)*vqna1 + diff(Dq,qna2)*vqna2 + diff(Dq,qna3)*vqna3;

pDq=[vq'*diff(Dq,qa1);
     vq'*diff(Dq,qa2); 
     vq'*diff(Dq,qa3);      
     vq'*diff(Dq,qna1);
     vq'*diff(Dq,qna2);
     vq'*diff(Dq,qna3)     
     ];

Cq=simplify(dDq+0.5*pDq)


dDx=diff(Dx,x)*vx   + diff(Dx,y)*vy   + diff(Dx,tz)*vtz;
pDx=[vX'*diff(Dx,x);
     vX'*diff(Dx,y); 
     vX'*diff(Dx,tz)         
     ];
Cx=simplify(dDx+0.5*pDx)







