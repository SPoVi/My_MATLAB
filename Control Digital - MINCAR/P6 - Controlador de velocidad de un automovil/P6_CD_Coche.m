%% Práctica 6 CD - Entregable - Coche
% Autor: Sergio Pons
close all
clear all
clc
%% Parametros
M = 1000;   % [Kg] Masa del coche
b = 50;     % [Ns/m] Coeficiente de amortiguamiento
T=0.02;     % Periodo de muestreo
%% 1 Ecuacion en el dominio de Laplace. Funcion de transferencia.
s = tf('s');
% U(s)/V(s)
Gp = 1/(M*s+b);


%% 2. Discretización
z = tf('z',T);  
ret_1 = 1/s;        % Gzoh
ret_2 = 1-z^-1;     % ZOH_dis : Parte discretizada directa de ZOH

% Se divide por el periodo porque el método del impulso da el resultdo de
% la TZ de la tabla pero multiplicado por el periodo (T)
Gd_1 = (1/T)*c2d(Gp*ret_1,T,'impulse'); % Gzla 
Gd = Gd_1*ret_2;                        % FT discreta
Gd_fac =zpk(Gd);                        % Factorizada
Gdf = minreal(Gd_fac,0.001)             % Simplificada

%% 3. Regulador proporcional
sisotool('rlocus',Gdf)  % LR

%% 4. Controlador de Retraso
% Mp < 15% y tr < 0.4s -> zeta = 0.517 y Wn = 19.343
zeta = 0.517;
wn = 19.343;
sgrid(zeta,wn)  % comando para plotear las restricciones de zeta y Wn

% Las dos lineas de puntos en agunlo de 45º indican ubicaciones de los
% polos con delta = 0.7 (zeta); en medio de estas lineas, los polos tendrán
% delta > 0.7 y el exterior de las lineas tendrán delta < 0.7

% El semicirculo indica ubicaciones de lo spolos con una frecuencia natural
% wn=1.8; dentro del cirulo wn<1.8 y fuera wn>1.8
%% 5. Comprobacion Matlab
C = 37758*(z-0.87)/(z-1);
Gz_lc = feedback(C*Gdf,1);
step(Gz_lc)

%% 7. Comparacion con SIMULINK
step(Gz_lc)
hold on
plot(out.simout)
hold off
legend('Resultado Matlab','Referencia', 'Resultado Simulink');
title('Comparación de resultados');
grid

