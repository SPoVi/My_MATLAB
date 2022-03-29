function [OK,qa]=funIKP_Ex21(Parametros,X)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Calcula la cinemática inversa del robot del Examen de 19/04/2021
%
%-Input
%   -Parametros : Estructura de parámetros que contiene los parámetros
%   cinemáticos y dinámicos del robot según Parametros=Ex21_ParametrosRobot
%   - X=[x y]' vector  2x1  que contiene la posición x e y del TCP 
%   
%-Output:
%   - OK, será =1 si todo ha ido correctamente, o 0 si no existe solución
%   - qa=[qa1 qa2]', vector 2x1 con todas las variables articulares actuadas.
%   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% NO MODIFICAR
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Inicialización
qa=[];
OK=0;

%Desglose de parámetros

L1=Parametros.L1;
L2=Parametros.L2;

%Desglose de variables de coordenadas cartesianas
x=X(1);
y=X(2); 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% FIN NO MODIFICAR
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% CODIFICAR AQUÍ EL PROBLEMA DE POSICIÓN INVERSO

% Usando el método geometrico, se eliminan las variables pasivas

qa1 = x - sqrt(L1^2 - y^2);
qa2 = x - sqrt(L2^2 - y^2);

qa = [qa1; qa2];

OK=1;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



