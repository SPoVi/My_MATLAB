%Plot
close all;

X=w;
plot(X(:,1),X(:,2),'linewidth',1.6);
hold on;
grid on;
title('Respuesta velocidad escalón unitario')
xlabel('t [s]');
ylabel('Amplitud');
xlim([0 1]); %1(w)    5(pos)
ylim([0 1.1]);

plot(X(:,1),X(:,3), 'linewidth',1.6);

legend('Entrada', 'Salida velocidad');

%%
%close all;
X=w;
plot(X(:,1),X(:,3), 'linewidth',1.6);
hold on;
grid on;
title('Respuesta velocidad escalón unitario')
xlabel('t [s]');
ylabel('Amplitud');
xlim([0 0.35]);
ylim([0 0.26]);  %0.26(w)    0.08(pos)

%%
close all;

X=pos;
plot(X(:,1),X(:,2),'linewidth',1.6);
hold on;
grid on;
title('Respuesta posición escalón unitario')
xlabel('t [s]');
ylabel('Amplitud');
xlim([0 5]); %1(w)    5(pos)
ylim([0 1.1]);

plot(X(:,1),X(:,3),'linewidth',1.6);

legend('Entrada', 'Salida posición');
%%
%close all;
X=pos;
plot(X(:,1),X(:,3), 'linewidth',1.6);
hold on;
grid on;
title('Respuesta posición escalón unitario')
xlabel('t [s]');
ylabel('Amplitud');
xlim([0 0.35]);
ylim([0 0.08]);  %0.26(w)    0.08(pos)