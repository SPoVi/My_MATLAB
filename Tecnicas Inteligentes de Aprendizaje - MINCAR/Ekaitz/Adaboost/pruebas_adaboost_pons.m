%% == Ejecucion reiterada de Adaboost. Maximos y minimos ==
% Autor: Sergio Pons
% Fecha: 24/10/2020

%% == Limpiar ==
clc; clear all; close all; 

%% == Codigo == 
% == Parámetros de inicializacion para las pruebas == 
pError = 0.3;         % Probabilidad de error. Debe ser menor que 0.5.
Nc = 10;                                 % Numero de clasificadores
Np = 200;                                % Numero de patrones

% Codigo para las pruebas en las varaciones de parámetros
Npruebas = 100;    % Numero de pruebas a realizar
v_te = zeros(2, Npruebas);  % Vector donde guardar los resultados max y min
emax = 0;
emin = 100;
for np = 1:Npruebas
    Adaboost_Pons;  % file.m
    te = tasa_error;
    
    % Comparacion de error
    if te > emax   
        emax = te;
        % Guardar el max
        v_te(1) = emax;
    end
    if te < emin
        emin = te;
        % Guardar el min
        v_te(2) = emin;
    end
end

% Mostar resultados
fprintf("===== RESULTADOS =====\n")
fprintf("\nMaximo obtenido %.2f%% \n", v_te(1));
fprintf("\nMínimo obtenido %.2f%% \n", v_te(2));
