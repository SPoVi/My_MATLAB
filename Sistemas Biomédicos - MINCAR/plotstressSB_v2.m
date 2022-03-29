function plotstressSB_v2(file, frameT, dispT, p_umbral_estres, pr_flag)
% Autor: Raquel Martinez
% Modificado: Sergio Pons
% Fecha: 03/12/2020

%antes había esto
%function plotstressV2(file, frameT, dispT, umbral_er, umbral_re,umbral_as, pr_flag)
% PLOTSTRESS a partir de datos ECG y GSR muestra en un gráfico variables
% relacionadas con cambios emocionales R->E
%
% inputs:
%   file:       nombre (sin extensión) de ficheros de datos (.txt y .lab)
%   frameT:     tamaño de la ventana en segundos 20sg
%   dispT:      desplazamiento de la ventana en segundos 5sg
%   QUITADO de los INPUTS -> umbral_estres:  umbral q se considera estres =1
%   p_umbral_estres: ponderacion respecto al valor maximo de estres sobre
%   el cual establecer el umbral
%   pr_flag:  si es 'print', imprime grafico en un fichero .pdf


%Si el numero de argumentos de entrada es menor que 5, la variable 
%pr_flag='noprint' y final
if nargin < 5, pr_flag = 'noprint'; end

fsECG = 1000;   %frecuencia de muestreo (1000 Hz)
fsLow = 1;    % frecuencia de muestreo reducida (1 Hz)

% Abrir fichero .txt y cargar datos
variables = load([file, '.txt']);
ECG = variables(:,1);
GSR = variables(:,2);
data_L = length(ECG);
t = (0:data_L-1)/fsECG;
clear variables

% tiempos a frecuencia reducida (1 Hz)
tLow = t(1:fsECG/fsLow:end);
%tLow = tLow(4:end-3);

% Abrir fichero .lab y cargar eventos ---- NUEVO
% Momentos pubtuales donde el observador ha visto que se ha producido un
% momento de estres (anotaciones manuales). Ej: Ha visto como se le ha
% caido una pieza, y anota el instante de tiempo.
fid = fopen([file, '.lab'], 'rt');
lab_N = 0;
while 1
    tline = fgetl(fid);
    if ~ischar(tline), break, end
    if length(tline)<2, break, end
    lab_N = lab_N + 1;
    lab_string{lab_N} = tline(1:2);
    x = sscanf(tline(4:end), '%f %f %f');
    lab_start(lab_N) = x(1);
    lab_stop(lab_N) = x(2);
end
fclose(fid);

% filtro paso-bajo
ord = 25;
fc = 0.04;
h = fir1(ord, 2*fc/fsLow);
tLowFilt = tLow(1:end-ord) + ord/2/fsLow;

figure

%---------- RR -----------
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
RRfilt = conv(h, RRint);
RRfilt = RRfilt(ord+1:end-ord);
RRmaxFilt = max(RRfilt); RRminFilt = min(RRfilt);
RRfiltRange = RRmaxFilt -RRminFilt;
% dibujo RRint y RRfilt
hRR = subplot(3,1,1);
hold on
plot(tLow, RRint,'g'), title([file, ' - RR'])
axis([0 t(end) RRminFilt-0.3 RRmaxFilt+0.3]), grid
plot(tLowFilt,RRfilt, 'k')

% marco eventos ------------------------------- NUEVO: Rectangulos morados
% Utiliza los datos obtenidos del archivo .lab
for i = 1:lab_N
    plot([lab_start(i), lab_stop(i), lab_stop(i), lab_start(i), ...
            lab_start(i)], [RRminFilt-0.3, RRminFilt-0.3, RRmaxFilt+0.3, RRmaxFilt+0.3, RRminFilt-0.3], 'm')
    text(lab_start(i), RRmaxFilt+0.3, lab_string{i}, ...
              'VerticalAlignment', 'Top', 'Color', 'Magenta')
    %plot((lab_start(i)+60)*[1, 1], [RRmin, RRmax], 'm--')
end

%---------- GSR -----------
% diezmo GSR para bajar a 1 Hz
GSR = resample(GSR, fsLow, fsECG);
%GSR = GSR(4:end-3);
GSRmax = max(GSR(:));
GSRmin = min(GSR(:));
%filtro GSR
GSRfilt = conv(h, GSR);
GSRfilt = GSRfilt(ord+1:end-ord);
GSRfiltRange = max(GSRfilt(:)) - min(GSRfilt(:));

