close all;

X=w;
plot(X(:,1),X(:,3),'linewidth',1.6);
grid on;
title('Respuesta velocidad escalón unitario')
xlabel('t [s]');
ylabel('Amplitud');
xlim([0 0.35]);
ylim([0 0.26]);

hold on;
Y=wred;
plot(Y(:,1),Y(:,3), 'linewidth',1.6);
legend('Modelo origen', 'Modelo reducido');

%%
close all;
X=w;
Y=wred;
plot(X(:,1),-X(:,3)+Y(:,3), 'linewidth',1.6);
grid on;
title('Error modelo reducido')
xlabel('t [s]');
ylabel('Amplitud');
xlim([0 0.35]);
ylim([0 5*10^-3]);

%%
close all;
X=pos;
plot(X(:,1),X(:,3),'linewidth',1.6);
grid on;
title('Respuesta posición escalón unitario')
xlabel('t [s]');
ylabel('Amplitud');
xlim([0 0.35]);
ylim([0 0.08]);

hold on;
Y=posred;
plot(Y(:,1),Y(:,3),'linewidth',1.6);
legend('Modelo origen', 'Modelo reducido');

%%
close all;
X=pos;
Y=posred;
plot(X(:,1),-X(:,3)+Y(:,3),'linewidth',1.6);
grid on;
title('Error modelo reducido')
xlabel('t [s]');
ylabel('Amplitud');

xlim([0 0.35]);
ylim([0 2.6*10^-4]);