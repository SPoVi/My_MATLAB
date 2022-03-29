function [OK,X,q]=funDKP_Ex21(Parametros,qa)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Calcula la cinemática directa del robot del Examen de 19/04/2021
%
%-Input
%   -Parametros : Estructura de parámetros que contiene los parámetros
%   cinemáticos y dinámicos del robot según Parametros=Ex21_ParametrosRobot
%   -qa=[qa1 qa2]', vector 2x1 con todas las variables articulares actuadas.
%   
%-Output:
%   -OK, será =1 si todo ha ido correctamente, o 0 si no existe solución
%   -X=[x y]' vector  2x1  que contiene la posición x e y del TCP 
%   -q=[qa1 qa2 qna1 qna2 ]', vector 4x1 con todas las variables
%   articulares actuadas y no actuadas.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% NO MODIFICAR
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Inicialización
X=[];
q=[];
OK=0;

%Desglose de parámetros

L1=Parametros.L1;
L2=Parametros.L2;

%Desglose de variables de entrada
qa1=qa(1);
qa2=qa(2); 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% FIN NO MODIFICAR
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% CODIFICAR AQUÍ EL PROBLEMA DE POSICIÓN DIRECTO Y EL CÁLCULO DE VARIABLES PASIVAS

B1 = [qa1; 0];
B2 = [qa2; 0];

% El punto P se cácula usando el método de la intersección de
% circunferencias

[OK,ErrorMsg,Pa,Pb] = InterseccionCircunferencia(L1,B1(1),B1(2),L2,B2(1),B2(2));
if(OK == 0)
    return;
end

% Se toma el modo de ensamblaje positivo
X = Pa;

% Articulaciones no actuadas

qna1 = atan2(X(2) - B1(2),X(1) - B1(1));
qna2 = atan2(X(2) - B2(2),X(1) - B2(1));

q = [qa1; qa2; qna1; qna2];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



