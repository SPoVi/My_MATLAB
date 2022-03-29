

%Script de validación del modelo cinemático directo: funDKP_Ex21
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Carga de parámetros del robot
Parametros=Ex21_ParametrosRobot;

%Punto a probar: coordenadas articulares qa
qa1=0.2;
qa2=1.9;

qa=[qa1;qa2];

%Función de validación
[OK,X,q]=funDKP_Ex21(Parametros,qa)

