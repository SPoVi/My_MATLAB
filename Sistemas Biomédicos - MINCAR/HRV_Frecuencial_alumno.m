%% == Sistemas Biomedicos ==
% Autor: Raquel Martinez
% MOd: Sergio Pons
% Fecha: 30/11/2020

%% = Codigo =
% Lectura del archivo hrv_p1.txt y determinación de los tiempos
% tRR en segundos en los que se presentan los intervalos temporales RR
% expresados en segundos
RR = RR_relax;
tRR = tLow_relax;

% Determinación  de los datos igualmente espaciados RRi obtenidos por interpolación 
% de los datos RR con muestreo periódico de periodo Tm=1 segundo (número entero
% más próximo a la media de RR)
Tm=round(mean(RR));
ti=ceil(tRR(1)):Tm:floor(tRR(end));
RRi=interp1(tRR,RR,ti,'spline');
% Determinación del espectro de potencia ep(F) utilizando la transformada de Fourier 
frec=(0:length(RRi)-1)/length(RRi);
indD=find(0.01<=frec & frec<=0.5); %Indices de frecuencia
domD=frec(indD);
%   ESPECTRO DE POTENCIA
frecuencial.ep=1/length(RRi)*abs(fft(RR)).^2; 
% Determinación del máximo valor del espectro de potencia ep(F) en el dominio
% frecuencial domD y la frecuencia de domD en la que se alcanza dicho valor máximo
epmax=max(frecuencial.ep(indD));
indmax=find(frecuencial.ep(indD)==epmax);
frecmax=domD(indmax);
% Determinación del espectro de potencia normalizado epn(F) y su representación gráfica
% en domD
epn=1/epmax*frecuencial.ep;
figure(1);plot(domD,epn(indD));title('espectro de potencia normalizado'); 
axis([0.01 0.5 0 1.2]);
xlabel('frecuencia F en Hz');ylabel('epn(F)');
% Cálculo de las potencias pLF, pMF, pHF y pD=pLF+pMF+pHF, así como los
% indicadores pC1=pLF/pHF y pC2=pMF/(pLF+pHF)considerando el espectro de 
% potencia normalizado epn(F)
figure(2);
plot(domD,epn(indD));axis([0.01 0.08 0 1.2]);
indD1=find(0.01<=frec & frec<=0.08);
frecuencial.pLF=trapz(frec(indD1),epn(indD1)); % Potencia en bajas frec

figure(3);
plot(domD,epn(indD));axis([0.08 0.15 0 1.2]);
indD2=find(0.08<=frec & frec<=0.15); 
frecuencial.pMF=trapz(frec(indD2),epn(indD2)); % Potencia en  frec medias

figure(4);
plot(domD,epn(indD));axis([0.15 0.5 0 1.2]);
indD3=find(0.15<=frec & frec<=0.5);
frecuencial.pHF=trapz(frec(indD3),epn(indD3)); % Potencia en altas frec

% Indices. Relaciones entre las frecuencias
frecuencial.pD=frecuencial.pLF+frecuencial.pMF+frecuencial.pHF;
frecuencial.pC1=frecuencial.pLF/frecuencial.pHF;
frecuencial.pC2f=frecuencial.pMF/(frecuencial.pLF+frecuencial.pHF);

%% == Guardar ==
% save P4_frecuencial_relax frecuencial
