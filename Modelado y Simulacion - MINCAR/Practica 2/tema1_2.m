%% Tema 2. ODE's

% EJEMPLO 1 . Graficar solucion

T = 5;
x0 = 1;
a = -1/T;

t = [0:1:25];
x = exp(a*t)*x0;

plot(t,x);
grid;

%% EJERCICIO 1
clc 
clear
tspan = linspace(0,25); % Crea vector de 0 a 25 con saltos de unidad

% Datos iniciales
x0 = 1;

% ODE
% odeset se utiliza para personalizar las tolerancias del error
% esto garantia que el error a cada paso es menor o igual que Reltol por el
% valor a cada paso, y menos que AbsTol.
% Si se baja la tolerancia se puede ralentizar mucho la solucion
% La curva es mas fina
options = odeset('RelTol',1e-6, 'AbsTol',1e-10);
options2 = odeset('RelTol',1e-9, 'AbsTol',1e-15);
options3 = odeset('RelTol',1e-12, 'AbsTol',1e-20);

y = ode23(@mydiff,tspan,x0,options); % [t,y] = ode23(@m..)
z = ode23(@mydiff,tspan,x0);
c = ode23(@mydiff,tspan,x0,options2);
d = ode23(@mydiff,tspan,x0,options3);
[t,x] = ode23(@mydiff,tspan,x0);
%Grafica
plot(y.x, y.y, 'b','LineWidth',1)   % x,y, color line, anchura
ylabel('Solucion de la ED');        % dar nombre a eje
hold on                             % aguantar imagen para combinar con otras
plot(z.x, z.y, 'r')
hold on
plot(c.x,c.y,'g')
hold on
plot(d.x,d.y,'k')
hold off                            % dejar de aguantar imagen 

%%  EJERCICIO 2
clc
clear

tspan = [-1,1];     
x0 = [1,1];

options = odeset('RelTol',1e-6,'AbsTol',1e-10);
[t,y] = ode23(@mydiff2,tspan,x0, options);
z = ode23(@mydiff2,tspan,x0, options);

% t o z.x contendra el lapso de tiempo
% y o y.y contendra el valor de las dos derivadas, es decir habra dos filas
% en la matriz z.y; y tres columnas en y

% se comprueba que z.x = t e z.y = y. Es como si se creara un vector z con
% dos variables 't' e 'y'; para acceder a ellas utilizas el punto z.x, z.y
% siendo las coordenadas x e y de la grafica
plot(t,y,'-')
hold on
plot(z.x,z.y,'r')
hold off
grid
title('Solution of dy/dt=x and dx/dt=-y')     % Titulo de la imagen
legend('y','x','z')                 % Leyenda arriba a la izquierda en un cuadrito

%% EJERCICIO 2B

% Añadimos una funcion más

clc
clear

tspan = [-1,1];     
x0 = [1,1,1];                % Tantos valores iniciales como funciones

options = odeset('RelTol',1e-6,'AbsTol',1e-10);
[t,y] = ode23(@mydiff2b,tspan,x0,options);
%z = ode23(@mydiff2,tspan,x0, options);

% t o z.x contendra el lapso de tiempo
% y o y.y contendra el valor de las tres derivadas, es decir habra tres filas
% en la matriz z.y; y tres columnas en y

% se comprueba que z.x = t e z.y = y. Es como si se creara un vector z con
% dos variables 't' e 'y'; para acceder a ellas utilizas el punto z.x, z.y
% siendo las coordenadas x e y de la grafica
plot(t,y,'-')
%plot(z.x,z.y,'-')
grid

%% EJERCICIO 3
 clc
 clear
 
 % Datos
 tspan = [0 25];
 x0 = 1;
 options = odeset('RelTol',1e-6,'AbsTol',1e-10);
 a = -1/5;
 b = 1;
 param = [a b];
 
 [t,y] = ode45(@mydiff3,tspan,x0,[],param);
 plot(t,y,'r')
 grid
 
%% SUMARIO
clear
clc
% utiliza suma.m
% utiliza retsa.m
s = myfun(@suma,1,2,3) % s = 6. 1+2=3 3+3=6
r = myfun(@resta,1,2,3) % s = 2. 1-2=-1 -1+3=2

% utiliza myfun2 que contiene otra funcion interna (producto), no es necesario pasar
% la funcion interna como parametro, lo hace directamente.
t = myfun2(1,2,3) % t = 6. 1*2=2 2*3=6

