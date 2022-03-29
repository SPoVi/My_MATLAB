% EJERCICIO Muestreo
% y(t) = Suma de tres señales seno, la 1ª tiene una amplitud de 0.7 y una 
% frecuencia de 50Hz, la 2ª tiene una amplitud de 1 y una frecuencia de 120Hz,
% la 3ª (ruido) tiene una amplitud de 0.2 y una frecuencia de 1000Hz.
% Fs=500Hz (Frecuencia de Muestreo)
% Fs=800Hz (Frecuencia de Muestreo)
% Fs=3000Hz (Frecuencia de Muestreo) - FRECUENCIA 


%La señal tiene una componente a 50hz, otra a 120 Hz y ruido  Obtener la DFTS
% La señal original es la suma de dos señales sinusoidales una a 50Hz y otra a 120Hz. Se le añade ruido a 1kHz.

%% Inicialización

clear all;
close all; cl;

%% Declaración de la función contínua:

y = str2func('Mete aquí tu función siguiendo un ejemplo de la ayuda de matlab');

%% Cálculos a Fs=500Hz:

% Ploteo de la función continua: de 0s a 0.03s
figure;
subplot(2,1,1), fplot(y,[0,0.03]);
title('Señal con ruido');xlabel('tiempo (ms)');

% Cálculo de la Transformada de Fourier:

Fs = 500;         % Frecuencia de muestreo;
Ts = --------;    % Periodo de muestreo.
L = 1500;         % Longitud de la señal en muestras.
k = (0:L-1)*------;   % Vector de tiempo discreto.
Y=----------;         % Evalua la función con el vector discreto k. 

% Obten realiza la fft a la señal:

Yf = abs(fft(Y)/L);

% Generar el eje x de la gráfica del espectro. ¿Qué falta por completar ahí?
% Mira la ayuda de linspace. Si generamos ese vector de muestras equidistantes...
% ¿Por qué variable tendremos que multiplicar ese espacio lineal para que
% el espectro quede bien representado?
f = ----*linspace(0,1,L);

% Grafica el espectro debajo de la señal continua.
subplot(2,1,-----);
-------(f,Yf);   % Podríamos poner plot, pero queremos representación discreta.
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
% componente frecuencial en un gráfico nuevo que vaya debajo del anterior. 

figure;
subplot(--,--,--); fplot(----,[0,0.03]); hold on; 
plot(k,----,'ro'); plot(----,----,'g-'); axis([0 0.03 -1 1])

subplot(--,--,--); fplot(----,[0,0.03]); hold on;
plot(k,----,'ro'); plot(k,Y2,'g-'); axis([0 0.03 -1 1])

subplot(--,--,--); fplot(----,[0,0.03]); hold on;
plot(k,----,'ro'); plot(----,-----,'g-'); axis([0 0.03 -0.2 0.2])

%% Repite aquí lo mismo pero para Fs=800Hz:


%% Repite aquí lo mismo pero para Fs=3000Hz:


