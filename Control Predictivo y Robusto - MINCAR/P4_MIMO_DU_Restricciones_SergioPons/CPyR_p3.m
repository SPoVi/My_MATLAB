%% ==== Práctica 3 - CPyR ====
% Autor :               Sergio Pons
% Fecha creacion:       01/12/2020
% Ultima modificacion:  06/12/2020

%% == Limpiar ==
clear all; close all; clc;

%% == 1. Inicializacion MPC SS ==
Initialization_MPC_SS;

% Simular SIMULINK
SS_MIMO_DU_Restricciones_Simulink_P3
sim("SS_MIMO_DU_Restricciones_Simulink_P3.slx")

%% == 2. Graficas ==
load resultados; % rf sin_restric restric_Delta_u

% = Pregunta 1 = 
figure(1)
subplot(2,1,1);
plot(rf)
hold on 
plot(sin_restric)
plot(restric_Du_u_y)
hold off
grid
title("Respuesta del sistema - Comparativa: Sin restricciones VS. Con Restricciones");
ylabel("Posición");
legend("Ref X", "Ref Y", "Salida X sin restric", "Salida Y sin restric", ...
    "Salida X con restric", "Salida Y con restric");

% = Pregunta 2 =
figure(2)
subplot(2,1,1);
plot(rf)
hold on 
plot(out_h1)
hold off
grid
title("Respuesta del sistema para horizonte = 1");
ylabel("Posición");
legend("Ref X", "Ref Y", "Salida X sin restric", "Salida Y sin restric");

% = Pregunta 3 = 
figure(3)
subplot(2,1,1);
plot(rf)
hold on 
plot(restric_Mp)
hold off
grid
title("Respuesta del sistema - Restriccion de sobreimpulso");
ylabel("Posición");
legend("Ref X", "Ref Y", "Salida X sin restric", "Salida Y sin restric");

subplot(2,1,2);
plot(rf)
hold on 
plot(restric_Mp_R_asim)
hold off
grid
title("Respuesta del sistema - Restriccion de sobreimpulso con R asimetrica");
ylabel("Posición");
legend("Ref X", "Ref Y", "Salida X sin restric", "Salida Y sin restric");

figure(4)
subplot(2,1,1);
plot(rf)
hold on 
plot(restric_y_ref)
hold off
grid
title("Respuesta del sistema - Restriccion de sobreimpulso - Modificacion restriccio de salida");
ylabel("Posición");
legend("Ref X", "Ref Y", "Salida X ", "Salida Y ");