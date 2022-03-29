function [OK,tau]=UserIDM(Parametros,aqa,X,vX,q,vq)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%           Resuelve el problema dinámico inverso del robot 3RRR
%   Requiere tener resuelta toda la cinemática (q,X, vq y vX)
%
%-Input
%   -Parametros : Estructura de parámetros que contiene los parámetros
%   cinem?ticos y din?micos del robot (desglosado en la cabecera
%   -aqa=[aqa1 aqa2 aqa3]' vector 3x1 que contiene la aceleraci?n de las
%   variables actuadas
%   -X=[x y tz]' vector  3x1  que contiene la posici?n x e y en m del TCP 
%   y su orientaci?n (rad)
%   -vX=[vx vy vtz]' vector  3x1  que contiene las velocidades del TCP
%   -q=[qa1 qa2 qa3 qna1 qna2 qna3]', vector 6x1 con todas las variables
%   articulares.
%   -vq=[vqa1 vqa2 vqa3 vqna1 vqna2 vqna3]', vector 6x1 con la velocidad de
%   las variables articulares
%-Output:
%   -OK, ser? =1 si todo ha ido correctamente, o 0 si no existe soluci?n
%   -tau=[tau1 tau2 tau3]' vector 3x1 con los pares a aplicar en los
%   motores asociados a las variables articulares actuadas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%Inicialización de salidas

OK=0;
tau=[];
detLimit=1e-3;

%% Desglose de parámetros

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Puntos fijos
a1=Parametros.Longitudes.a1;
a2=Parametros.Longitudes.a2;
a3=Parametros.Longitudes.a3;

a1x=a1(1); a1y=a1(2);
a2x=a2(1); a2y=a2(2);
a3x=a3(1); a3y=a3(2);

%Desglose de par?metros: Longitudes
L1=Parametros.Longitudes.L1;
L2=Parametros.Longitudes.L2;
L3=Parametros.Longitudes.L3;

l1=Parametros.Longitudes.l1;
l2=Parametros.Longitudes.l2;
l3=Parametros.Longitudes.l3;

%Desglose de par?metros: Din?micos

LcL1=Parametros.Longitudes.LcL1;
LcL2=Parametros.Longitudes.LcL2;
LcL3=Parametros.Longitudes.LcL3;

Lcl1=Parametros.Longitudes.Lcl1;
Lcl2=Parametros.Longitudes.Lcl2;
Lcl3=Parametros.Longitudes.Lcl3;


IL1=Parametros.Inercias.IL1;
IL2=Parametros.Inercias.IL2;
IL3=Parametros.Inercias.IL3;

Il1=Parametros.Inercias.Il1;
Il2=Parametros.Inercias.Il2;
Il3=Parametros.Inercias.Il3;


mL1=Parametros.Masas.mL1;
mL2=Parametros.Masas.mL2;
mL3=Parametros.Masas.mL3;

ml1=Parametros.Masas.ml1;
ml2=Parametros.Masas.ml2;
ml3=Parametros.Masas.ml3;

mp=Parametros.Masas.mp;
Ip=Parametros.Inercias.Ip;

g=Parametros.g;

%Desglose de par?metros: Geometria plataforma
d1=Parametros.Longitudes.d1;
d2=Parametros.Longitudes.d2;
d3=Parametros.Longitudes.d3;

d1x=d1(1); d1y=d1(2);
d2x=d2(1); d2y=d2(2);
d3x=d3(1); d3y=d3(2);

%Desglose de variables de entrada
qa1=q(1);  qa2=q(2);  qa3=q(3);
qna1=q(4); qna2=q(5); qna3=q(6);

vqa1=vq(1); vqa2=vq(2); vqa3=vq(3); 
vqna1=vq(4); vqna2=vq(5); vqna3=vq(6); 

vqa=vq(1:3);

x=X(1); y=X(2); tz=X(3);
vx=vX(1); vy=vX(2); vtz=vX(3);


%% Cálculo de Jacobianas
%La función ThreeRRR_JacobiansDM calcula las jacobianas necesarias para el modelo dinámico, 
% tambien se podrían copiar del problema de velocidad y de aceleración

[T,Jp,dT,dJp]=ThreeRRR_JacobiansDM(Parametros,X,vX,q,vq);

if(isempty(T))
    OK=0;
    return;
end


%% Matrices Dinámicas
% El estudiante debe insertar las matrices dinámicas calculadas en la sesión
% anterior Dq, Dx, Gq, Gx, Cq, Cx
Dq = [...
[ ml1*L1^2 + 2*ml1*cos(qna1)*L1*Lcl1 + mL1*LcL1^2 + ml1*Lcl1^2 + IL1 + Il1,                                                                        0,                                                                        0, ml1*Lcl1^2 + L1*ml1*cos(qna1)*Lcl1 + Il1,                                        0,                                        0]
[                                                                        0, ml2*L2^2 + 2*ml2*cos(qna2)*L2*Lcl2 + mL2*LcL2^2 + ml2*Lcl2^2 + IL2 + Il2,                                                                        0,                                        0, ml2*Lcl2^2 + L2*ml2*cos(qna2)*Lcl2 + Il2,                                        0]
[                                                                        0,                                                                        0, ml3*L3^2 + 2*ml3*cos(qna3)*L3*Lcl3 + mL3*LcL3^2 + ml3*Lcl3^2 + IL3 + Il3,                                        0,                                        0, ml3*Lcl3^2 + L3*ml3*cos(qna3)*Lcl3 + Il3]
[                                 ml1*Lcl1^2 + L1*ml1*cos(qna1)*Lcl1 + Il1,                                                                        0,                                                                        0,                         ml1*Lcl1^2 + Il1,                                        0,                                        0]
[                                                                        0,                                 ml2*Lcl2^2 + L2*ml2*cos(qna2)*Lcl2 + Il2,                                                                        0,                                        0,                         ml2*Lcl2^2 + Il2,                                        0]
[                                                                        0,                                                                        0,                                 ml3*Lcl3^2 + L3*ml3*cos(qna3)*Lcl3 + Il3,                                        0,                                        0,                         ml3*Lcl3^2 + Il3]
];

Cq = [... 
[                -2*L1*Lcl1*ml1*vqna1*sin(qna1),                                             0,                                             0,    -L1*Lcl1*ml1*vqna1*sin(qna1),                               0,                               0]
[                                             0,                -2*L2*Lcl2*ml2*vqna2*sin(qna2),                                             0,                               0,    -L2*Lcl2*ml2*vqna2*sin(qna2),                               0]
[                                             0,                                             0,                -2*L3*Lcl3*ml3*vqna3*sin(qna3),                               0,                               0,    -L3*Lcl3*ml3*vqna3*sin(qna3)]
[ -(L1*Lcl1*ml1*sin(qna1)*(2*vqa1 + 3*vqna1))/2,                                             0,                                             0, -(L1*Lcl1*ml1*vqa1*sin(qna1))/2,                               0,                               0]
[                                             0, -(L2*Lcl2*ml2*sin(qna2)*(2*vqa2 + 3*vqna2))/2,                                             0,                               0, -(L2*Lcl2*ml2*vqa2*sin(qna2))/2,                               0]
[                                             0,                                             0, -(L3*Lcl3*ml3*sin(qna3)*(2*vqa3 + 3*vqna3))/2,                               0,                               0, -(L3*Lcl3*ml3*vqa3*sin(qna3))/2]
]; 

Gq = [g*ml1*(Lcl1*cos(qa1 + qna1) + L1*cos(qa1)) + LcL1*g*mL1*cos(qa1);
 g*ml2*(Lcl2*cos(qa2 + qna2) + L2*cos(qa2)) + LcL2*g*mL2*cos(qa2);
 g*ml3*(Lcl3*cos(qa3 + qna3) + L3*cos(qa3)) + LcL3*g*mL3*cos(qa3);
                                       Lcl1*g*ml1*cos(qa1 + qna1);
                                       Lcl2*g*ml2*cos(qa2 + qna2);
                                       Lcl3*g*ml3*cos(qa3 + qna3)];
                                                   
Dx =[... 
[ mp,     0,     0]
[     0, mp,     0]
[     0,     0, Ip]
];


Cx =zeros(3,3);

Gx=[0;
    g*mp;
    0];

%% Modelo Dinámico
% El estudiante debe introducir el modelo dinámico estructurado para
% calcular el par de los actuadores

D=T'*Dq*T+Jp'*Dx*Jp;
C=T'*Dq*dT+Jp'*Dx*dJp+T'*Cq*T+Jp'*Cx*Jp;
G=T'*Gq+Jp'*Gx;


tau=D*aqa+C*vqa+G;

OK=1;



