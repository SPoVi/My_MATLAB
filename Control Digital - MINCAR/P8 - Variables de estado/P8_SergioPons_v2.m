%% Practica 8 - Control Digital
% Autor: Sergio Pons Villanueva
clear all
close all
clc

J = 0.01;   % Momento de inercia del rotor [kg*m2/s2]
b = 0.1;    % Coef. de amortiguamiento del sist. mecánico [Nms]
K = 0.01;   % Cte. de fem [Nm/A]
Ki = K; 
Kb = K;
R = 1;      % Resistencia electrica [ohm]
L = 0.5;    % Inductancia eléctrica [H]

% Matrices
A = [-R/L -Kb/L, 0;
     Ki/J -b/J,  0;
     0      1    0]
 
B = [1/L; 0; 0]
C = [0, 0, 1]
D = 0

sys = ss(A,B,C,D)

%%polos
eig(A)
% Forma externa
G = minreal(zpk(tf(sys)))

%% Represenacion Var.Estado (interna)
Ts = 0.1;
[zA zB] = c2d(A,B,Ts)
roots(poly(zA))

%% Representacion externa dom z
z = tf('z',Ts)
Gz = minreal(C*inv(z*eye(3)-zA)*zB, 0.0001)
%% Matriz contrabilidad
 Mc = ctrb(zA,zB)
 rank(Mc)
%% Matriz de ganancias
p = [0, 1e-3+1e-3j, 1e-3-1e-3j]
K = place(zA,zB,p)
k3 = K(3)
K(3)=0
%% Plot
plot(out.y)
grid
title('Posicion (theta_m)')
ylabel('Amplitud (rad)')
