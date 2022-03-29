%%%%%%%%%% Modelo Dinámico del robot 3RPR %%%%%%%%%%
%%% Calcula en Simbólico las matrices que definen la dinámica del robot 3RPR

%% Parámetros

%Parámetros cinemátiocs

syms qa1 qa2 qa3 real;
syms qna1 qna2 qna3 real;

syms x y  real;
syms tz;

syms vqa1 vqa2 vqa3 real;
syms vqna1 vqna2 vqna3 real;
syms vx vy vtz real;

syms L1 L2 L3 real;

syms OAx1 OAy1 real;
syms OAx2 OAy2 real;
syms OAx3 OAy3 real;

syms d1x d2x d3x real;
syms d1y d2y d3y real;

%Parámetros dinámicos

syms LcL1 Lcl1  LcL2  Lcl2  LcL3  Lcl3 real;
syms mL1 mL2 mL3 ml1 ml2 ml3 real;
syms IL1 IL2 IL3 Il1 Il2 Il3 real;
syms mp Ip;

syms g real;

%% Vectores

a1=[OAx1; OAy1];
a2=[OAx2; OAy2];
a3=[OAx3; OAy3];

%% Energía potencial y cinética de la plataforma
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

vX=[vx;vy;vtz];
X=[x;y;tz]
% Energía cinética

Mx=[(mp)*eye(2)  zeros(2,1); zeros(1,2) (Ip) ];

Kx=0.5*vX'*Mx*vX;

% Energía Potencial

Ux=(mp)*g*y;

%% Matriz de Inercia

Dx=Mx

%% Matriz de Coriolis

%Derivada:

dDx=simplify(diff(Dx,'x')*vx+diff(Dx,'y')*vy+diff(Dx,'tz')*vtz)

O=zeros(1,3);

