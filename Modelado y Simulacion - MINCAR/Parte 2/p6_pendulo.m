%% Practica 6 

%% Varriables

M  = 0.5;    % kg  (masa del carro)
m  = 0.2;    % kg (masa del péndulo)
b  = 0.1;    % N/m/sec (coef de fricción del carro)
l  = 0.3;    % m (distancia al centro de masa del péndulo)
I  = 0.006;  % kg.m^2 (momento de inercia del péndulo) 
g = 9.8;      % m/s^2 (gravedad)
%% Ecuaciones

s = tf('s');

q = (M+m)*(I+m*l^2)-(m*l)^2;
%Phi/U
G1 = (m*l/q)*s/(s^3+(b*(I+m*l^2)/q)*s^2-((M+m)*m*g*l/q)*s-(b*m*g*l/q))
%X/U
G2 = (((I+m*l^2)*s^2 -g*m*l)/q)/(s^4+(b*(I+m*l^2)/q)*s^3-((M+m)*m*g*l/q)*s^2-(b*m*g*l/q)*s)

num2 = [(I+m*l^2)/q 0 -g*m*l/q];
den2 = [1 b*(I+m*l^2)/q -((M+m)*m*g*l/q) -(b*m*g*l/q) 0];
G2 = tf(num2,den2)

%% Grafica impulso e escalon
figure;
impulse (G1)
hold on
impulse(G2);
hold off;
figure;
step(G1)
hold on
step(G2)
hold off;

%% Polos y ceros
pole(G1)
zero(G1)

figure;
rlocus(G1)

sisotool(G1)
sisotool(G2)

%% Diseño de un controlador PID

plot(Pendulo(:,1),Pendulo(:,2))
title('Respuesta Pendulo a impulso unitario');
legend('Sistema');
xlabel('Time (seconds)');
ylabel('Amplitude');
grid

plot(Carro(:,1),Carro(:,2))
title('Respuesta Pendulo y Carro a impulso unitario');
legend('Péndulo', 'Carro');
xlabel('Time (seconds)');
ylabel('Posicion del Carro y del Péndulo');
grid