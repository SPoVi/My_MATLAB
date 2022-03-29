%% ==== Práctica 1 - CPyR ====
% Autor :               Sergio Pons
% Fecha creacion:       17/11/2020
% Ultima modificacion:  22/11/2020

%% == Limpiar ==
clear all; close all; clc;

%% == 1. Inicializacion MPC SS ==
IniVar; % Inicializacion de las varaibles
[parameters, Ref,Td]=Initialization_MPC_SS;
MPC_Controllers_P1
%% == 2. Control Law MPC SS ==
%[U,DU]=ControlLaw_MPC_SS(parameters,w,data);

%% == 3. Planta continua ==
% s = tf('s');
% G = (Km/Jm) /(s + (Bm/Jm))
