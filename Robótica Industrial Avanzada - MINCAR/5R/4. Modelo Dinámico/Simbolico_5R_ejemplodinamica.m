%Dinámica simbólico 5R

%% Variables cinemáticas

syms qa1 qa2  real;
syms qna1 qna2  real;

syms x y real;

syms vqa1 vqa2 real;
syms vqna1 vqna2 real;

syms vx vy real;

%% Parámetros

syms L1 L2 l1 l2 real;
syms a1x a1y a2x a2y real;

syms LcL1 Lcl1  LcL2  Lcl2   real;
syms mL1 mL2 ml1 ml2 real;
syms IL1 IL2 Il1 Il2 real;

syms g real;

%% Agrupaciones de variables y vectores

% Vector OAi de posición de los motores
a1=[a1x;a1y];
a2=[a2x;a2y];

% Vector de velocidades

vqa=[vqa1 vqa2]';
vqna=[vqna1 vqna2]';

vq=[vqa;vqna];

%Vector de variables articulares
q=[qa1 qa2 qna1 qna2]';

%% Cálculo de Energias:  Elemento  L1
%**************************************************************************

% Energia Cinética ========================================================

%Centro de masas

CML1=a1+LcL1*[cos(qa1); sin(qa1)];

vCML1=diff(CML1,qa1)*vqa1;

EcL1=0.5*mL1*vCML1'*vCML1+0.5*IL1*vqa1^2;

EcL1=simplify (EcL1); 

% Se puede hacer lo mismo de forma estructurada: 
EvCML1=jacobian(CML1,q);
EWCML1=[ 1 0 0 0];
ML1=simplify(mL1*EvCML1'*EvCML1+IL1*EWCML1'*EWCML1);
% EcL1= 0.5*vq'*ML1*vq
% Para validar: simplify(EcL1-0.5*vq'*ML1*vq)

% Energía Potencial========================================================

EpL1=g*mL1* CML1(2); 

%% Cálculo de Energias:  Elemento  L2
%**************************************************************************

% Energia Cinética ========================================================

%Centro de masas

CML2=a2+LcL2*[cos(qa2); sin(qa2)];

vCML2=diff(CML2,qa2)*vqa2;

EcL2=0.5*mL2*vCML2'*vCML2+0.5*IL2*vqa2^2;

EcL2=simplify(EcL2);

% Se puede hacer lo mismo de forma estructurada: 
EvCML2=jacobian(CML2,q);
EWCML2=[ 0 1 0 0];
ML2=simplify(mL2*EvCML2'*EvCML2+IL2*EWCML2'*EWCML2);
% EcL2= 0.5*vq'*ML2*vq
% Para validar: simplify(EcL2-0.5*vq'*ML2*vq)

% Energía Potencial========================================================

EpL2=g*mL2* CML2(2); 


%% Cálculo de Energias:  Elemento  l1
%**************************************************************************

% Energia Cinética ========================================================

%Centro de masas

CMl1=a1+L1*[cos(qa1); sin(qa1)]+Lcl1*[cos(qa1+qna1); sin(qa1+qna1)];

vCMl1=diff(CMl1,qa1)*vqa1+diff(CMl1,qna1)*vqna1;

Ecl1=0.5*ml1*vCMl1'*vCMl1+0.5*Il1*(vqa1+vqna1)^2;
Ecl1=simplify (Ecl1);

% Se puede hacer lo mismo de forma estructurada: 
EvCMl1=jacobian(CMl1,q);
EWCMl1=[ 1 0 1 0];
Ml1=simplify(ml1*EvCMl1'*EvCMl1+Il1*EWCMl1'*EWCMl1);
% Ecl1= 0.5*vq'*Ml1*vq
% Para validar: simplify(Ecl1-0.5*vq'*Ml1*vq)

% Energía Potencial========================================================

Epl1=g*ml1* CMl1(2); 

%% Cálculo de Energias:  Elemento  l2
%**************************************************************************

% Energia Cinética ========================================================

%Centro de masas

CMl2=a2+L2*[cos(qa2); sin(qa2)]+Lcl2*[cos(qa2+qna2); sin(qa2+qna2)];

vCMl2=diff(CMl2,qa2)*vqa2+diff(CMl2,qna2)*vqna2;

Ecl2=0.5*ml2*vCMl2'*vCMl2+0.5*Il2*(vqa2+vqna2)^2;

Ecl2=simplify (Ecl2);


% Se puede hacer lo mismo de forma estructurada:  
EvCMl2=jacobian(CMl2,q);
EWCMl2=[ 0 1 0 1];
Ml2=simplify(ml2*EvCMl2'*EvCMl2+Il2*EWCMl2'*EWCMl2);
% Ecl2= 0.5*vq'*Ml2*vq
% Para validar: simplify(Ecl2-0.5*vq'*Ml2*vq)


% Energía Potencial========================================================

Epl2=g*ml2* CMl2(2); 

%% Falta introducir la carga, se supone que no hay carga.


%% Matriz de Masas o Inercias

% Si Ejecutamos el script y representamos las Energías cinéticas simpfificads
% las  podemos representar en la forma 0.5*vq'*M*vq

%Términos vqa1^2
M(1,1)=IL1 +mL1*LcL1^2+Il1+L1^2*ml1+Lcl1^2*ml1+2*L1*Lcl1*ml1*cos(qna1);
%Terminos vqa2^2
M(2,2)=IL2 +mL2*LcL2^2+Il2+L2^2*ml2+Lcl2^2*ml2+2*L2*Lcl2*ml2*cos(qna2);
%Términos vqna1^2
M(3,3)=Il1+Lcl1^2*ml1;
%Términos vqna2^2
M(4,4)=Il2+Lcl2^2*ml2;
%Términos vqa1*vqna1
M(1,3)=Il1+Lcl1^2*ml1+L1*Lcl1*ml1*cos(qna1);
%Términos vqna1*vqa1
M(3,1)=M(1,3);
%Términos vqa2*vqna2
M(2,4)=Il2+Lcl2^2*ml2+L2*Lcl2*ml2*cos(qna2);
%Términos vqna2*vqa2
M(4,2)=M(2,4);


% Forma estructurada: M=ML1+ML2+Ml1+Ml2; 
% Para validar: M-(ML1+ML2+Ml1+Ml2)

%% Cálculo de las Matrices Dinámicas de forma estructurada

% Matriz de Inercias
D=M;


% Matriz de Coriolis

%dM/dt
C1=simplify(diff(M,qa1)*vqa1+diff(M,qa2)*vqa2+diff(M,qna1)*vqna1+diff(M,qna2)*vqna2);

%0.5*vq'*\partial M/\partial q
C2=0.5*[vq'*diff(M,qa1) ; vq'*diff(M,qa2) ; vq'*diff(M,qna1) ; vq'*diff(M,qna2)];

C=C1+C2;

% Matriz de Gravedad

Ep=EpL1+EpL2+Epl1+Epl2;

G=[ diff(Ep, qa1)
    diff(Ep, qa2)
    diff(Ep, qna1)
    diff(Ep, qna2)];





