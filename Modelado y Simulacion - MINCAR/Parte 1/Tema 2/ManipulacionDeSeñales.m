%Autores: Segio Pons y Pablo Galán
clc
clear all
close all

%% Ejercicio 1

x = 10:10:100;
y = [23 45 60 82 111 140 167 198 200 220];

figure;
%From order 2 to 9 
for n=2:1:9
    p=polyfit(x,y,n);
    ymodel=polyval(p,x);
    subplot(2,4,n-1) 
    plot(x,y,'o',x,ymodel) 
    title(sprintf('Model of order %d', n));  
end 

%% Ejercicio 2

x = [0 1.7 1.95 2.6 2.92 4.04 5.24];
y = [0 2.6 3.6 4.03 6.45 11.22 30.61];

figure;
%From order 2 to 6
for n=2:1:6
    p=polyfit(x,y,n);
    ymodel=polyval(p,x);
    subplot(2,4,n-1) 
    plot(x,y,'o',x,ymodel) 
    title(sprintf('Model of order %d', n));  
end 

new_x = 0:0.25:5.24; 
lineal_y = interp1(x,y,new_x,'nearest');
cuadra_y = interp1(x,y,new_x,'spline');
cubico_y = interp1(x,y,new_x,'cubic');

figure; plot(x,y,new_x,lineal_y,'--')
hold on; 
plot(new_x,cuadra_y,'r-.')
plot(new_x,cubico_y,'g:')
hold off
xlabel('Tiempo')
ylabel('Muestras')
legend('Ideales','Lineal','Cuadratico','Cubico')
title('Aproximaciones')

%% Ejercicio 3

x = -5:0.1:5; 
y = x.^3+2*x.^2-x+3;
dydx_num = diff(y)./diff(x);
dydx_exact = 3*x.^2+4*x-1;
dydx = [[dydx_num,NaN]',dydx_exact'];
figure; plot(dydx)
title('x^3+2x^2-x+3')
legend('Dev Analitica','Sol Numerica')

y1 = x.^5-1;
dydx_num1 = diff(y1)./diff(x);
dydx_exact1 = 5*x.^4;
dydx1 = [[dydx_num1,NaN]',dydx_exact1'];
figure; plot(dydx1)
title('x.^5-1')
legend('Dev Analitica','Sol Numerica')

y2 = sin(x);
dydx_num2 = diff(y2)./diff(x);
dydx_exact2 = cos(x);
dydx2 = [[dydx_num2,NaN]',dydx_exact2'];
figure; plot(dydx2)
title('sin(x)')
legend('Dev Analitica','Sol Numerica')

%% Ejercicio 4 diferenciacion polinomica

p = [1 2 -1 3];
polyder(p)

% caso a)
a = [2 6 9];
b = [1 2 0];
polyder(a,b)

% caso b)
p = conv(a,b)
polyder(p)



