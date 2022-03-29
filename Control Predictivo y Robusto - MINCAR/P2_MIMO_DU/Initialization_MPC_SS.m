function [parameters, Ref,Td]=Initialization_MPC_SS;

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
IniVar;
% parameters=[];
% Ref=[];
% Td=[];

%% Periodo de Discretizaci?n
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Td=Td;

%% Matrices del modelo discretizado

parameters.A=A;
parameters.B=B;
parameters.C=C;
parameters.Dm=Dm;
%parameters.D=D;


%% C?lculo de los par?metros y matrices del controlador
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Horizonte de predicci?n
parameters.h=h;


%Matrices de ponderaci?n
parameters.Q=Q;
parameters.R=R;

%Matrices de la ecuacion de predicci?n vectorial
parameters.F=F;
parameters.G=G;
parameters.Gp=Gp;

parameters.Fpm=Fpm; %Compensacion de la pert. medible


%Ganancia del controlador MPC
parameters.K1=K;
parameters.Knu=Knu;


%% Vector de Referencia
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Ref=Ref;
 
 