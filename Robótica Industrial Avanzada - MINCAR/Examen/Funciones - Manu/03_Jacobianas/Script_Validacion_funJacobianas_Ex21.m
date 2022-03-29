

%Script de validación de la jacobianas: funJacobianas_Ex21
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Carga de parámetros del robot
Parametros=Ex21_ParametrosRobot;

%Punto a probar: coordenadas articulares qa
q=[...
    0.2000
    1.9000
    0.5548
    2.5868];
X=[1.0500; 0.5268];

%Función de validación
[OK,Jqa,Jqna,T]=funJacobianas_Ex21(Parametros,q, X)



