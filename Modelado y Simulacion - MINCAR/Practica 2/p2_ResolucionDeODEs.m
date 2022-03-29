% p2_diferenciales.m

%% Practica 2.1
clc
clear
% Datos
t0 = 0;
tf = 5;
x0 = 1;

tspan =[t0 tf];
options = odeset('RelTol',1e-6,'AbsTol',1e-10);

[t,y] = ode23(@mydiffp21,tspan,x0,options);

plot(t,y,'-')

%% Practica 2.2
clc
clear

% Datos
t0 = 0;
tf = 5;
x0 = [0 1];
tspan =[t0 tf];
options = odeset('RelTol',1e-6,'AbsTol',1e-10);

[t,y] = ode23(@mydiffp22,tspan,x0,options);
plot(t,y,'-')