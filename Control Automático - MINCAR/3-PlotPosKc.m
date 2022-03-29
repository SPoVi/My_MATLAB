close all;
X=pos;
plot(X(:,1),X(:,2),'linewidth',1.6);
hold on;
grid on;
title('Respuesta posición')
xlabel('t [s]');
ylabel('Pos [rad]');
xlim([0 3]);
ylim([0 1])

plot(X(:,1),X(:,3), 'linewidth',1.6);
plot(X(:,1),X(:,4), 'linewidth',1.6);
plot(X(:,1),X(:,5), 'linewidth',1.6);
plot(X(:,1),X(:,6), 'linewidth',1.6);
legend('Entrada', 'Perturbación posición','Kc=20', 'Kc=40','Kc=80');

%%
close all;
X=pos;

plot(X(:,1),X(:,4), 'linewidth',1.6);
hold on;
grid on;
title('Respuesta posición')
xlabel('t [s]');
ylabel('Pos [rad]');
xlim([1.45 2.55]);
ylim([0.588 0.653])


plot(X(:,1),X(:,5), 'linewidth',1.6);
plot(X(:,1),X(:,6), 'linewidth',1.6);
legend('Kc=20', 'Kc=40','Kc=80');

%%
close all;
X=pos;
plot(X(:,1),X(:,2),'linewidth',1.6);
hold on;
grid on;
title('Respuesta posición')
xlabel('t [s]');
ylabel('Pos [rad]');
xlim([0 4.7]); %0 9
ylim([-0.1 1])

plot(X(:,1),X(:,3), 'linewidth',1.6);
plot(X(:,1),X(:,4), 'linewidth',1.6);
plot(X(:,1),X(:,5), 'linewidth',1.6);
plot(X(:,1),X(:,6), 'linewidth',1.6);
legend('Entrada', 'Perturbación posición','Kc=20', 'Kc=40','Kc=80');

%%

%close all;

X=fre;
plot(X(:,1),0.6+X(:,2),'--','linewidth',1.6);
hold on;
grid on;
title('Respuesta posición')
xlabel('t [s]');
ylabel('Pos [rad]');
xlim([1.55 3.15]); %2.9 6.1
ylim([0.545 0.655])
X=pos;
plot(X(:,1),X(:,4), 'linewidth',1.6);
plot(X(:,1),X(:,5), 'linewidth',1.6);
plot(X(:,1),X(:,6), 'linewidth',1.6);
legend('Referencia perturbación','Kc=20', 'Kc=40','Kc=80');

%%
close all;
Kc=1;
%bode((s*(s+1000)*(s+20))/(s*(s+1000)*(s+20)+5000*Kc))
Kc=20;
hold on;
bode((s*(s+1000)*(s+20))/(s*(s+1000)*(s+20)+5000*Kc))
Kc=40;
hold on;
bode((s*(s+1000)*(s+20))/(s*(s+1000)*(s+20)+5000*Kc))
Kc=1800;
hold on;
bode((s*(s+1000)*(s+20))/(s*(s+1000)*(s+20)+5000*Kc))

legend('Kc=1','Kc=20', 'Kc=40','Kc=80');