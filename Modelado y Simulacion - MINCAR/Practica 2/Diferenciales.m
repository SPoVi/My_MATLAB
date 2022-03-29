clc 
clear all
close all

%% EJERCICIO 1

% mydiff1
function [dw] = mydiff1(t,w)
a = -(1.2+sin(10*t));
dw = a*w;
end
%__________________

t0=0;
tf=5;
w0=1;
tspan=[t0 tf];

[t,y]=ode23(@mydiff1,tspan,w0);
plot(t,y, 'k','LineWidth',1.5)

%% EJERCICIO 2

% mydiif2
function [dx] = mydiff2(t,x)

dx(1) = x(2); 
dx(2) = (-3/(1+t^2))*x(1)-((2*t)/(1+t^2))*x(2)+2/(1+t^2);

dx = [dx(1) dx(2)]'
%__________________

end
t0=0;
tf=5;
w0= [0 1];
tspan2=[t0 tf];

figure;
[t,x]=ode23(@mydiff2,tspan2,w0);
plot(t,x, 'k','LineWidth',1.5)
[t,x]=ode45(@mydiff2,tspan2,w0);
hold on 
plot(t,x, 'g','LineWidth',1.5)
hold off

%% EJERCICIO 3

%Mydiff3 
function [dx] = mydiff3(t,x,param)
b=param(1);
p=param(2);
dx=b*x-p*x^2;
end
%___________________________

t0=0;
tf=60;
X0= 100;
tspan2=[t0 tf];

b=1;
p=0.5;
param = [b p];

figure;
[t,x]=ode23(@mydiff3,tspan2,X0,[],param);
plot(t,x, 'k','LineWidth',1.5)



