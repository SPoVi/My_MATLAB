% estudioTransitorioRL.m


% Escribir datos en un fichero
% Borra el workspace y carga el fichero para hacer los graficos
clear; clc;
close all;

% Datos
R = 10;
L = 500e-3;
V = 15;

% Abrir fichero
fid1=fopen('data.dat','w');

% Intervalo de tiempo
for t = 0:0.001:2;
    if t<=1
        iSol = (V/R)*(1-exp(-R*t/L));  % ecuacion 1 . Solucion analitica
        Vs = 15;
    else
        iSol = (V/R)*exp(-R*(t-1)/L); % ecuacion 2 . Solucion analitica
        Vs = 0;
    end % fin del bucle if

fprintf(fid1,'%2.4f %2.4f %2.4f\n', t,iSol,Vs);
end; % fin del bucle for

fclose(fid1); clear all
load data.dat
t = data(:,1); i = data(:,2); Vs=data(:,3);

%Graficar
subplot(2,1,1), plot(t,Vs);grid;
ylabel ('Voltage(Vs)');
xlabel ('Time(sec)');
title('Source Voltage Pulse');

subplot(2,1,2),plot(t,i);grid;
ylabel('Current (A)');
xlabel('Time(Sec)');
title('Current in RL Circuit with Pulse Input');
%%
%% Solucion numerica

% Limpiar
clear; clc;

% Datos
global R L V
t = input('Tiempo final (sec): ');
R = input('Valor resistencia (ohms): ');
L = input('Valor inductancia (mH): ');
V = input('Valor fuente alimentacion (v): ');
L = L *1e-3;

% Global R L V; V =15; R = 10; L = 500e-3; t = 2;
X0=[0];
tspan=[0 t];
[t,i]=ode45(@funcRL, tspan,X0);
t1 = [0 1 1 2];
Vs = [15 15 0 0];
subplot(2,1,1),plot(t1,Vs),title('Soruce Voltage');
ylabel('Vs(V)'); grid
subplot(2,1,2);plot(t,i);title('Circuit Current');
xlabel('t(Sec)'); ylabel('(I(A)'); grid

%% FUNCION RL
% funcRL.m

function idot = funcRL(t, iSol)
global R L V
if t<=1
    V = 15;
else
    V = 0;
end
idot = (1/L)*(V-iSol*R);
end