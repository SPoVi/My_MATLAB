%% ==== Sistemas Biomedicos - HRV ==== 
% Autor: Raquel Martinez
% Mod:  Sergio Pons
% Fecha: 30/11/2020

%% == Limpiar ==
clear all; close all; clc

%% == Codigo ==
% Obtener una parte temporal específica de las bioseñales. Obtener un frame
% de señales entre unos tiempo determinados. Y las señales filtradas
file = '4PI';

fsECG = 1000;   % frecuencia de muestreo (1000 Hz)
fsLow = 1;      % frecuencia de muestreo reducida (1 Hz)

% Abrir fichero .txt y cargar datos
variables = load([file, '.txt']);
ECG = variables(:,1);
GSR = variables(:,2);
data_L = length(ECG);
t = (0:data_L-1)/fsECG;
clear variables

% tiempos a frecuencia reducida (1 Hz)
tLow = t(1:fsECG/fsLow:end);

% filtro paso-bajo
ord = 25;
fc = 0.04;
fn = fsLow/2;
h = fir1(ord, fc/fn);
tLowFilt = tLow(1:end-ord) + ord/2/fsLow;

figure
%% ---------- RR -----------
% detectar pulsos y calcular RR
qrsPos = nqrsdetect(ECG, fsECG);
RR = (qrsPos(2:end) - qrsPos(1:end-1))/fsECG;
n=length(RR)-1;
tRR=RR(1);
for k=1:n
            tRR(k+1)=tRR(k)+RR(k+1);
end

% interpolar para obtener RR equiespaciada
RRint = interp1(tRR, RR, tLow,'spline');
RRmax = max(RRint(:));
RRmin = min(RRint(:));
% filtro RR
A=1; B=h; 
RRfilt = filter(B,A, RRint);
RRfiltRange = max(RRfilt(:)) - min(RRfilt(:));

% dibujo RRint y RRfilt
hRR = subplot(2,1,1);
hold on
plot(tLow, RRint,'g'), title([file, ' - RR'])
axis([0 t(end) RRmin RRmax]), grid
plot(tLow,RRfilt, 'k')

%% -- FRAMES --
%Frame de relajación (señal RR desde los 10 sg a los 110sg)
i=find(tLow>10 & tLow<120);     % indices donde el tiempo esta entre 10 y 110. Vector.
ie = find(tLow>123 & tLow<725); % indice vector estres
ie2 = find(tLow>123 & tLow<200);% indice vector de estres mas corto

RR_relax=RRint(i);              % señal RR interpolado en ese intervalo
tLow_relax=tLow(i);             % señal tiempo en ese intervalo
plot(tLow_relax,RR_relax)

RR_estres=RRint(ie);
tLow_estres=tLow(ie);
plot(tLow_estres,RR_estres,'r');

RR_f_estres=RRint(ie2);
tLow_f_estres=tLow(ie2);
plot(tLow_f_estres,RR_f_estres,'b');
% HRV_Frecuencial_alumno;