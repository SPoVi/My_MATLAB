

%Script de validaci�n del modelo cinem�tico inverso: funIKP_Ex21
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Carga de par�metros del robot
Parametros=Ex21_ParametrosRobot;

%Punto a probar: coordenadas articulares qa
x=1;
y=0.6;

X=[x;y];

%Funci�n de validaci�n
[OK,qa]=funIKP_Ex21(Parametros,X)



