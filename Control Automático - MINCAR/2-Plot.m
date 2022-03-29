close all;

X=w;
plot(X(:,1),X(:,2),'linewidth',1.6);
hold on;
grid on;
title('Respuesta velocidad')
xlabel('t [s]');
ylabel('w [rad/s]');
xlim([0 30]); %1(w)    5(pos)
ylim([0 0.65]);

plot(X(:,1),X(:,3), 'linewidth',1.6);

legend('Entrada', 'Salida velocidad');

%%
close all;
X=pos;
plot(X(:,1),X(:,2),'linewidth',1.6);
hold on;
grid on;
title('Respuesta posición')
xlabel('t [s]');
ylabel('Pos [rad]');
xlim([0 30]);
ylim([0 0.65])

plot(X(:,1),X(:,3), 'linewidth',1.6);

legend('Entrada', 'Salida posición');
