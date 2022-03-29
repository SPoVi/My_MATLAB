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


%% Energía potencial y cinética 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Dezlizadera 1

CMD1 = [qa1; 0];

EvCMD1 = jacobian(CMD1,q);
      
MD1 = simplify(mD1* EvCMD1' * EvCMD1);

UD1 = 0;

% Dezlizadera 2

CMD2 = [qa2; 0];

EvCMD2 = jacobian(CMD2,q);
      
MD2 = simplify(mD2* EvCMD2' * EvCMD2);

UD2 = 0;

% Brazo 1

CML1 = [qa1; 0] + LcL1 * [cos(qna1); sin(qna1)];

EvCML1 = jacobian(CML1,q);

EwCML1 = [0 0 1 0];

ML1 = simplify(mL1* EvCML1' * EvCML1 + IL1 * EwCML1' * EwCML1);

UL1 = g * mL1 * LcL1 * sin(qna1);
% Brazo 2

CML2 = [qa2; 0] + LcL2 * [cos(qna2); sin(qna2)];

EvCML2 = jacobian(CML2,q);

EwCML2 = [0 0 0 1];

ML2 = simplify(mL2* EvCML2' * EvCML2 + IL2 * EwCML2' * EwCML2);

UL2 = g * mL2 * LcL2 * sin(qna2);

% Extremo

CMC = [qa1; 0] + L1 * [cos(qna1); sin(qna1)];

EvCMC = jacobian(CMC,q);

EwCMC = [0 0 1 0];

MC = simplify(mC* EvCMC' * EvCMC + IC * EwCMC' * EwCMC);

UC = g * mC * L1 * sin(qna1);

%% Matriz de inercia
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

M = MD1 + MD2 + ML1 + ML2 + MC;

Dq = M;

%% Matriz de gravedad
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

U = UD1 + UD2 + UL1 + UL2 + UC;

Gq = jacobian(U,q);
Gq = simplify(Gq);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% NO MODIFICAR
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Matriz de Coriolis

%C(a,va)=dD(a,va)-0.5*[va'*diff(D,a)]

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

Cq=simplify(dDq+0.5*pDq);



