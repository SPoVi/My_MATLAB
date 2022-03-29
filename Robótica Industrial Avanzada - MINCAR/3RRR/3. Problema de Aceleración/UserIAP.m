function [OK,aq]=UserIAP(Parametros,aX,X,vX,q,vq)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%           Resuelve el problema de aceleración inverso del robot 3RRR
%
%-Input
%   -Parametros : Estructura de parámetros que contiene los parámetros
%   cinemáticos y dinámicos del robot (desglosado en la cabecera
%   -aX=[ax ay atz]' vector  3x1  con las aceleraciones de salida
%   -X=[x y tz]' vector  3x1  que contiene la posición x e y en m del TCP 
%   y su orientación (rad)
%   -vX=[vx vy vtz]' vector  3x1  que contiene las velocidades del TCP
%   -q=[qa1 qa2 qa3 qna1 qna2 qna3]', vector 6x1 con todas las variables
%   articulares.
%   -vq=[vqa1 vqa2 vqa3 vqna1 vqna2 vqna3]', vector 6x1 con la velocidad de
%   las variables articulares
%-Output:
%   -OK, será =1 si todo ha ido correctamente, o 0 si no existe solución
%   -aq=[aqa1 aqa2 aqa3 aqna1 aqna2 aqna3]', vector 6x1 con la acc. de
%   las variables articulares
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

OK=0;
aq=[];

detLimit=1e-6;

a1=Parametros.Longitudes.a1;
a2=Parametros.Longitudes.a2;
a3=Parametros.Longitudes.a3;

a1x=a1(1); a1y=a1(2);
a2x=a2(1); a2y=a2(2);
a3x=a3(1); a3y=a3(2);

%Desglose de parámetros: Longitudes
L1=Parametros.Longitudes.L1;
L2=Parametros.Longitudes.L2;
L3=Parametros.Longitudes.L3;

l1=Parametros.Longitudes.l1;
l2=Parametros.Longitudes.l2;
l3=Parametros.Longitudes.l3;

%Desglose de parámetros: Geometria plataforma
d1=Parametros.Longitudes.d1;
d2=Parametros.Longitudes.d2;
d3=Parametros.Longitudes.d3;

d1x=d1(1); d1y=d1(2);
d2x=d2(1); d2y=d2(2);
d3x=d3(1); d3y=d3(2);

%Desglose de variables de entrada
%Desglose de variables de entrada
qa1=q(1);  qa2=q(2);  qa3=q(3);
qna1=q(4); qna2=q(5); qna3=q(6);

vqa1=vq(1); vqa2=vq(2); vqa3=vq(3); 
vqna1=vq(4); vqna2=vq(5); vqna3=vq(6); 

x=X(1); y=X(2); tz=X(3);
vx=vX(1); vy=vX(2); vtz=vX(3);


%Matrices Jxqi y Jxi de las cadenas cinemáticas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Jx1 =[...
     [ -1,  0, d1y*cos(tz) + d1x*sin(tz)]
     [  0, -1, d1y*sin(tz) - d1x*cos(tz)]
     ];
 
Jx2 =[...
     [ -1,  0, d2y*cos(tz) + d2x*sin(tz)]
     [  0, -1, d2y*sin(tz) - d2x*cos(tz)]
     ];
 
Jx3 =[...
     [ -1,  0, d3y*cos(tz) + d3x*sin(tz)]
     [  0, -1, d3y*sin(tz) - d3x*cos(tz)]
     ];
 
Jxq1 =[...
     [ - l1*sin(qa1 + qna1) - L1*sin(qa1), -l1*sin(qa1 + qna1)]
     [   l1*cos(qa1 + qna1) + L1*cos(qa1),  l1*cos(qa1 + qna1)]
     ];
 
Jxq2 =[...
     [ - l2*sin(qa2 + qna2) - L2*sin(qa2), -l2*sin(qa2 + qna2)]
     [   l2*cos(qa2 + qna2) + L2*cos(qa2),  l2*cos(qa2 + qna2)]
     ];
 
Jxq3 =[...
     [ - l3*sin(qa3 + qna3) - L3*sin(qa3), -l3*sin(qa3 + qna3)]
     [   l3*cos(qa3 + qna3) + L3*cos(qa3),  l3*cos(qa3 + qna3)]
     ];

%Cálculo de Jq
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Verifico singularidad

if(abs(det(Jxq1))<detLimit||abs(det(Jxq2))<detLimit...
                                                 ||abs(det(Jxq3))<detLimit)
    OK=0; %Singularidad 
    return;
end

J1=-inv(Jxq1)*Jx1;
J2=-inv(Jxq2)*Jx2;
J3=-inv(Jxq3)*Jx3;

%Calculo de Jqa y Jqp

Jqa=[J1(1,:);J2(1,:);J3(1,:)];
Jqp=[J1(2,:);J2(2,:); J3(2,:)];

Jq=[Jqa;Jqp];


%Matrices dJxqi y dJxi de las cadenas cinemáticas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

dJx1 =[...
[ 0, 0, vtz*(d1x*cos(tz) - d1y*sin(tz))]
[ 0, 0, vtz*(d1y*cos(tz) + d1x*sin(tz))]
];
 
dJx2 =[...
[ 0, 0, vtz*(d2x*cos(tz) - d2y*sin(tz))]
[ 0, 0, vtz*(d2y*cos(tz) + d2x*sin(tz))]
]; 

dJx3 =[...
[ 0, 0, vtz*(d3x*cos(tz) - d3y*sin(tz))]
[ 0, 0, vtz*(d3y*cos(tz) + d3x*sin(tz))]
];

dJxq1 =[...
[ - vqa1*(l1*cos(qa1 + qna1) + L1*cos(qa1)) - l1*vqna1*cos(qa1 + qna1), -l1*cos(qa1 + qna1)*(vqa1 + vqna1)]
[ - vqa1*(l1*sin(qa1 + qna1) + L1*sin(qa1)) - l1*vqna1*sin(qa1 + qna1), -l1*sin(qa1 + qna1)*(vqa1 + vqna1)]
]; 
 
dJxq2 =[...
[ - vqa2*(l2*cos(qa2 + qna2) + L2*cos(qa2)) - l2*vqna2*cos(qa2 + qna2), -l2*cos(qa2 + qna2)*(vqa2 + vqna2)]
[ - vqa2*(l2*sin(qa2 + qna2) + L2*sin(qa2)) - l2*vqna2*sin(qa2 + qna2), -l2*sin(qa2 + qna2)*(vqa2 + vqna2)]
]; 
 
dJxq3 =[...
[ - vqa3*(l3*cos(qa3 + qna3) + L3*cos(qa3)) - l3*vqna3*cos(qa3 + qna3), -l3*cos(qa3 + qna3)*(vqa3 + vqna3)]
[ - vqa3*(l3*sin(qa3 + qna3) + L3*sin(qa3)) - l3*vqna3*sin(qa3 + qna3), -l3*sin(qa3 + qna3)*(vqa3 + vqna3)]
];

%Cálculo de dJq
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


dJ1=-inv(Jxq1)*(dJx1+dJxq1*J1);
dJ2=-inv(Jxq2)*(dJx2+dJxq2*J2);
dJ3=-inv(Jxq3)*(dJx3+dJxq3*J3);

dJqa=[dJ1(1,:); dJ2(1,:); dJ3(1,:)];
dJqp=[dJ1(2,:); dJ2(2,:); dJ3(2,:)];

dJq=[dJqa;dJqp];


%Problema de aceleración inverso
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

aq=Jq*aX+dJq*vX;

OK=1;


