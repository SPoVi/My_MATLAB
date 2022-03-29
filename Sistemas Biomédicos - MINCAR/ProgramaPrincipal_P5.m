%% Sistemas Biomedicos - Práctica 5 - Identificacion de estrés
% Autor : Sergio Pons
% Fecha : 08/12/2020
%% -- Limpiar --
clear all; close all; clc;

%% -- Funciones --
% plotstressSB(file, frameT, dispT, umbral_estres, pr_flag)
% plotstressSB_v2(file, frameT, dispT, p_umbral_estres, pr_flag)

%% Sujeto 4 - 4PI

clear all; close all; clc;
file = '4PI';
frameT = 20;     % tamaño de la ventana. Tipicamente 20
dispT = 5;      % desplazamiento de la ventana
umbral_estres = 1;
p_umbral_estres = 0.3;
%pr_flag = 'print';
pr_flag = ''; % no imprime

plotstressSB(file, frameT, dispT, umbral_estres, pr_flag)
%plotstressSB_v2(file, frameT, dispT, p_umbral_estres, pr_flag)

%% Sujeto 7 - 7PI
clear all; close all; clc;

file = '7PI';
frameT = 20;
dispT = 5;
umbral_estres = 0.9;
p_umbral_estres = 0.5;
%pr_flag = 'print';
pr_flag = ''; % no imprime

plotstressSB(file, frameT, dispT, umbral_estres, pr_flag)
%plotstressSB_v2(file, frameT, dispT, p_umbral_estres, pr_flag)

%% Sujeto 11 - 11PI
clear all; close all; clc;

file = '11PI';
frameT = 20;
dispT = 5;
umbral_estres = 1;
p_umbral_estres = 0.5;
%pr_flag = 'print';
pr_flag = ''; % no imprime

plotstressSB(file, frameT, dispT, umbral_estres, pr_flag)
%plotstressSB_v2(file, frameT, dispT, p_umbral_estres, pr_flag)

%% Sujeto 14 - 14PI
clear all; close all; clc;

file = '14PI';
frameT = 20;
dispT = 5;
umbral_estres = 1;
p_umbral_estres = 0.5;
%pr_flag = 'print';
pr_flag = ''; % no imprime

plotstressSB(file, frameT, dispT, umbral_estres, pr_flag)
%plotstressSB_v2(file, frameT, dispT, p_umbral_estres, pr_flag)

%% Sujeto 29 - 29PI
clear all; close all; clc;

file = '29PI';
frameT = 20;
dispT = 5;
umbral_estres = 1;
p_umbral_estres = 0.5;
%pr_flag = 'print';
pr_flag = ''; % no imprime

plotstressSB(file, frameT, dispT, umbral_estres, pr_flag)
%plotstressSB_v2(file, frameT, dispT, p_umbral_estres, pr_flag)