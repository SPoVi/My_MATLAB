function [poincare] = fHRV_Poincare(RR)
% Autor: Sergio Pons
% Fecha: 08/12/2020
%% = Codigo =
% Lectura del archivo hrv_p1.txt en segundos y representación del mapa de Poincaré
% RR = RR_relax;

x=RR(1:length(RR)-1); y=RR(2:length(RR));

figure;
plot(x,y,'o','MarkerEdgeColor','k','MarkerFaceColor','k'); 
title('mapa de Poincaré');xlabel('RR(i) (s)');ylabel('RR(i+1) (s)');
% Determinación del punto central o centroide (xc,yc) del mapa de Poincaré y 
% representación conjunta de la nube de puntos, el centroide y las rectas
% r1  y  r2
xc=mean(x);
yc=mean(y);
xd=[min(x):0.001:max(x)];
yr1=yc+xd-xc;
yr2=yc-(xd-xc);

figure;
plot(x,y,'o','MarkerEdgeColor','k','MarkerFaceColor','k'); title('mapa de Poincaré')
xlabel('RR(i) (s)');ylabel('RR(i+1) (s)');xlabel('RR(i) (s)');ylabel('RR(i+1) (s)');
hold on;plot(xc,yc,'o','MarkerEdgeColor','r','MarkerFaceColor','r');
hold on;plot(xd,yr1,'r');plot(xd,yr2,'r');axis equal;
axis([0.9*min(RR) 1.1*max(RR) 0.9*min(RR) 1.1*max(RR)])	
% Cálculo de los descriptores SD1c y SD2c
poincare.SD1C=sqrt(1/(2*length(x))*sum((x-xc-(y-yc)).^2));
poincare.SD2C=sqrt(1/(2*length(x))*sum((x-xc+(y-yc)).^2));
% Representación gráfica de la elipse de centro (xc,yc) y semiejes SD2c y SD1c
% respecto del sistema de referencia de origen (xc,yc) y ejes las rectas r1
% y r2
t=0:0.01:2*pi;
xe=xc+sqrt(2)/2*poincare.SD2C*cos(t)-sqrt(2)/2*poincare.SD1C*sin(t);
ye=yc+sqrt(2)/2*poincare.SD2C*cos(t)+sqrt(2)/2*poincare.SD1C*sin(t);

figure;
plot(x,y,'o','MarkerEdgeColor','k','MarkerFaceColor','k');
hold on;plot(xe,ye,'red','LineWidth',3);
hold on;plot(xc,yc,'o','MarkerEdgeColor','r','MarkerFaceColor','r');
hold on;plot(xd,yr1,'r');plot(xd,yr2,'r');axis equal;
axis([0.9*min(RR) 1.1*max(RR) 0.9*min(RR) 1.1*max(RR)])	
% Representación gráfica de los puntos de la nube que están por encima y 
% por debajo de la bisectriz rb (línea de identidad) y cálculo de los descriptores 
% SD1b, SD1e, SD1d, Ce y Cd
indpe=find(x<y);
ne=length(indpe);
xpe=x(indpe);ype=y(indpe);

figure;
plot(xpe,ype,'o','MarkerEdgeColor','k','MarkerFaceColor','k');
axis([0.9*min(RR) 1.1*max(RR) 0.9*min(RR) 1.1*max(RR)])
indpd=find(x>y);
nd=length(indpd);
xpd=x(indpd);ypd=y(indpd);

figure;
plot(xpd,ypd,'o','MarkerEdgeColor','k','MarkerFaceColor','k');
axis([0.9*min(RR) 1.1*max(RR) 0.9*min(RR) 1.1*max(RR)])

% Cálculo de los descriptores SD1b, SD1e, SD1d, Ce y Cd
poincare.SD1b=sqrt(1/(2*length(x))*sum((x-y).^2));
poincare.SD1e=sqrt(1/(2*length(x))*sum((x(indpe)-y(indpe)).^2));
poincare.SD1d=sqrt(1/(2*length(x))*sum((x(indpd)-y(indpd)).^2));
poincare.Ce=(poincare.SD1e)^2/(poincare.SD1b)^2;
poincare.Cd=(poincare.SD1d)^2/(poincare.SD1b)^2;

end