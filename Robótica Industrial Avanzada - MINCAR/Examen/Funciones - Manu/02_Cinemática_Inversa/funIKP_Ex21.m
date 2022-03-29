function [OK,qa]=funIKP_Ex21(Parametros,X)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Calcula la cinem�tica inversa del robot del Examen de 19/04/2021
%
%-Input
%   -Parametros : Estructura de par�metros que contiene los par�metros
%   cinem�ticos y din�micos del robot seg�n Parametros=Ex21_ParametrosRobot
%   - X=[x y]' vector  2x1  que contiene la posici�n x e y del TCP 
%   
%-Output:
%   - OK, ser� =1 si todo ha ido correctamente, o 0 si no existe soluci�n
%   - qa=[qa1 qa2]', vector 2x1 con todas las variables articulares actuadas.
%   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% NO MODIFICAR
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Inicializaci�n
qa=[];
OK=0;

%Desglose de par�metros

L1=Parametros.L1;
L2=Parametros.L2;

%Desglose de variables de coordenadas cartesianas
x=X(1);
y=X(2); 
X=[x y]';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% FIN NO MODIFICAR
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% CODIFICAR AQU� EL PROBLEMA DE POSICI�N INVERSO
% Por trigonometria. Pitagoras.
%   L1^2 = y^2 + x0^2
x0 = sqrt(L1^2-y^2)
qa1 = x - x0;
qa2 = qa1 + x0 + x0;
qa=[qa1 qa2]'
OK=1;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



