close all;
X=pos;
plot(X(:,1),X(:,2),'linewidth',1.6);
hold on;
grid on;
title('Respuesta posición')
xlabel('t [s]');
ylabel('Pos [rad]');
xlim([0 60]);
ylim([0 0.85])

plot(X(:,1),X(:,3), 'linewidth',1.6);
plot(X(:,1),X(:,4), 'linewidth',1.6);
legend('Entrada', 'Perturbación posición','Salida posición');

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
ylim([0.595 0.655])
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
ylim([-0.1 0.85])

plot(X(:,1),X(:,3), 'linewidth',1.6);
plot(X(:,1),X(:,4), 'linewidth',1.6);
legend('Entrada', 'Perturbación posición','Salida posición');

%%
%close all;
X=pos;
plot(X(:,1),0.6+X(:,3),'--','linewidth',1.6);
hold on;
grid on;
title('Respuesta posición')
xlabel('t [s]');
ylabel('Pos [rad]');
plot(X(:,1),X(:,4),'linewidth',1.6);
xlim([58 122]);
ylim([0.545 0.655])

legend('Referencia perturbación','Salida posición');

%%
close all;
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
legend('Entrada','w=0.01 rad/s', 'w=0.25 rad/s','w=10 rad/s');
%%
close all;
X=fre;
plot(X(:,1),0.6+X(:,2),'--','linewidth',1.6);
hold on;
grid on;
title('Respuesta posición')
xlabel('t [s]');
ylabel('Pos [rad]');
plot(X(:,1),X(:,3),'linewidth',1.6);
xlim([50 75.7]); %620 1270, 50 75.7, 40.83 41.475
ylim([0.545 0.655])

legend('Referencia perturbación','w=0.25 rad/s');

