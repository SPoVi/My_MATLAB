close all;
X=pos;
plot(X(:,1),X(:,2),'linewidth',1.6);
hold on;
grid on;
title('Respuesta posición')
xlabel('t [s]');
ylabel('Pos [rad]');
xlim([0 4]);
ylim([0 1.05])

plot(X(:,1),X(:,3), 'linewidth',1.6);
plot(X(:,1),X(:,4), 'linewidth',1.6);

legend('Entrada', 'Perturbación par [Nm]','Salida posición');
%%
close all;
X=pos;
plot(X(:,1),X(:,4), 'linewidth',1.6);
hold on;
grid on;
title('Respuesta posición')
xlabel('t [s]');
ylabel('Pos [rad]');
xlim([1.95 4]);
ylim([0.5997 0.604])

%%
%close all;
X=pos;
%plot(X(:,1),X(:,2),'linewidth',1.6);
hold on;
grid on;
title('Respuesta posición')
xlabel('t [s]');
ylabel('Pos [rad]');
xlim([0 0.5]);
ylim([0 0.651])

plot(X(:,1),X(:,4), 'linewidth',1.6);
plot(X(:,1),X(:,2)*0.98,'--', 'linewidth',1.6);
plot(X(:,1),X(:,2)*1.02,'--', 'linewidth',1.6);
legend('Entrada', 'Indicador test(2%)','Salida posición');