close all;
X=pos;
plot(X(:,1),X(:,2),'linewidth',1.6);
hold on;
grid on;
title('Respuesta posici�n')
xlabel('t [s]');
ylabel('Pos [rad]');
xlim([0 3]);
ylim([0 1.05])

plot(X(:,1),X(:,3), 'linewidth',1.6);
plot(X(:,1),X(:,4), 'linewidth',1.6);
plot(X(:,1),X(:,5), 'linewidth',1.6);
plot(X(:,1),X(:,6), 'linewidth',1.6);
legend('Entrada', 'Perturbaci�n par [Nm]','Kc=20', 'Kc=40','Kc=80');

%%
%close all;
X=pos;

plot(X(:,1),X(:,4), 'linewidth',1.6);
hold on;
grid on;
title('Respuesta posici�n')
xlabel('t [s]');
ylabel('Pos [rad]');
xlim([1.4 3]);
ylim([0.5995 0.6105])


plot(X(:,1),X(:,5), 'linewidth',1.6);
plot(X(:,1),X(:,6), 'linewidth',1.6);
legend('Kc=20', 'Kc=40','Kc=80');

%%
close all;
X=pos;
plot(X(:,1),X(:,2),'linewidth',1.6);
hold on;
grid on;
title('Respuesta posici�n')
xlabel('t [s]');
ylabel('Pos [rad]');
xlim([0 9]);
ylim([0 1.05])

plot(X(:,1),X(:,3), 'linewidth',1.6);
plot(X(:,1),X(:,4), 'linewidth',1.6);
plot(X(:,1),X(:,5), 'linewidth',1.6);
plot(X(:,1),X(:,6), 'linewidth',1.6);
legend('Entrada', 'Perturbaci�n par [Nm]','Kc=20', 'Kc=40','Kc=80');
%%
%close all;
X=pos;
plot(X(:,1),X(:,4), 'linewidth',1.6);
hold on;
grid on;
title('Respuesta posici�n')
xlabel('t [s]');
ylabel('Pos [rad]');
xlim([2.9 6.1]);
ylim([0.599 0.6105])


plot(X(:,1),X(:,5), 'linewidth',1.6);
plot(X(:,1),X(:,6), 'linewidth',1.6);
legend('Kc=20', 'Kc=40','Kc=80');

%%
close all;
X=pos;

plot(Y(:,1),Y(:,5), 'linewidth',1.6);
hold on;
grid on;
title('Respuesta posici�n')
xlabel('t [s]');
ylabel('Pos [rad]');
xlim([1.4 3]);
ylim([0.5995 0.6065])


%plot(X(:,1),X(:,5), 'linewidth',1.6);
legend('Kc=40 sin saturaci�n', 'Kc=40 con saturaci�n');
%%
close all;
X=pos;

plot(X(:,1),0.605+X(:,5)-X(:,5),'--', 'linewidth',1.6);
hold on;
grid on;
title('Respuesta posici�n')
xlabel('t [s]');
ylabel('Pos [rad]');
xlim([1.4 3]);
ylim([0.5995 0.6065])

plot(Z(:,1),Z(:,5), 'linewidth',1.6);
legend('Desviaci�n m�x', 'Kc=45 con saturaci�n');
%%
close all;

plot(Y(:,1), 0.63+Y(:,1)-Y(:,1),'--', 'linewidth',1.6);
hold on;
grid on;
title('Respuesta posici�n')
xlabel('t [s]');
ylabel('Pos [rad]');
xlim([0 1.5]);
ylim([0 0.7])

plot(Z(:,1),Z(:,5), 'linewidth',1.6);

legend('Sobreoscilaci�n 5%', 'Kc=45 con saturaci�n');
%plot(Y(:,1),Y(:,5), 'linewidth',1.6);
%plot(X(:,1),X(:,5), 'linewidth',1.6);
%legend('Sobreoscilaci�n 5%', 'Kc=40 sin saturaci�n', 'Kc=40 con saturaci�n');
%%
figure;
Y=ea2;
plot(Y(:,1), 12+Y(:,1)-Y(:,1),'--', 'linewidth',1.6);
hold on;
grid on;
title('Se�al de control')
xlabel('t [s]');
ylabel('ea [V]');
xlim([0 1]);
ylim([-3 25])


X=ea;
plot(Y(:,1),Y(:,2), 'linewidth',1.6);
plot(X(:,1),X(:,2), 'linewidth',1.6);
legend('Tensi�n m�x', 'Kc=40 sin saturaci�n', 'Kc=40 con saturaci�n');



