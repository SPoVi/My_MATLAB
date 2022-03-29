%% ==== Práctica 2 - CPyR ====
% Autor :               Sergio Pons
% Fecha creacion:       24/11/2020
% Ultima modificacion:  29/11/2020

%% == Limpiar ==
clear all; close all; clc;

%% == 1. Inicializacion MPC SS ==
IniVar; % Inicializacion de las varaibles
[parameters, Ref,Td]=Initialization_MPC_SS;
% Iniciar SIMULINK
SS_MIMO_DU_Perturbacion_Simulink_P2