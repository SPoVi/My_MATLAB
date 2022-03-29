% mallasYNodos.m

%% EJERCICIO 3.a - Analizando por mallas
clc
clear

% Determinar la corriente que pasa por cada rama
% Datos
Vn = [100 50];
Rn = [5 10 200 150 250];

% Creacion de matriz
% En diagonal, o fila coincidente con el numero de la malla, sumas
% resistencias
% El resto de columnas, restas la resistencai comun a la malla.
R = [Rn(1)+Rn(4) -Rn(4) 0;
     -Rn(4) Rn(2)+Rn(5)+Rn(4) -Rn(5);
     0 -Rn(5) Rn(3)+Rn(5)];

% Si la corriente sale del lado positivo de la fuente es positiva,
% contrario negativa
V = [Vn(1); 0; -Vn(2)];

% I = V / R . Division matricial. Utilizacion inversa.
in = V' / R;    % Fila. 1x3 / 3x3
In = inv(R)*V;  % inv(R) = 1 / R. Columna. 3x3 * 3x1 -> 3x1

% Mostrar por pantalla
fprintf('PRACTICA 2 - EJERCICIO 1\n');
for i = 1:length(in)
    fprintf('i%d es %2.2fA\n',i,in(i));
end

%% EJERCICO 3.b - Analizando por mallas
clc
clear

% Determinar la tension de R8 
% Datos

% Se puede poner como vector tambien V = [V1 V2 ...] y luego utilizarlo
% V(1) V(2) ...
V = [12 10 5 10 6 5 24];

% Las resistencias se icrementan en uno: R1 = 11 -> R4 = R1 + 3
R1 = 11;

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

% Calcular el vector de corrientes I = V/R. Division matricial.
% Hay 9 corrientes 
I = (R\MV)';        % 1x9 / 9x9
i = MV'/R;          % Conversion a una fila  de 9x1 a 1x9 y luego / 9x9
i2 = MV'*inv(R);    % inv(R) = 1/R

% SOLUCION: Tension por R8
VR8 = (R1+7)*(I(5)-I(2));
fprintf('La tension que pasa por R8 es de %2.2fV\n', VR8)

%% EJERCICIO 4.a - Nodos
clc
clear

% Determinar la tensiones en los nodos y la corriente que pasa por la
% resistencia R4

% Datos
En = [100 50];
Rn = [1500 1200 2200 1500];
I = 100e-3;                                         %e-3 = 10^-3

% Matrices
% Matriz Admitancias: Y = 1/R
Y = [1/Rn(1) 1/Rn(2) 1/Rn(3) 1/Rn(4)];
% Matrices del sistema
MY = [(Y(1)+Y(2)+Y(4)) -Y(4); -Y(4) (Y(3)+Y(4))];
MI = [En(1)*Y(1)+En(2)*Y(2); I];
MV = MY\MI                                          %inv(MY)*MI. 2x1 / 2x2
                                                    % Para utilizar inv() tiene que ser cuadrada
% Corriente por R4
I4 = (MV(1)-MV(2))*Y(4);
% Mostrar por pantalla
fprintf('La tension en el nodo 1 es %2.2fV y en el nodo 2 es %2.2fV\n', MV(1),MV(2));
fprintf('La corriente que pasa por R4 es %2.2fA\n',I4);

%% EJERCICIO 4.b - Nodos usando admitancia
clear % Limpiar variables
clc   % Limpiar pantalla

% Determinar la tensiones en los nodos y la corriente que pasa por la
% resistencia R4
% Datos
E = [100 50];
R = [1500 1200 2200 1500];
I1 = 0.1;

% Matriz Admitancias: Y = 1/R
Y = [1/R(1) 1/R(2) 1/R(3) 1/R(4)];
MY = [(Y(1)+Y(2)+Y(4)) -Y(4); -Y(4) (Y(3)+Y(4))];

% Matriz intensidad
I = [E(1)*Y(1)+E(2)*Y(2); I1];

% Tension en nodos
V = MY\I

% SOLUCION. Corriente por R4
I4 = (V(1)-V(2))/R(4);
fprintf('La corriente que pasa por R4 es de %2.2fA\n', I4)


