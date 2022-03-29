%% Práctica 2 - CPyR 
% Autor :               Sergio Pons
% Fecha creacion:       24/11/2020
% Ultima modificacion:  29/11/2020

%% == Pregunta 1 ==
figure;
subplot(2,1,1)
load pregunta1
plot(p0)    % grafica con valores iniciales
hold on
plot(p1)    % grafica con ponderacion asimetrica de R
hold off
grid
legend('theta R simetrica', 'gamma R simetrica', 'theta R asimetrica', 'gamma R asimetrica');
title('Comparacion de resultados - Reduccion efecto acoplamiento');
ylabel('Variacion de angulo de giro (Grados)')
axis([9.95,10.15,0.95,1.15])

%% == Pregunta 2 ==
figure;
subplot(2,1,1)
load pregunta2
plot(p0)    % grafica con valores iniciales
hold on
plot(p2)    % grafica con hu = 1
hold off
grid
legend('theta hu = 8', 'gamma hu = 8', 'theta hu = 1', 'gamma hu = 1');
title('Comparacion de resultados - Variacion del control de horizonte');
ylabel('Variacion de angulo de giro (Grados)')
% axis([4.9,10.2,-0.2,1.2])
axis([4.95,5.15,-0.2,1.2])

subplot(2,1,2)
plot(p0)    % grafica con valores iniciales
hold on
plot(p2)    % grafica con hu = 1
hold off
grid
legend('theta hu = 8', 'gamma hu = 8', 'theta hu = 1', 'gamma hu = 1');
title('Comparacion de resultados - Variacion del control de horizonte');
ylabel('Variacion de angulo de giro (Grados)')
% axis([4.9,10.2,-0.2,1.2])
axis([9.95,10.15,0.95,1.15])

%% == Pregunta 3 ==
figure;
subplot(2,1,1)
load pregunta3
plot(p3)    % grafica con h = hu = 1
grid
legend('theta hu = h = 1', 'gamma hu = h = 1');
title('Comparacion de resultados - Reduccion efecto acoplamiento');
ylabel('Variacion de angulo de giro (Grados)')

%% == Pregunta 5 ==
figure;
subplot(2,1,1)
load pregunta5
plot(rf)    % grafica con valores iniciales
hold on
plot(p5)    % grafica con perturbaciones sin compensar
hold off
grid
legend('ref theta', ' ref gamma','salida theta', 'salida gamma');
title('Comparacion de resultados - Perturbaciones sin compensar');
ylabel('Variacion de angulo de giro (Grados)')
% axis([4.5,10.5,-0.2,1.2])

