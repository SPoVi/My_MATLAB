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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% FIN NO MODIFICAR
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Matriz de inercias

Dq = [                        mC + mD1 + mL1,                   0, - L1*mC*sin(qna1) - LcL1*mL1*sin(qna1),                   0;
                                          0,           mD2 + mL2,                                      0, -LcL2*mL2*sin(qna2) ;
      - L1*mC*sin(qna1) - LcL1*mL1*sin(qna1),                   0,        mC*L1^2 + mL1*LcL1^2 + IC + IL1,                   0;
                                           0, -LcL2*mL2*sin(qna2),                                      0,    mL2*LcL2^2 + IL2];

% Matriz de gravedad

Gq = [0, 0, g*cos(qna1)*(L1*mC + LcL1*mL1), LcL2*g*mL2*cos(qna2)]';

% Matriz de Coriolis

Cq = [                                        0,                               0,    -vqna1*cos(qna1)*(L1*mC + LcL1*mL1),                            0;
                                              0,                               0,                                      0,    -LcL2*mL2*vqna2*cos(qna2);
      -(3*vqna1*cos(qna1)*(L1*mC + LcL1*mL1))/2,                               0, -(vqa1*cos(qna1)*(L1*mC + LcL1*mL1))/2,                            0;
                                              0, -(3*LcL2*mL2*vqna2*cos(qna2))/2,                                      0, -(LcL2*mL2*vqa2*cos(qna2))/2];
                                          

T = [                                                         1,                                                          0;
                                                              0,                                                          1;
    -cos(qna2)/(L1*(cos(qna1)*sin(qna2) - cos(qna2)*sin(qna1))), cos(qna2)/(L1*(cos(qna1)*sin(qna2) - cos(qna2)*sin(qna1)));
    -cos(qna1)/(L2*(cos(qna1)*sin(qna2) - cos(qna2)*sin(qna1))), cos(qna1)/(L2*(cos(qna1)*sin(qna2) - cos(qna2)*sin(qna1)))];

dT =[                                                                                               0,                                                                                                 0;
                                                                                                    0,                                                                                                 0;
     (vqna1*cos(qna1) - 2*vqna2*cos(qna1) + vqna1*cos(qna1 - 2*qna2))/(L1*(cos(2*qna1 - 2*qna2) - 1)), -(vqna1*cos(qna1) - 2*vqna2*cos(qna1) + vqna1*cos(qna1 - 2*qna2))/(L1*(cos(2*qna1 - 2*qna2) - 1));
    -(vqna2*cos(2*qna1 - qna2) - 2*vqna1*cos(qna2) + vqna2*cos(qna2))/(L2*(cos(2*qna1 - 2*qna2) - 1)),  (vqna2*cos(2*qna1 - qna2) - 2*vqna1*cos(qna2) + vqna2*cos(qna2))/(L2*(cos(2*qna1 - 2*qna2) - 1))];

% Se omite la parte de Gx, Dx y Cx, no hay

% Modelo en términos de qa

D = T' * Dq * T;
C = T' * (Dq * dT + Cq * T);
G = T' * Gq;

tauqa = D * aqa + C * vqa + G;

OK=1;
