%% ==== Práctica 1 - CPyR - Graficas de SIMULINK ======
% Autor :               Sergio Pons
% Fecha creacion:       17/11/2020
% Ultima modificacion:  22/11/2020

%% == Pregunta 2 ==  Variacion de q y r
% Contiene las variables para q=r=1 y q=r=2
figure
load data_qr_h10.mat
plot(tsim_h,ref)
hold on
plot(tsim_h,qr1)
plot(tsim_h,qr2)
plot(tsim_h,qr5)
hold off
axis([0 0.3 -150 250])
grid
legend('Referencia','q=r=1','q=r=2','q=r=5');
title("Variacion de r y q");
% Calculamos numericamente su diferencia para corroborar lo observado en la
% grafica.
sum(qr1-qr2)    % El resultado obtenido es 0, los resultados son identicos.

%% == Pregunta 3 == Varaicion del horizonte
figure
load comparacion_h.mat   
plot(tsim_h,ref)
hold on
plot(tsim_h,h1)
plot(tsim_h,h3)
plot(tsim_h,h5)
plot(tsim_h,h10)
plot(tsim_h,h20)
hold off
axis([0 0.3 -150 250])
grid
legend('Referencia','h=1','h=3','h=5','h=10','h=20');
title("Variacion del horizonte para q=10 y r=1");

%%
% h20 = out.simout.Data(:,2);
% load comparacion_h.mat
% save comparacion_h tsim_h ref h1 h3 h5 h10 h20