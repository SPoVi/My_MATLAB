function [OK,dT]=funJacobianasAceleracion_Ex21(Parametros,q, vq)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       Calcula la jacobiana dT
%
%-Input
%   -Parametros : Estructura de parámetros que contiene los parámetros
%   cinemáticos y dinámicos del robot según Parametros=Ex21_ParametrosRobot
%   -q=[qa1 qa2 qna1 qna2 ]', vector 4x1 con todas las variables
%   articulares actuadas y no actuadas.
%   -vq=[vqa1 vqa2 vqna1 vqna2 ]', vector 4x1 con las velocidades de todas las variables
%   articulares actuadas y no actuadas.
%-Output:
%   -OK, será =1 si todo ha ido correctamente, o 0 si hay problemas
%   -dT: Jacobiana aq=dT*aqa
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% NO MODIFICAR
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Inicialización
dT=[];
OK=0;

%Desglose de parámetros

L1=Parametros.L1;
L2=Parametros.L2;

%Desglose de variables de entrada
qa1=q(1); 
qa2=q(2); 
qna1=q(3); 
qna2=q(4); 

vqa1=vq(1); 
vqa2=vq(2); 
vqna1=vq(3); 
vqna2=vq(4); 


dT =[... 
[                                                                                                0,                                                                                                 0]
[                                                                                                0,                                                                                                 0]
[ (vqna1*cos(qna1) - 2*vqna2*cos(qna1) + vqna1*cos(qna1 - 2*qna2))/(L1*(cos(2*qna1 - 2*qna2) - 1)), -(vqna1*cos(qna1) - 2*vqna2*cos(qna1) + vqna1*cos(qna1 - 2*qna2))/(L1*(cos(2*qna1 - 2*qna2) - 1))]
[-(vqna2*cos(2*qna1 - qna2) - 2*vqna1*cos(qna2) + vqna2*cos(qna2))/(L2*(cos(2*qna1 - 2*qna2) - 1)),  (vqna2*cos(2*qna1 - qna2) - 2*vqna1*cos(qna2) + vqna2*cos(qna2))/(L2*(cos(2*qna1 - 2*qna2) - 1))]    
];

OK=1;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% FIN NO MODIFICAR
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



