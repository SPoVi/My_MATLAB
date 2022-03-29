%% === SB - Practica HRV - Programa base ==
% Autor : Sergio Pons
% Fecha : 08/12/2020

%% == Limpiar ==
clear all; close all; clc

%% == Codigo ==
% Archivo a abrir
file = '4PI';

% = Funcion Signal Frame = 
% Devuelve una grafica y una estructura con los valores RR y tRR para
% distintas ventanas (relajacion, estres y estres corto) en una
% estructura : frames

% function [frames] = fSignalFrame(file,ti1,ti2,tie1,tie2,tiec1,tiec2,tiini,tifin)
% Para file = 4PI
% ti1   = 10   relax
% ti2   = 120  relax
% tie1  = 125  estres
% tie2  = 725  estres 
% tiec1 = 125  estres corto
% tiec2 = 200  estres corto
% tiini = 5 toda laseñal
% tifin = 870 toda la señal
frames = fSignalFrame(file,10,120,125,725,125,200,5,870)

% = Funcion HRV Estadistico = 
% Devuelve unas graficas y una estructura que contiene: la media, la mediana,
% la moda, el maximo, el minimo, el rango, la desviacion media, la
% desviacion estandar, DARR, rMSDD, pNN50 , itHRV e iTINN
% estructura : estadistico
% function [estadistico] = fHRV_Estadistico(RR, tRR)

% = Funcion HRV Frecuencial = 
% Devuelve unas graficas y una estructura que contiene: ep, pLF, pMF, pHF,
% pD, pC1,PC2f
% estructura : frecuencial
% function [frecuencial] = fHRV_Frecuencial(RR, tRR)

% = Funcion HRV Poincare = 
% Devuelve unas graficas y una estructura que contiene: ep, pLF, pMF, pHF,
% pD, pC1,PC2f
% estructura : poincare
% function [poincare] = fHRV_Poincare(RR)
%% = Selector de tipo de señal =
% Se ha creado un switch case para elegir que tipo de estado graficar:
% 1 - relax
% 2 - estres
% 3 - estrés corto
% 4 - relax y estres
% 5 - relax, estres y estres corto
% 6 - toda la señal

% Todas las opciones se guardan en sus estructuras mediante subestructuras.

estado = 6; % Eleccion del tipo de estado

switch estado
    case 1 % relax
        estadistico.relax = fHRV_Estadistico(frames.RR_relax, frames.tLow_relax)
        frecuencial.relax = fHRV_Frecuencial(frames.RR_relax, frames.tLow_relax)
        poincare.relax = fHRV_Poincare(frames.RR_relax)
        
    case 2 % estres
        estadistico.estres = fHRV_Estadistico(frames.RR_estres, frames.tLow_estres)
        frecuencial.estres = fHRV_Frecuencial(frames.RR_estres, frames.tLow_estres)
        poincare.estres = fHRV_Poincare(frames.RR_estres)
        
    case 3 % estres corto
        estadistico.estres_corto = fHRV_Estadistico(frames.RR_estres_corto, frames.tLow_estres_corto)
        frecuencial.estres_corto = fHRV_Frecuencial(frames.RR_estres_corto, frames.tLow_estres_corto)
        poincare.estres_corto = fHRV_Poincare(frames.RR_estres_corto)
    
    case 4
        %relax
        estadistico.relax = fHRV_Estadistico(frames.RR_relax, frames.tLow_relax)
        frecuencial.relax = fHRV_Frecuencial(frames.RR_relax, frames.tLow_relax)
        poincare.relax = fHRV_Poincare(frames.RR_relax)
        
        %estres
        estadistico.estres = fHRV_Estadistico(frames.RR_estres, frames.tLow_estres)
        frecuencial.estres = fHRV_Frecuencial(frames.RR_estres, frames.tLow_estres)
        poincare.estres = fHRV_Poincare(frames.RR_estres)
        
    case 5
        %relax
        estadistico.relax = fHRV_Estadistico(frames.RR_relax, frames.tLow_relax)
        frecuencial.relax = fHRV_Frecuencial(frames.RR_relax, frames.tLow_relax)
        poincare.relax = fHRV_Poincare(frames.RR_relax)
        close all; % No mostrar graficas
        
        %estres
        estadistico.estres = fHRV_Estadistico(frames.RR_estres, frames.tLow_estres)
        frecuencial.estres = fHRV_Frecuencial(frames.RR_estres, frames.tLow_estres)
        poincare.estres = fHRV_Poincare(frames.RR_estres)
        close all; % No mostrar graficas
        % estres corto
        estadistico.estres_corto = fHRV_Estadistico(frames.RR_estres_corto, frames.tLow_estres_corto)
        frecuencial.estres_corto = fHRV_Frecuencial(frames.RR_estres_corto, frames.tLow_estres_corto)
        poincare.estres_corto = fHRV_Poincare(frames.RR_estres_corto)
        close all; % No mostrar graficas
        
    case 6 % toda la señal
        estadistico.todo = fHRV_Estadistico(frames.RR_todo, frames.tLow_todo)
        frecuencial.todo = fHRV_Frecuencial(frames.RR_todo, frames.tLow_todo)
        poincare.todo = fHRV_Poincare(frames.RR_todo)
    otherwise
        fptinf("\nOpcion de estado no valida");
end

