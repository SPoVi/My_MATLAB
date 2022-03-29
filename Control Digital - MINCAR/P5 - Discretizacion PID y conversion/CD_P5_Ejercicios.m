%% CONTROL DISCRETO - PRÁCTICA 5

%% Ejercicio 1 : Modelo discreto de un Motor de CC
clear all
close all
clc

s = tf('s');

% Variables
J = 0.01;
b = 0.1;
K = 0.01;
R = 1;
L = 0.5;
% Planta
Gp = K /((J*s+b)*(L*s+R)+K^2)

% Periodo de muestreo
Ts = 0.5; % Cambiar a 0.1 para obtener la ilustracion 3

% Conversion continua a discreto
Gdtustin = c2d(Gp,Ts,'tustin') 

% Respuesta a entrada escalon
step(Gp,Gdtustin)
legend('Gp','método tustin')

% Otros métodos
% Metodo ZOH - Zero Order Hold
Gdzoh = c2d(Gp,Ts)
% Metodo FOH - Firs Orde Hold
Gzfoh = c2d(Gp,Ts,'foh')
% Metodo Impulse Invariant Mapping (solo c2d)
Gzimpulse = c2d(Gp,Ts,'impulse')
% Metodo zero-pole Matching Equivalents
GzMatch = c2d(Gp,Ts,'matched')

% Respuesta a entrada escalon
step(Gp,Gdtustin)
hold on
step(Gdzoh)
step(Gzfoh)
step(Gzimpulse)
step(GzMatch)
hold off
legend('Gp','método tustin','metodo zoh','método foh','método impulse','método matched')
%% Ejericio 2 : Discretizar un PID continuo
clear all
close all
clc

s = tf('s');

% Variables del PID
Kp = 100;
Ki = 200;
Kd = 10;

% Periodo de muestreo Ts
Ts = 0.01;

% Controlador PID continuo
Gc_cont = Kp*(1+Ki/s+Kd*s)

% Conversion mediante el método tustin continua a discreta
Gc_disc = c2d(Gc_cont,Ts,'tustin')

%% Ejercicio 3: Obtener la funcion de transferencia pulso
clear all
close all
clc

s = tf('s');
% Periodo de muestreo 
Ts = 1;
% Funcion de transferencia de la planta
Gp = 1/(s+4);
% Funcion de transferencia del sensor
H = 10/s;

% Discretizamos ambas funciones de tranferencia mediante el medoto ZOH
Gpz = c2d(Gp,Ts,'zoh')
Hz = c2d(H,Ts,'zoh')

% Obtenemos la funcion de transferencia en lazo cerrado
FTLCz = feedback(Gpz,Hz)
