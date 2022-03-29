%% FUZZY - Impresora
close all; clear all; clc;

load data
plot(out.PosicionReal);
ylabel("Posición (cm)");
title("Logica Fuzzy - Control de posición Impresora");
upperline = refline(0,0.105); upperline.Color = 'k';
lowerline = refline(0,0.095); lowerline.Color = 'k';

