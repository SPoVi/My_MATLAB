function [OK,X,q]=funDKP_Ex21(Parametros,qa)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Calcula la cinem�tica directa del robot del Examen de 19/04/2021
%
%-Input
%   -Parametros : Estructura de par�metros que contiene los par�metros
%   cinem�ticos y din�micos del robot seg�n Parametros=Ex21_ParametrosRobot
%   -qa=[qa1 qa2]', vector 2x1 con todas las variables articulares actuadas.
%   
%-Output:
%   -OK, ser� =1 si todo ha ido correctamente, o 0 si no existe soluci�n
%   -X=[x y]' vector  2x1  que contiene la posici�n x e y del TCP 
%   -q=[qa1 qa2 qna1 qna2 ]', vector 4x1 con todas las variables
%   articulares actuadas y no actuadas.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% NO MODIFICAR
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Inicializaci�n
X=[];
q=[];
OK=0;

%Desglose de par�metros

L1=Parametros.L1;
L2=Parametros.L2;

%Desglose de variables de entrada
qa1=qa(1);
qa2=qa(2); 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% FIN NO MODIFICAR
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% CODIFICAR AQU� EL PROBLEMA DE POSICI�N DIRECTO Y EL C�LCULO DE VARIABLES PASIVAS

% Se observa en la figura que en el eje vertical B1 y B2 tienen un valor de
% cero
x0 = qa1;
y0 = 0;
x1 = qa2;
y1 = 0;
[OK,ErrorMsg,xp1,xp2]=InterseccionCircunferencia(L1,x0,y0,L2,x1,y1);

% En la figura se observa que el TCP se encuentra en positivo en el eje
%vertical. Se observa que ese modo es el que describe xp1.
X = xp1';

% Una vez que el punto TCP este calculado. Se procede a calcular las
% articulaciones pasivas.
qna1 = atan2(X(2)-0,X(1)-x0);
qna2 = atan2(X(2)-0,X(1)-x1);
q = [qa1 qa2 qna1 qna2 ]'
OK=1;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



