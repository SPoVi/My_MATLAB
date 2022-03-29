%% == Sistemas Biomedicos ==
% Autor: Raquel Martinez
% Mod: Sergio Pons
% Fecha: 30/11/2020

%% = Codigo =
% Lectura del archivo hrv_p1.txt y representaci�n gr�fica de la
% variabilidad del ritmo cardiaco considerando los intervalos temporales RR
% expresados en segundos
RR = RR_relax;
tRR = tLow_relax;

figure(1);plot(tRR,RR);title('variabilidad del ritmo cardiaco');
xlabel('tiempo en segundos(s)');ylabel('tiempo entre latidos RR en segundos(s)');

figure(2);subplot(3,1,1);plot(tRR,RR);
% axis([210,216,min(RR),max(RR)]);
title('variabilidad del ritmo cardiaco');
subplot(3,1,2);plot(tRR,RR,'o');
%axis([210,216, min(RR),max(RR)]);
subplot(3,1,3); plot(tRR,RR,tRR,RR,'o');
%axis([210,216, min(RR),max(RR)]);

%% = Estadisticos = 
% Determinaci�n de algunas medidas de posici�n y dispersi�n de la variable 
% estad�stica discreta asociada a RR
% Creacion de estructura: estadistico
estadistico.media=mean(RR);
estadistico.mediana=median(RR);
estadistico.moda=mode(RR);
estadistico.maximo=max(RR)
estadistico.minimo=min(RR)
estadistico.rango=estadistico.maximo-estadistico.minimo;
estadistico.desviacionmedia=mean(abs(RR-mean(RR)));
estadistico.desviacionestandar=std(RR,1);

% Determinaci�n de los �ndices rMSDD y pNN50 de la HVR
estadistico.DARR=abs(RR(2:length(RR))-RR(1:length(RR)-1));
estadistico.rMSDD=std(estadistico.DARR,1);
ind=find(estadistico.DARR>=0.05);
estadistico.pNN50=length(ind)/length(RR);

%% = Histograma =
% Representaci�n gr�fica del histograma de la variable estad�stica discreta
% asociada a RR agrupando los tiempos entre latidos en 35 clases 
clases=35;
amplitudclases=estadistico.rango/clases
extremosclases=[min(RR):amplitudclases:max(RR)]
[numeroit marcasclases]=hist(RR,clases)

% Grafica - histograma
% figure(3);
% hist(RR,clases); 
% h = findobj(gca,'Type','patch');set(h,'FaceColor','r','EdgeColor','w');
% title('Histograma RR');xlabel('clases');ylabel('N�mero de intervalos temporales RR');

% Determinaci�n del �ndice triangular HRV 
[maxnit indmaxnit]=max(numeroit)
estadistico.itHRV=length(marcasclases)/maxnit;
% Determinaci�n del �ndice TINN
xm=marcasclases(indmaxnit)
ym=maxnit
Xi=marcasclases(1:indmaxnit-1);Yi=numeroit(1:indmaxnit-1);
A=(Xi-xm)';B=(Yi-ym)';
C=pinv(A);
p=C*B
poli=[p -p*xm+ym]
vit=roots(poli)
Xd=marcasclases(indmaxnit+1:end);Yd=numeroit(indmaxnit+1:end);
A=(Xd-xm)';B=(Yd-ym)';
C=pinv(A);
p=C*B
pold=[p -p*xm+ym]
vdt=roots(pold)
estaidistico.iTINN=vdt-vit;
figure(4);hist(RR,clases); h = findobj(gca,'Type','patch');set(h,'FaceColor','r','EdgeColor','w');
hold on;plot(marcasclases,numeroit,'o','MarkerFaceColor','blue');
hold on; plot((vit:0.001:xm),polyval(poli,(vit:0.001:xm)))
hold on; plot((xm:0.001:vdt),polyval(pold,(xm:0.001:vdt)))

%% = Guardar = 
% save P4_estadistico_relax estadistico
