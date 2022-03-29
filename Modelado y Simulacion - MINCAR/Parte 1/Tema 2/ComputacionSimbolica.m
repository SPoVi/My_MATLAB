% Autores: Sergio Pons y Pablo Galán Saiz
clc
clear all
close all

%% Ejercico 1 simbolico

%_______MET2_________
function [y] = myfcn( x )
    y = x.*exp(x);
end

Q1 = quad(@myfcn,0,2);

%_______MET1_________
syms a b x 
Q = int(x*exp(x),a,b);
subs(Q,[a,b],[0,2])

%% Optimizacion 

%_______ EJ 1___________________
[x,fval] = fminsearch(@(x) x.^2-4.*x,5)
clear, clc 
[x,y] = meshgrid(-2:0.1:2,-1:0.1:2);
f = x.^2-4.*x;
figure; surf(x,y,f)

%_______EJ 2____________________ 
[x,fval] = fminsearch(@(x) (1-x(1)).^2+100.*(x(2)-x(1)).^2,[0;0])
clear, clc 
[x,y] = meshgrid(-10:0.5:10,-10:0.5:10);
f = (1-x).^2+100.*(y-x).^2;
figure; surf(x,y,f)



