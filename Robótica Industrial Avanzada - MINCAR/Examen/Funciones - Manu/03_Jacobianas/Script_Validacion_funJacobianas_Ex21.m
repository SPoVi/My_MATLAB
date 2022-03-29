

%Script de validaci�n de la jacobianas: funJacobianas_Ex21
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Carga de par�metros del robot
Parametros=Ex21_ParametrosRobot;

%Punto a probar: coordenadas articulares qa
q=[...
    0.2000
    1.9000
    0.5548
    2.5868];
X=[1.0500; 0.5268];

%Funci�n de validaci�n
[OK,Jqa,Jqna,T]=funJacobianas_Ex21(Parametros,q, X)



