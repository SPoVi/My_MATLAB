

%Script de validación del modelo cinemático inverso: funIKP_Ex21
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Carga de parámetros del robot
Parametros=Ex21_ParametrosRobot;

%Punto a probar: coordenadas articulares qa
x=1;
y=0.6;

X=[x;y];

%Función de validación
[OK,qa]=funIKP_Ex21(Parametros,X)



