

%Script de validaci�n del modelo cinem�tico directo: funDKP_Ex21
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Carga de par�metros del robot
Parametros=Ex21_ParametrosRobot;

%Punto a probar: coordenadas articulares qa
qa1=0.2;
qa2=1.9;

qa=[qa1;qa2];

%Funci�n de validaci�n
[OK,X,q]=funDKP_Ex21(Parametros,qa)

