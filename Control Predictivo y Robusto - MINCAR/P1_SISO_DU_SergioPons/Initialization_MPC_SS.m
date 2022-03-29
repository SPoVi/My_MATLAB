function [parameters, Ref,Td]=Initialization_MPC_SS;
% Autor:                Asier Zubizarreta
% Modificado por :      Sergio Pons
% Fecha creacion:       17/11/2020
% Ultima modificacion:  22/11/2020

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Esta funcion se ejecuta antes de la simulacion del bloque MPC SS Control
% SISO u(k) y permite calcular los parametros del MPC que pueden ser
% calculados offline. Estos par?metros se almacenanan en parameters.
%
% Ref almacena la referencia offline calculada para la simulaci?n. Ten en
% cuenta que si la simulaci?n es mayor que el n?mero de datos en Ref, se
% tomar? el ?ltimo valor como constante.
%
% Td es el periodo de discretizaci?n, que se usar? para definir cada cuanto
% se ejecuta el controlador
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
IniVar % Inicializacion de variables
% parameters=[]; % Matrices, modelos, etc
% Ref=[];
% Td=[];


%% Periodo de Discretizacion
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Td= Td;


%% Matrices del modelo discretizado
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Matrices del modelo discretizado
parameters.A=A;
parameters.B=B;
parameters.C=C;

%% Calculo de los par?metros y matrices del controlador
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Horizonte de predicci?n
parameters.h=h;


%Matrices de ponderaci?n
parameters.Q=q;
parameters.R=r;

%Matrices de la ecuaci?n de predicci?n vectorial
parameters.F=F;
parameters.G=G;
parameters.Gp=Gp;

%Ganancia del controlador MPC
parameters.K1=K1;


%% Vector de Referencia
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Ref=Ref;