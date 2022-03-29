
%Script de validaci�n de funDM_Ex21
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Carga de par�metros del robot
Parametros=Ex21_ParametrosRobot;

%Punto a probar: coordenadas articulares qa
q=[...
    0.1000
    0.9000
    1.1593
    1.9823];

vq=[...
    0.0100
    0.0110
    0.0010
    0.0010
    ];

%Funci�n de validaci�n
[OK,Dq,Cq,Gq]=funDM_Ex21(Parametros,q,vq)