% dibujo GSR y GSRfilt 
hGSR = subplot(3,1,2);     % Nombrar a un subplot 
hold on
plot(tLow, GSR, 'g'), title([file, ' - GSR'])
axis([0 t(end) GSRmin GSRmax]), grid
plot(tLowFilt, GSRfilt, 'k')
for i = 1:lab_N
    plot([lab_start(i), lab_stop(i), lab_stop(i), lab_start(i), ...
            lab_start(i)], [GSRmin, GSRmin, GSRmax, GSRmax, GSRmin], 'm')
    text(lab_start(i), GSRmax, lab_string{i}, ...
              'VerticalAlignment', 'Top', 'Color', 'Magenta')
    %plot((lab_start(i)+60)*[1, 1], [GSRmin, GSRmax], 'm--')
end

%--------- características ---------
frameL = round(frameT*fsLow);
hop = round(dispT*fsLow);

iframe = 1:frameL;
tframe = [];
RRslope = [];
GSRslope = [];
% si usamos regresión lineal sobre señales originales
% interpolas para que no de error si coges el inicio y el final
% Las caracteristicas a guardar : RRslope y GSRslope
while iframe(end) <= length(tLow)
    tframe = [tframe, mean(tLow(iframe))];
    p = polyfit(1:frameL, RRint(iframe)/RRfiltRange, 1)*60; %Normalizas entre el rango (para que no dependa de la persona)
    RRslope = [RRslope, p(1)];
    p = polyfit(1:frameL, GSR(iframe)'/GSRfiltRange, 1)*60;
    GSRslope = [GSRslope, p(1)];
    iframe = iframe + hop;
end
% si usamos regresión lineal sobre señales filtradas
% while iframe(end) <= length(tLowFilt)
%     tframe = [tframe, mean(tLowFilt(iframe))];
%     p = polyfit(1:frameL, RRfilt(iframe)/RRfiltRange, 1)*60;
%     RRslope = [RRslope, p(1)];
%     p = polyfit(1:frameL, GSRfilt(iframe)'/GSRfiltRange, 1)*60;
%     GSRslope = [GSRslope, p(1)];
%     iframe = iframe + hop;
% end


%% detección cambio de relajación a estres -------------------NUEVO
% Si la sudoracion sube y el pulso se acelera: iprod
iprod = (RRslope < 0) & (GSRslope > 0); % 1 cuando la pendiente de RR sea negativa y la GSR positiva y 0 el resto. Vector.
prod = -RRslope.*GSRslope; % producto de ambas pendientes en positivo
product_estres = NaN(1,length(tframe));%crear un vector vacio 
product_estres(iprod) = prod(iprod); %en las posiciones ponde las pendientes cruzan, se rellena el dato

%% CREACION YO

umbral_estres = round(p_umbral_estres * max(product_estres),2); % redondea a dos decimas
ialarma = product_estres > umbral_estres; % comparo si las pendientes son mayores que un umbral
alarma_estres = NaN(1,length(tframe)); %Creo un vector vacio
% PONER YO
alarma_estres(ialarma) = 1; % si las pendientes son mayores que un umbral, marco un 1

pts_estres = (max(RRfilt)+min(RRfilt))/2*alarma_estres;
cnt_estres = find( pts_estres > 0);


%% Mostrar por pantalla
fprintf("\n=== RESULTADOS ==");
fprintf("\nPico de estres: %.2f", max(product_estres));
fprintf("\nPorcentaje del umbral: %.2f", p_umbral_estres);
fprintf("\nUmbral de estres: %.2f", umbral_estres);
fprintf("\nCantidad de momentos de estres: %d",numel(cnt_estres));


fprintf("\n\n\n\n");



%% Graficas 
subplot(3,1,3)
title([file, ' - Producto ER'])
hold on
plot(tframe, RRslope, 'g.-')
plot(tframe, GSRslope, 'c.-')
plot(tframe, product_estres, 'r^-', 'LineWidth', 2, 'MarkerSize', 1.5)
axis tight
ax = axis;
axis([0 t(end) ax(3) ax(4)]), grid
h = legend('-RR slope (reglin)', 'GSR slope (reglin)', 'productER', ...
       'productRE', 'Location', 'North');
set(h, 'FontSize', 6)

subplot(hRR)
plot(tframe, (max(RRfilt)+min(RRfilt))/2*alarma_estres, 'b^', 'LineWidth', 1.5)
subplot(hGSR)
plot(tframe, (GSRmax+GSRmin)/2*alarma_estres, 'r^', 'LineWidth', 1.5)

%% PDF
if strcmp(pr_flag, 'print')
  set(gcf, 'PaperSize', [29.6774 20.984])
  set(gcf, 'PaperPosition', [1 1 27.6774 18.984])
  set(gcf, 'Units', 'normalized')
   print(gcf, '-dpdf', [file, '_', num2str(frameT) ...
                             , '_', num2str(dispT) ...
                             , '_', num2str(umbral_estres) ...
                             , '.pdf'] ) 
end

