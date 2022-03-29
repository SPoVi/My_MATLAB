function [OK,tauqa]=funIDM_Ex21(Parametros,aqa,vq,q)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Calcula el IDM del robot del Examen de 19/04/21
%          
% %-Input
%   -Parametros : Estructura de parámetros que contiene los parámetros
%   cinemáticos y dinámicos del robot según Parametros=Ex21_ParametrosRobot
%   -aqa=[aqa1 aqa2]', vector 2x1 con las aceleraciones de las variables actuadas
%   -vq=[vqa1 vqa2 vqna1 vqna2]', vector 4x1 con las velocidades de las  variables articulares
%   -q=[qa1 qa2 qna1 qna2]', vector 4x1 con las posiciones de las  variables articulares
%-Output:
%   -OK, será =1 si todo ha ido correctamente, o 0 si no existe solución
%   -tauqa =[tauqa1 tauqa2]', vector 2x1 con los pares de las variables actuadas

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% NO MODIFICAR
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Inicialización

tauqa=[];
OK=0;

%Desglose de parámetros

L1=Parametros.L1;
L2=Parametros.L2;
LcL1=Parametros.LcL1;
LcL2=Parametros.LcL2;

mL1=Parametros.mL1;
mL2=Parametros.mL2;
mD1=Parametros.mD1;
mD2=Parametros.mD2;
mC=Parametros.mC;

IL1=Parametros.IL1;
IL2=Parametros.IL2;
IC=Parametros.IC;

g=Parametros.g;

%Desglose de variables de entrada
qa1=q(1); 
qa2=q(2); 
qna1=q(3); 
qna2=q(4); 

vqa1=vq(1); 
vqa2=vq(2); 
vqna1=vq(3); 
vqna2=vq(4); 

vqa=[vqa1;vqa2];

% MATRICES DINAMICAS Q
Cq = [  [                           0, 0,    -L1*mC*vqna1*cos(qna1), 0]
        [                           0, 0,                         0, 0]
        [-(3*L1*mC*vqna1*cos(qna1))/2, 0, -(L1*mC*vqa1*cos(qna1))/2, 0]
        [ -3*LcL2*mL2*vqna2*cos(qna2), 0,                         0, 0]];

Gq = [                                       0
                                             0
                        L1*g*mC*cos(qna1) + LcL1*g*mL1*cos(qna1)
                                 LcL2*g*mL2*cos(qna2)];

Dq = [  [             mC + mD1,   0, -L1*mC*sin(qna1),     0]
        [                2*mL2, mD2,                0,     0]
        [     -L1*mC*sin(qna1),   0,    mC*L1^2 + IL1,     0]
        [-2*LcL2*mL2*sin(qna2),   0,                0, 2*IL2]];


[OK,dT] = funJacobianasAceleracion_Ex21(Parametros,q, vq);
aq = dT*aqa;

T = Dq*aq + Cq*vq + Gq;

D = T'*Dq*T;
C = T'*(Dq*dT+Cq*T);
G = T'*Gq;
tauqa = D*aqa + C*vqa + G;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% FIN NO MODIFICAR
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
OK=1;
