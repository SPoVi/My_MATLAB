close all;
bode(Gpos)
title('Diagrama de Bode');
grid on;
xlabel('Frecuencia');
ylabel('Fase');
xlim([10^-2 10^5]);

%%
close all;
bode((5000)/(s*(s+1000)*(s+20)+5000))
title('Diagrama de Bode');
grid on;
xlabel('Frecuencia');
ylabel('Fase');
xlim([10^-2 10^5]);

subplot(2,1,1);
ylabel('Magnitud');
%%
close all;
Kc=1;
bode((5000*Kc)/(s*(s+1000)*(s+20)+5000*Kc))
Kc=20;
hold on;
bode((5000*Kc)/(s*(s+1000)*(s+20)+5000*Kc))
Kc=40;
hold on;
bode((5000*Kc)/(s*(s+1000)*(s+20)+5000*Kc))
Kc=80;
hold on;
bode((5000*Kc)/(s*(s+1000)*(s+20)+5000*Kc))

title('Diagrama de Bode');
grid on;
xlabel('Frecuencia');
ylabel('Fase');
xlim([10^-2 10^5]);
legend('Kc=1','Kc=20', 'Kc=40','Kc=80');
%%
close all;
Kc=1;
hold on;
bode((5000*Kc)/(s*(s+1000)*(s+20)+5000*Kc))
Kc=80;
bode((5000*Kc)/(s*(s+1000)*(s+20)+5000*Kc))
Kc=120;
bode((5000*Kc)/(s*(s+1000)*(s+20)+5000*Kc))
Kc=4000;
bode((5000*Kc)/(s*(s+1000)*(s+20)+5000*Kc))

title('Diagrama de Bode');
grid on;
xlabel('Frecuencia');
ylabel('Fase');
xlim([10^-2 10^5]);
legend('Kc=50', 'Kc=80', 'Kc=120', 'Kc=200');
%%
close all;
Kc=1;
margin((5000*Kc)/(s*(s+1000)*(s+20)+5000*Kc))

title('Diagrama de Bode');
grid on;
xlabel('Frecuencia');
ylabel('Fase');
xlim([10^-2 10^5]);
legend('Kc=50', 'Kc=80', 'Kc=120', 'Kc=200');
%%
close all;
Kc=200;
bandwidth((5000*Kc)/(s*(s+1000)*(s+20)+5000*Kc))
%%
close all;
Kc=2;
margin((5000*Kc)/(s*(s+1000)*(s+20)+5000*Kc))
%%
close all;
Kcdib=[0.1 1 10 20 40 80 120 200];
MGdib=[92.2 72.2 52.2 46.2 40.1 34 30.4 25.8];
MFdib=[180 180 180 180 164 86.6 66.5 48];

plot(Kcdib, MGdib, 'markersize',4);
grid on;




