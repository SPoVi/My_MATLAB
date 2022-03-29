function [estadistico] = fHRV_Estadistico(RR, tRR)
%% = Inicializacion =
% Lectura del archivo hrv_p1.txt y representación gráfica de la
% variabilidad del ritmo cardiaco considerando los intervalos temporales RR
% expresados en segundos
% RR = RR_relax;
% tRR = tLow_relax;

figure;
plot(tRR,RR);title('variabilidad del ritmo cardiaco');
xlabel('tiempo en segundos(s)');ylabel('tiempo entre latidos RR en segundos(s)');

figure;
subplot(3,1,1);plot(tRR,RR);
% axis([210,216,min(RR),max(RR)]);
title('variabilidad del ritmo cardiaco');
subplot(3,1,2);plot(tRR,RR,'o');
%axis([210,216, min(RR),max(RR)]);
subplot(3,1,3); plot(tRR,RR,tRR,RR,'o');
%axis([210,216, min(RR),max(RR)]);

%% = Estadisticos = 
% Determinación de algunas medidas de posición y dispersión de la variable 
% estadística discreta asociada a RR
% Creacion de estructura: estadistico
estadistico.media=mean(RR);
estadistico.mediana=median(RR);
estadistico.moda=mode(RR);
estadistico.maximo=max(RR);
estadistico.minimo=min(RR);
estadistico.rango=estadistico.maximo-estadistico.minimo;
estadistico.desviacionmedia=mean(abs(RR-mean(RR)));
estadistico.desviacionestandar=std(RR,1);

% Determinación de los índices rMSDD y pNN50 de la HVR
estadistico.DARR=abs(RR(2:length(RR))-RR(1:length(RR)-1));
estadistico.rMSDD=std(estadistico.DARR,1);
ind=find(estadistico.DARR>=0.05);
estadistico.pNN50=length(ind)/length(RR);

%% = Histograma =
% Representación gráfica del histograma de la variable estadística discreta
% asociada a RR agrupando los tiempos entre latidos en 35 clases 
clases=35;
amplitudclases=estadistico.rango/clases;
extremosclases=[min(RR):amplitudclases:max(RR)];
[numeroit marcasclases]=hist(RR,clases);

% Grafica - histograma
% figure(3);
% hist(RR,clases); 
% h = findobj(gca,'Type','patch');set(h,'FaceColor','r','EdgeColor','w');
% title('Histograma RR');xlabel('clases');ylabel('Número de intervalos temporales RR');

% Determinación del índice triangular HRV 
[maxnit indmaxnit]=max(numeroit);
estadistico.itHRV=length(marcasclases)/maxnit;
% Determinación del índice TINN
xm=marcasclases(indmaxnit);
ym=maxnit;
Xi=marcasclases(1:indmaxnit-1);Yi=numeroit(1:indmaxnit-1);
A=(Xi-xm)';B=(Yi-ym)';
C=pinv(A);
p=C*B;
poli=[p -p*xm+ym];
vit=roots(poli);
Xd=marcasclases(indmaxnit+1:end);Yd=numeroit(indmaxnit+1:end);
A=(Xd-xm)';B=(Yd-ym)';
C=pinv(A);
p=C*B;
pold=[p -p*xm+ym];
vdt=roots(pold);
estadistico.iTINN=vdt-vit;

figure;
hist(RR,clases); h = findobj(gca,'Type','patch');set(h,'FaceColor','r','EdgeColor','w');
hold on;plot(marcasclases,numeroit,'o','MarkerFaceColor','blue');
hold on; plot((vit:0.001:xm),polyval(poli,(vit:0.001:xm)))
hold on; plot((xm:0.001:vdt),polyval(pold,(xm:0.001:vdt)))


end