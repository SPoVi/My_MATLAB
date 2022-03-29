function [frames] = fSignalFrame(file,ti1,ti2,tie1,tie2,tiec1,tiec2,tiini,tifin)
% Autor: Sergio Pons
% Fecha: 08/12/2020
%% == Inputs ==
% file  = Nombre del archivo .txt a cargar
% ti1   = Tiempo minimo de la venta de estado de relajacion
% ti2   = Tiempo maximo de la venta de estado de relajacion
% tie1  = t min ventana estres
% tie2  = t max ventana estres
% tiec1 = t min ventana estres corta
% tiec2 = t max ventana estres corta
% tiini = t inicial de toda laseñal, normalmente 0
% tifin = t donde cortar la señal, por si hay que cortar señal al final

% Para file = 4PI
% ti1   = 10
% ti2   = 120
% tie1  = 125
% tie2  = 725
% tiec1 = 125
% tiec2 = 200
% tifin = 870
%% == Codigo ==
% Obtener una parte temporal específica de las bioseñales. Obtener un frame
% de señales entre unos tiempo determinados. Y las señales filtradas
% file = '4PI';

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
figure;
hRR = subplot(2,1,1);
hold on
plot(tLow, RRint,'g'), title([file, ' - RR'])
axis([0 t(end) RRmin RRmax]), grid
plot(tLow,RRfilt, 'k')

%% -- FRAMES --
%Frame de relajación (señal RR desde los 10 sg a los 110sg)
i=find(tLow>ti1 & tLow<ti2);         % indices donde el tiempo esta entre 10 y 110. Vector.
ie = find(tLow>tie1 & tLow<tie2);    % indice vector estres
iec = find(tLow>tiec1 & tLow<tiec2); % indice vector de estres mas corto
itodo = find(tLow>tiini & tLow<tifin); % indice vector toda la señal valida

% Se ha creado la esrtuctura "frames"
frames.RR_relax=RRint(i);              % señal RR interpolado en ese intervalo
frames.tLow_relax=tLow(i);             % señal tiempo en ese intervalo
plot(frames.tLow_relax,frames.RR_relax)

frames.RR_estres=RRint(ie);
frames.tLow_estres=tLow(ie);
plot(frames.tLow_estres,frames.RR_estres,'r');

frames.RR_estres_corto=RRint(iec);
frames.tLow_estres_corto=tLow(iec);
plot(frames.tLow_estres_corto,frames.RR_estres_corto,'b');

% Tambien se añade toda la señal a la estructura para comprobar el estado
% del corazon
frames.RR_todo = RRint(itodo);
frames.tLow_todo = tLow(itodo);

end