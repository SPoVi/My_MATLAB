
%Script de validación de funDM_Ex21
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

%Función de validación
[OK,Dq,Cq,Gq]=funDM_Ex21(Parametros,q,vq)