UM=simplify(  [...
            vX' O O ;
            O vX' O ;
            O O vX']*...
            [diff(Dx,'x')     diff(Dx,'y')     diff(Dx,'tz')]')
         
Cx=simplify(0.5*(dDx+UM'-UM))

%% Matriz de Gravedad

Gx=[diff(Ux,'x');diff(Ux,'y');diff(Ux,'tz')]


%% Energía potencial y cinética de los brazos serie
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

vqa=[vqa1 vqa2 vqa3]';
vqp=[vqna1 vqna2 vqna3]';

vq=[vqa;vqp];

q=[qa1 qa2 qa3 qna1 qna2 qna3]';

%% Masa L1
%**************************************************************************

%Centro de masas

CML1=a1+LcL1*[cos(qna1); sin(qna1)];

%Velocidad del CM:
EvCML1=jacobian(CML1,q);
vCML1=simplify(EvCML1*vq);

W=qna1;
EWCML1=jacobian(W,q);

M=mL1*eye(2);%definida para 0.5*[vcm1 vcm2]*M*[vcm1;vm2]

I=IL1;

%Por lo tanto:

ML1=simplify(EvCML1'*M*EvCML1+EWCML1'*I*EWCML1) ;

%UL1
%U=mgh, donde h es el componente y:

UML1=g*mL1* CML1(2);


%% Masa L2
%**************************************************************************

%Centro de masas

CML2=a2+LcL2*[cos(qna2); sin(qna2)];

%Velocidad del CM:
EvCML2=jacobian(CML2,q);
vCML2=simplify(EvCML2*vq);

W=qna2;
EWCML2=jacobian(W,q);
%EcL1:
%Ec=0.5*v'*M*v+0.5*tz'*I*tz

M=mL2*eye(2);%definida para 0.5*[vcm1 vcm2]*M*[vcm1;vm2]

I=IL2;

%Por lo tanto:

ML2=simplify(EvCML2'*M*EvCML2+EWCML2'*I*EWCML2) ;

%UL1
%U=mgh, donde h es el componente y:

UML2=g*mL2* CML2(2);

%% Masa L3
%**************************************************************************

%Centro de masas

CML3=a3+LcL3*[cos(qna3); sin(qna3)];

%Velocidad del CM:
EvCML3=jacobian(CML3,q);
vCML3=simplify(EvCML3*vq);

W=qna3;
EWCML3=jacobian(W,q);
%EcL1:
%Ec=0.5*v'*M*v+0.5*tz'*I*tz

M=mL3*eye(2);%definida para 0.5*[vcm1 vcm2]*M*[vcm1;vm2]

I=IL3;

%Por lo tanto:

ML3=simplify(EvCML3'*M*EvCML3+EWCML3'*I*EWCML3) ;

%UL1
%U=mgh, donde h es el componente y:

UML3=g*mL3* CML3(2);




%% Masa l1
%**************************************************************************

%Centro de masas:

CMl1=a1+(L1+qa1-Lcl1)*[cos(qna1); sin(qna1)];


%Velocidad del centro de masas
EvCMl1=jacobian(CMl1,q);

vCMl1=simplify(EvCMl1*vq)
W=qna1;
EWCMl1=jacobian(W,q);
%Energía cinética 
%===============

%Ec=0.5*v'*M*v+0.5*tz'*I*tz

M=ml1*eye(2);
I=Il1;

Ml1=simplify(EvCMl1'*M*EvCMl1+EWCMl1'*I*EWCMl1);

%Energía potencial 
%=================

%U=mgh, donde h es el componente y:
UMl1=g*ml1*CMl1(2);


%% Masa l2
%**************************************************************************

%Centro de masas:

CMl2=a2+(L2+qa2-Lcl2)*[cos(qna2); sin(qna2)];

%Velocidad del centro de masas
EvCMl2=jacobian(CMl2,q);

vCMl2=simplify(EvCMl2*vq)
W=qna2;
EWCMl2=jacobian(W,q);
%Energía cinética 
%===============

%Ec=0.5*v'*M*v+0.5*tz'*I*tz

M=ml2*eye(2);
I=Il2;

Ml2=simplify(EvCMl2'*M*EvCMl2+EWCMl2'*I*EWCMl2);

%Energía potencial 
%=================

%U=mgh, donde h es el componente y:
UMl2=g*ml2*CMl2(2);

%% Masa l3
%**************************************************************************

%Centro de masas:

CMl3=a3+(L3+qa3-Lcl3)*[cos(qna3); sin(qna3)];


%Velocidad del centro de masas
EvCMl3=jacobian(CMl3,q);

vCMl3=simplify(EvCMl3*vq)
W=qna3;
EWCMl3=jacobian(W,q);
%Energía cinética 
%===============

%Ec=0.5*v'*M*v+0.5*tz'*I*tz

M=ml3*eye(2);
I=Il3;

Ml3=simplify(EvCMl3'*M*EvCMl3+EWCMl3'*I*EWCMl3);

%Energía potencial 
%=================

%U=mgh, donde h es el componente y:
UMl3=g*ml3*CMl3(2);



%% Matriz de inercia

Dq=ML1+ML2+ML3+Ml1+Ml2+Ml3;

%% Matriz de Coriolis

%Derivada:

dDq=simplify(diff(Dq,'qa1')*vqa1+diff(Dq,'qa2')*vqa2+diff(Dq,'qa3')*vqa3+diff(Dq,'qna1')*vqna1+diff(Dq,'qna2')*vqna2+diff(Dq,'qna3')*vqna3)

O=zeros(1,6);

UM=simplify(  [...
            vq' O O O O O;
            O vq' O O O O;
            O O vq' O O O;
            O O O vq' O O;
            O O O O vq' O;
            O O O O O vq']*...
            [diff(Dq,'qa1')     diff(Dq,'qa2')     diff(Dq,'qa3') diff(Dq,'qna1') diff(Dq,'qna2')  diff(Dq,'qna3')]')
         
Cq=simplify(0.5*(dDq+UM'-UM))

%% Matriz de gravedad

U=simplify(UML1+UML2+UML3+UMl1+UMl2+UMl3);

Gq=[diff(U,'qa1');diff(U,'qa2');diff(U,'qa3');diff(U,'qna1');diff(U,'qna2');diff(U,'qna3')]

