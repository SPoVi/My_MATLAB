%%
close all;
X=w;
plot(X(:,1),X(:,2),'LineWidth',1.6);
hold on;
grid on;
title('Respuesta velocidad')
xlabel('t [s]');
ylabel('w [rad/s]');
xlim([0 1]); %1(w)    5(pos)
ylim([-1.5 7]);

plot(X(:,1),X(:,3),'LineWidth',1.6);
plot(X(:,1),X(:,4),'LineWidth',1.6)
plot(X(:,1),X(:,5),'LineWidth',1.6)
plot(X(:,1),X(:,6),'LineWidth',1.6)

legend('Entrada', 'Kc=10', 'Kc=20', 'Kc=40', 'Kc=80');
%%
close all;

X=pos;
plot(X(:,1),X(:,2), 'LineWidth',1.6);
hold on;
grid on;
title('Respuesta posición')
xlabel('t [s]');
ylabel('Pos [rad]');
xlim([0 1]); %1(w)    5(pos)
ylim([0 0.75]);

plot(X(:,1),X(:,3), 'LineWidth',1.6);
plot(X(:,1),X(:,4), 'LineWidth',1.6)
plot(X(:,1),X(:,5), 'LineWidth',1.6)
plot(X(:,1),X(:,6), 'LineWidth',1.6)

legend('Entrada', 'Kc=10', 'Kc=20', 'Kc=40', 'Kc=80');



%%
close all;
X=e;
plot(X(:,1),X(:,2),'LineWidth',1.6);
hold on;
grid on;
title('Señal de error')
xlabel('t [s]');
ylabel('e [rad]');
xlim([0 1]); %1(w)    5(pos)
ylim([-0.15 0.7]);

plot(X(:,1),X(:,3),'LineWidth',1.6);
plot(X(:,1),X(:,4),'LineWidth',1.6);
plot(X(:,1),X(:,5),'LineWidth',1.6);
plot(X(:,1),X(:,6),'LineWidth',1.6);

legend('Kc=1','Kc=10', 'Kc=20', 'Kc=40', 'Kc=80');

%%
close all;
X=ea;
plot(X(:,1),X(:,2),'LineWidth',1.6);
hold on;
grid on;
title('Señal de control')
xlabel('t [s]');
ylabel('ea [V]');
xlim([0 1]); %1(w)    5(pos)
ylim([-10 50]);

plot(X(:,1),X(:,3),'LineWidth',1.6);
plot(X(:,1),X(:,4),'LineWidth',1.6)
plot(X(:,1),X(:,5),'LineWidth',1.6)
plot(X(:,1),X(:,6),'LineWidth',1.6)

legend('Kc=1','Kc=10', 'Kc=20', 'Kc=40', 'Kc=80');