% estudioTransitorioRC.m

clear
clc
% Calculamos la intensidad del circuito en alterna
% Se puede utilizar input para preguntar por pantalla y asignar valores
% a las variables
t1 = 1;
R = 100;
C = 1000e-6;
V = 100;

% tspan
% el intervalo cuanto mas pequeño mejor sale la curva
t = 0:0.001:t1;

%funcion
i = (V/R)*exp(-t/(R*C));

%graficar
subplot(2,1,1)
plot(t,i,'--');
grid;
xlabel('Tiempo (segundos)');
ylabel('Intensidad (A)');
title('Corriente del circuito');

% Solucion numerica

% Datos
tspan = [0 t1];
x0 = [0];
param = [R,C,V];

%ODE
options = odeset('Reltol',1e-6, 'Abstol',1e-10);
[t,y] = ode23(@mydiff,tspan,x0,options,param);

% Grafica
subplot(2,1,2)
plot(t,y,'-');
xlabel('Tiempo (segundos)');
ylabel('Vc (Volts)');
title('Tension del condensador');
grid

