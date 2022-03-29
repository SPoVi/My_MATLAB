
%Script de validación del modelo funIDM_Ex21
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Carga de parámetros del robot
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

aqa1=0.01;
aqa2=0.01;
aqa=[aqa1;aqa2];


%Función de validación

[OK,tauqa]=funIDM_Ex21(Parametros,aqa,vq,q)
