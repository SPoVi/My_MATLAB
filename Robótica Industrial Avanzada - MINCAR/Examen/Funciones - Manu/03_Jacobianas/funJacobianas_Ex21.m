function [OK,Jqa,Jqna,T]=funJacobianas_Ex21(Parametros,q, X)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       Calcula las jacobianas vqa=Jqa*vx, vqna=Jqna*vx, vq=T*vqa
%
%-Input
%   -Parametros : Estructura de par�metros que contiene los par�metros
%   cinem�ticos y din�micos del robot seg�n Parametros=Ex21_ParametrosRobot
%   -q=[qa1 qa2 qna1 qna2 ]', vector 4x1 con todas las variables
%   articulares actuadas y no actuadas.
%   -X=[x y]' vector  2x1  que contiene la posici�n x e y del TCP 
%-Output:
%   -OK, ser� =1 si todo ha ido correctamente, o 0 si hay problemas
%   -Jqa: Jacobiana vqa=Jqa*vx
%   -Jqna: Jacobiana vqna=Jqna*vx
%   -T: Jacobiana vq=T*vqa
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% NO MODIFICAR
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Inicializaci�n
Jqa=[];
Jqna=[];
T=[];
OK=0;

%Desglose de par�metros

L1=Parametros.L1;
L2=Parametros.L2;

%Desglose de variables de entrada y salida
qa1=q(1); 
qa2=q(2); 
qna1=q(3); 
qna2=q(4); 

x=X(1);
y=X(2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% FIN NO MODIFICAR
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% CODIFICACI�N DE LAS JACOBIANAS AQU�
Jqa = [[cos(qna1)/(cos(qna1) + sin(qna1)), sin(qna1)/(cos(qna1) + sin(qna1))]
[cos(qna2)/(cos(qna2) + sin(qna2)), sin(qna2)/(cos(qna2) + sin(qna2))]];

Jqna = [[cos(qna1)/(cos(qna1) + sin(qna1)), sin(qna1)/(cos(qna1) + sin(qna1))]
[cos(qna2)/(cos(qna2) + sin(qna2)), sin(qna2)/(cos(qna2) + sin(qna2))]];

T = [[                                                                                                                                                                                                                                  1,                                                                                                                                                                                                                                 0]
[                                                                                                                                                                                                                                  0,                                                                                                                                                                                                                                 1]
[- (cos(qna2)*(cos(qna1) + sin(qna1)))/((L1*cos(qna1) + L1*sin(qna1))*(cos(qna1)*sin(qna2) - cos(qna2)*sin(qna1))) - (sin(qna2)*(cos(qna1) + sin(qna1)))/((L1*cos(qna1) + L1*sin(qna1))*(cos(qna1)*sin(qna2) - cos(qna2)*sin(qna1))), (cos(qna1)*(cos(qna2) + sin(qna2)))/((L1*cos(qna1) + L1*sin(qna1))*(cos(qna1)*sin(qna2) - cos(qna2)*sin(qna1))) + (sin(qna1)*(cos(qna2) + sin(qna2)))/((L1*cos(qna1) + L1*sin(qna1))*(cos(qna1)*sin(qna2) - cos(qna2)*sin(qna1)))]
[- (cos(qna2)*(cos(qna1) + sin(qna1)))/((L2*cos(qna2) + L2*sin(qna2))*(cos(qna1)*sin(qna2) - cos(qna2)*sin(qna1))) - (sin(qna2)*(cos(qna1) + sin(qna1)))/((L2*cos(qna2) + L2*sin(qna2))*(cos(qna1)*sin(qna2) - cos(qna2)*sin(qna1))), (cos(qna1)*(cos(qna2) + sin(qna2)))/((L2*cos(qna2) + L2*sin(qna2))*(cos(qna1)*sin(qna2) - cos(qna2)*sin(qna1))) + (sin(qna1)*(cos(qna2) + sin(qna2)))/((L2*cos(qna2) + L2*sin(qna2))*(cos(qna1)*sin(qna2) - cos(qna2)*sin(qna1)))]];

OK=1;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



