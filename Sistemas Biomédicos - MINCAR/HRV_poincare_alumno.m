%% == Sistemas Biomedicos ==
% Autor: Raquel Martinez
% MOd: Sergio Pons
% Fecha: 30/11/2020

%% = Codigo =
% Lectura del archivo hrv_p1.txt en segundos y representaci�n del mapa de Poincar�
RR = RR_relax;

x=RR(1:length(RR)-1); y=RR(2:length(RR));
figure(1);plot(x,y,'o','MarkerEdgeColor','k','MarkerFaceColor','k'); 
title('mapa de Poincar�');xlabel('RR(i) (s)');ylabel('RR(i+1) (s)');
% Determinaci�n del punto central o centroide (xc,yc) del mapa de Poincar� y 
% representaci�n conjunta de la nube de puntos, el centroide y las rectas
% r1  y  r2
xc=mean(x);
yc=mean(y);
xd=[min(x):0.001:max(x)];
yr1=yc+xd-xc;
yr2=yc-(xd-xc);
figure(2);plot(x,y,'o','MarkerEdgeColor','k','MarkerFaceColor','k'); title('mapa de Poincar�')
xlabel('RR(i) (s)');ylabel('RR(i+1) (s)');xlabel('RR(i) (s)');ylabel('RR(i+1) (s)');
hold on;plot(xc,yc,'o','MarkerEdgeColor','r','MarkerFaceColor','r');
hold on;plot(xd,yr1,'r');plot(xd,yr2,'r');axis equal;
axis([0.9*min(RR) 1.1*max(RR) 0.9*min(RR) 1.1*max(RR)])	
% C�lculo de los descriptores SD1c y SD2c
poincare.SD1C=sqrt(1/(2*length(x))*sum((x-xc-(y-yc)).^2));
poincare.SD2C=sqrt(1/(2*length(x))*sum((x-xc+(y-yc)).^2));
% Representaci�n gr�fica de la elipse de centro (xc,yc) y semiejes SD2c y SD1c
% respecto del sistema de referencia de origen (xc,yc) y ejes las rectas r1
% y r2
t=0:0.01:2*pi;
xe=xc+sqrt(2)/2*poincare.SD2C*cos(t)-sqrt(2)/2*poincare.SD1C*sin(t);
ye=yc+sqrt(2)/2*poincare.SD2C*cos(t)+sqrt(2)/2*poincare.SD1C*sin(t);
figure(3);plot(x,y,'o','MarkerEdgeColor','k','MarkerFaceColor','k');
hold on;plot(xe,ye,'red','LineWidth',3);
hold on;plot(xc,yc,'o','MarkerEdgeColor','r','MarkerFaceColor','r');
hold on;plot(xd,yr1,'r');plot(xd,yr2,'r');axis equal;
axis([0.9*min(RR) 1.1*max(RR) 0.9*min(RR) 1.1*max(RR)])	
% Representaci�n gr�fica de los puntos de la nube que est�n por encima y 
% por debajo de la bisectriz rb (l�nea de identidad) y c�lculo de los descriptores 
% SD1b, SD1e, SD1d, Ce y Cd
indpe=find(x<y);
ne=length(indpe);
xpe=x(indpe);ype=y(indpe);
figure(4);plot(xpe,ype,'o','MarkerEdgeColor','k','MarkerFaceColor','k');
axis([0.9*min(RR) 1.1*max(RR) 0.9*min(RR) 1.1*max(RR)])
indpd=find(x>y);
nd=length(indpd);
xpd=x(indpd);ypd=y(indpd);
figure(5);plot(xpd,ypd,'o','MarkerEdgeColor','k','MarkerFaceColor','k');
axis([0.9*min(RR) 1.1*max(RR) 0.9*min(RR) 1.1*max(RR)])
% C�lculo de los descriptores SD1b, SD1e, SD1d, Ce y Cd
poincare.SD1b=sqrt(1/(2*length(x))*sum((x-y).^2));
poincare.SD1e=sqrt(1/(2*length(x))*sum((x(indpe)-y(indpe)).^2));
poincare.SD1d=sqrt(1/(2*length(x))*sum((x(indpd)-y(indpd)).^2));
poincare.Ce=(poincare.SD1e)^2/(poincare.SD1b)^2;
poincare.Cd=(poincare.SD1d)^2/(poincare.SD1b)^2;

%% == Guardar ==
% save P4_poincare_relax poincare






