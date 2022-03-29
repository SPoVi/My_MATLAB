% analisisMallasYNodos.m

% Datos
V1 = 100;
V2 = 50;
R1 = 5;
R2 = 10;
R3 = 200;
R4 = 150;
R5 = 250;

% Matrices (fxc)
A = [R1+R4 -R4 0; -R4 R4+R2+R5 -R5; 0 -R5 R3+R5];    % Matriz 3x3
%I = [I1 I2 I3]
V = [V1; 0; -V2];                                     % Matriz 3x1

I = inv(A)*V

%% Determinar la tension de R8 

% Limpiar variables y pantalla
clear
clc
% Datos

% Se puede poner como vector tambien V = [V1 V2 ...] y luego utilizarlo
% V(1) V(2) ...
V = [12 10 5 10 6 5 24];

% Las resistencias se icrementan en uno: R1 = 11 -> R4 = R1 + 3
R1 = 11;

% Hay 9 corrientes 

% Matriz resitencias.  Matriz 9x9
R = [R1+(R1+1)+(R1+6)   0   0   -(R1+6) 0   0   0   0   0;
     0  (R1+2)+(R1+4)+(R1+7)    -(R1+4) 0   -(R1+7) 0   0   0   0;
     0  -(R1+4) (R1+3)+(R1+5)+(R1+8)+(R1+4) 0   0   -(R1+8) 0   0   0;
     -(R1+6)    0   0   (R1+6)+(R1+9)+(R1+12)   -(R1+9) 0   -(R1+12) 0 0;
     0  -(R1+7) 0   -(R1+9) (R1+7)+(R1+9)+(R1+10)+(R1+13)   -(R1+10) 0 -(R1+13) 0;
     0 0 -(R1+8) 0  -(R1+10)    (R1+8)+(R1+11)+(R1+14)+(R1+10)  0   0   -(R1+14);
     0 0 0 -(R1+12) 0   0   (R1+12)+(R1+16)+(R1+19)+(R1+15) -(R1+16)    0;
     0  0   0   0   -(R1+13)    0   -(R1+16)    (R1+13)+(R1+17)+(R1+16)+(R1+20) -(R1+17);
     0  0   0   0   0   -(R1+14)    0   -(R1+17)    (R1+14)+(R1+18)+(R1+21)+(R1+17)]; 
    
% Matriz tensiones. Columna. Matriz 9x1;
MV = [-V(1); V(1); -V(2); V(3); 0; 0; V(4)-V(5); V(5)-V(6); V(6)-V(7)];

% Calcular el vector de corrientes
I = (R'\MV)';

% SOLUCION: Tension por R8
disp('La tension que pasa por R8 es :')
VR8 = (R1+7)*(I(5)-I(2))



%% EJERCICIO 2

% analisisNodos.m

clear % Limpiar variables
clc   % Limpiar pantalla

% Datos
E = [100 50];
R = [1500 1200 2200 1500];
I1 = 0.1;

% Matriz Admitancias: Y = 1/R
Y = [1/R(1); 1/R(2); 1/R(3); 1/R(4)];
MY = [(Y(1)+Y(2)+Y(4)) -Y(4); -Y(4) (Y(3)+Y(4))];

% Matriz intensidad
I = [E(1)*Y(1)+E(2)*Y(2); I1];

% Tension en nodos
V = MY\I;

% SOLUCION. Corriente por R4
disp('La corriente que pasa por R4 es: ')
I4 = (V(1)-V(2))/R(4)
