%% Plantilla para el cálculo simbólico de las matrices dinámicas para el Examen de 19/04/21

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% NO MODIFICAR
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Variables simbólicas==> ¡TODOS ESCALARES!

syms qa1 qa2 real;
syms qna1 qna2 real;

syms vqa1 vqa2 real;
syms vqna1 vqna2 real;

syms x y real;
syms vx vy real;

syms L1 L2 LcL1 LcL2 real;

%Masas e inercias

syms mL1 mL2 mD1 mD2 mC real;
syms IL1 IL2 IC real;

syms g real;

q=[qa1;qa2;qna1;qna2];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% FIN NO MODIFICAR
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% CODIFICACIÓN AQUÍ DE LOS CÁLCULOS SIMBÓLICOS NECESARIOS

% ELEMENTO B1
% Centro de masas
CMB1 = [qa1(1);0];
EvCMB1 = jacobian(CMB1,q);
EWCMB1 = [0 0 0 0];
MB1 = simplify(EvCMB1'*mD1*EvCMB1);
EpB1 = 0; 

% ELEMENTO B2
% Centro de masas
CMB2 = [qa2(1);0];
EvCMB2 = jacobian(CMB2,q);
EWCMB2 = [0 0 0 0];
MB2 = simplify(EvCMB2'*mD2*EvCMB2);
EpB2 = 0; 

% ELEMENTO L1
CML1 = [qa1(1);0] + LcL1*[cos(qna1);sin(qna1)];
EvCML1 = jacobian(CML1,q);
EWCML1 = [0 0 1 0];
ML1 = simplify(EvCML1'*mL1*EvCML1 + IL1*EWCML1'*EWCML1);
EpL1 = mL1*g*(CML1(2)); 

% ELEMENTO L2
CML2 = [qa2(1);0] + LcL2*[cos(qna2);sin(qna2)];
EvCML2 = jacobian(CML2,q);
EWCML2 = [0 0 0 1];
ML2 = simplify(EvCML2'*mL2*EvCMB1 + IL2*EWCML2'*EWCML2);
EpL2 = mL2*g*(CML2(2)); 

% ELEMENTO CARGA
CMc = [qa1(1);0] + L1*[cos(qna1);sin(qna1)];
EvCMc = jacobian(CMc,q);
EWCMc = [0 0 1 0];
Mc = simplify(EvCMc'*mC*EvCMc + IL1*EWCMc'*EWCMc);
Epc = mC*g*(CMc(2)); 

%% Energía potencialy cinética 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
M=simplify(MB1+MB2+ML2+ML2+Mc); 

%% Matriz de inercia
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Matriz de Inercias
D=M;

%% Matriz de gravedad
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Matriz de Gravedad
Ep=EpB1+EpB2+EpL1+EpL2+Epc;
G=[diff(Ep,qa1);diff(Ep,qa2);diff(Ep,qna1);diff(Ep,qna2)];


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% NO MODIFICAR
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Matriz de Coriolis

%C(a,va)=dD(a,va)-0.5*[va'*diff(D,a)]
Dq = D;
Gq = G;
vqa=[vqa1 vqa2 ]';
vqna=[vqna1 vqna2 ]';

vq=[vqa;vqna];

dDq=diff(Dq,qa1)*vqa1   + diff(Dq,qa2)*vqa2  +...
    diff(Dq,qna1)*vqna1 + diff(Dq,qna2)*vqna2;

pDq=[vq'*diff(Dq,qa1);
     vq'*diff(Dq,qa2);     
     vq'*diff(Dq,qna1);
     vq'*diff(Dq,qna2);  
     ];

Cq=simplify(dDq+0.5*pDq)


