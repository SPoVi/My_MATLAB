close all;
X=pos;
plot(X(:,1),X(:,2),'linewidth',1.6);
hold on;
grid on;
title('Respuesta posición')
xlabel('t [s]');
ylabel('Pos [rad]');
xlim([0 2]);
ylim([0 1.05])

plot(X(:,1),X(:,3), 'linewidth',1.6);
plot(X(:,1),X(:,4), 'linewidth',1.6);
plot(X(:,1),X(:,5), 'linewidth',1.6);
plot(X(:,1),X(:,6), 'linewidth',1.6);
%plot(X(:,1),X(:,2)*0.95,'--', 'linewidth',1.6);
legend('Entrada', 'Perturbación par [Nm]','Kc=80', 'Kc=100','Kc=120', 'sd');
%%
%close all;
X=pos;
plot(X(:,1),X(:,4), 'linewidth',1.6);
hold on;
grid on;
title('Respuesta posición')
xlabel('t [s]');
ylabel('Pos [rad]');
xlim([0.95 2]);
ylim([0.5997 0.6028])



plot(X(:,1),X(:,5), 'linewidth',1.6);
plot(X(:,1),X(:,6), 'linewidth',1.6);

legend('Kc=80', 'Kc=100','Kc=120');
%%
%close all;
%X=pos;
%plot(X(:,1),X(:,2),'linewidth',1.6);
hold on;
grid on;
title('Respuesta posición')
xlabel('t [s]');
ylabel('Pos [rad]');
xlim([0 0.5]);
ylim([0 0.651])

plot(X(:,1),X(:,4), 'linewidth',1.6);
plot(X(:,1),X(:,5), 'linewidth',1.6);
plot(X(:,1),X(:,6), 'linewidth',1.6);
plot(X(:,1),X(:,2)*0.98,'--', 'linewidth',1.6);
plot(X(:,1),X(:,2)*1.02,'--', 'linewidth',1.6);
legend('Entrada', 'Indicador test(2%)','Kc=80', 'Kc=100','Kc=120');

%%
close all;
Y=ea;
plot(Y(:,1), 12+Y(:,1)-Y(:,1),'--', 'linewidth',1.6);
hold on;
grid on;
title('Señal de control')
xlabel('t [s]');
ylabel('ea [V]');
xlim([0 0.8]);
ylim([-80 100])


X=ea;
plot(Y(:,1),Y(:,2), 'linewidth',1.6);
plot(Y(:,1),Y(:,3), 'linewidth',1.6);
legend('Tensión máx', 'Sin saturación', 'Con saturación');
%%
close all;
Y=pos;
plot(Y(:,1), Y(:,2)*0.98,'--', 'linewidth',1.6);
hold on;
grid on;
title('Respuesta de posición')
xlabel('t [s]');
ylabel('Pos [rad]');
xlim([0 0.8]);
ylim([0 0.75])


X=ea;
plot(Y(:,1),Y(:,4), 'linewidth',1.6);
plot(Y(:,1),Y(:,5), 'linewidth',1.6);
plot(Y(:,1), Y(:,2)*1.02,'--', 'linewidth',1.6);
legend('Referencia test(2%)', 'Sin saturación', 'Con saturación');