close all;
X=pos;
plot(X(:,1),X(:,2),'linewidth',1.6);
hold on;
grid on;
title('Respuesta posición')
xlabel('t [s]');
ylabel('Pos [rad]');
xlim([0 60]);
ylim([0 1.05])

plot(X(:,1),X(:,3), 'linewidth',1.6);
plot(X(:,1),X(:,4), 'linewidth',1.6);
legend('Entrada', 'Perturbación par [Nm]','Salida posición');

%%
%close all;
X=pos;
plot(X(:,1),X(:,4),'linewidth',1.6);
hold on;
grid on;
title('Respuesta posición')
xlabel('t [s]');
ylabel('Pos [rad]');
xlim([28 60]);
ylim([0.58 0.82])

%%
close all;
X=pos;
plot(X(:,1),X(:,2),'linewidth',1.6);
hold on;
grid on;
title('Respuesta posición')
xlabel('t [s]');
ylabel('Pos [rad]');
xlim([0 180]);
ylim([0 1.05])

plot(X(:,1),X(:,3), 'linewidth',1.6);
plot(X(:,1),X(:,4), 'linewidth',1.6);
%%
%close all;
X=pos;
plot(X(:,1),X(:,4),'linewidth',1.6);
hold on;
grid on;
title('Respuesta posición')
xlabel('t [s]');
ylabel('Pos [rad]');
xlim([58 122]);
ylim([0.58 0.82])

%%
close all;
X=pos;
plot(X(:,1),X(:,2),'linewidth',1.6);
hold on;
plot(X(:,1),X(:,4),'linewidth',1.6);

plot(Y(:,1),Y(:,4),'linewidth',1.6);
plot(Z(:,1),Z(:,4),'linewidth',1.6);
grid on;
title('Respuesta posición')
xlabel('t [s]');
ylabel('Pos [rad]');
xlim([0 180]);
ylim([0 1.05])
legend('Entrada','f=0.017 Hz', 'f=0.1 Hz','f=1 Hz');
