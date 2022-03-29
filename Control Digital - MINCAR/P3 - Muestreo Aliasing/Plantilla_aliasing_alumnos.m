% EJERCICIO Muestreo
% y(t) = Suma de tres se�ales seno, la 1� tiene una amplitud de 0.7 y una 
% frecuencia de 50Hz, la 2� tiene una amplitud de 1 y una frecuencia de 120Hz,
% la 3� (ruido) tiene una amplitud de 0.2 y una frecuencia de 1000Hz.
% Fs=500Hz (Frecuencia de Muestreo)
% Fs=800Hz (Frecuencia de Muestreo)
% Fs=3000Hz (Frecuencia de Muestreo) - FRECUENCIA 


%La se�al tiene una componente a 50hz, otra a 120 Hz y ruido  Obtener la DFTS
% La se�al original es la suma de dos se�ales sinusoidales una a 50Hz y otra a 120Hz. Se le a�ade ruido a 1kHz.

%% Inicializaci�n

clear all;
close all; cl;

%% Declaraci�n de la funci�n cont�nua:

y = str2func('Mete aqu� tu funci�n siguiendo un ejemplo de la ayuda de matlab');

%% C�lculos a Fs=500Hz:

% Ploteo de la funci�n continua: de 0s a 0.03s
figure;
subplot(2,1,1), fplot(y,[0,0.03]);
title('Se�al con ruido');xlabel('tiempo (ms)');

% C�lculo de la Transformada de Fourier:

Fs = 500;         % Frecuencia de muestreo;
Ts = --------;    % Periodo de muestreo.
L = 1500;         % Longitud de la se�al en muestras.
k = (0:L-1)*------;   % Vector de tiempo discreto.
Y=----------;         % Evalua la funci�n con el vector discreto k. 

% Obten realiza la fft a la se�al:

Yf = abs(fft(Y)/L);

% Generar el eje x de la gr�fica del espectro. �Qu� falta por completar ah�?
% Mira la ayuda de linspace. Si generamos ese vector de muestras equidistantes...
% �Por qu� variable tendremos que multiplicar ese espacio lineal para que
% el espectro quede bien representado?
f = ----*linspace(0,1,L);

% Grafica el espectro debajo de la se�al continua.
subplot(2,1,-----);
-------(f,Yf);   % Podr�amos poner plot, pero queremos representaci�n discreta.
title('Amplitud del espectro  y') %valor absoluto
xlabel('Frecuencia (Hz)');ylabel('|Y(f)|')

% Discretizar cada componente por separado, evaluandolas con el vector k.

y1 = str2func(-------------);
Y1=y1(k);
y2 = str2func(-------------);
Y2=y2(k);
y3 = str2func(-------------);
Y3=y3(k);

% Grafica las tres componentes en continuo y en discreto, poniendo cada
% componente frecuencial en un gr�fico nuevo que vaya debajo del anterior. 

figure;
subplot(--,--,--); fplot(----,[0,0.03]); hold on; 
plot(k,----,'ro'); plot(----,----,'g-'); axis([0 0.03 -1 1])

subplot(--,--,--); fplot(----,[0,0.03]); hold on;
plot(k,----,'ro'); plot(k,Y2,'g-'); axis([0 0.03 -1 1])

subplot(--,--,--); fplot(----,[0,0.03]); hold on;
plot(k,----,'ro'); plot(----,-----,'g-'); axis([0 0.03 -0.2 0.2])

%% Repite aqu� lo mismo pero para Fs=800Hz:


%% Repite aqu� lo mismo pero para Fs=3000Hz:


