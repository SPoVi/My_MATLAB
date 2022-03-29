close all;
X=pos1;
plot(X(:,1),X(:,2),'linewidth',1.6);
hold on;
plot(X(:,1),X(:,3),'linewidth',1.6);
%plot(X(:,1),X(:,2)-X(:,2),'--','linewidth',1.2);
%plot(X(:,1),1+X(:,3)-X(:,3),'--','linewidth',1.2);
grid on;
title('Respuesta posición')
xlabel('t [s]');
ylabel('Pos [rad]');
xlim([0 50]);
ylim([-1.2 1.2]) %2.2
legend('Entrada','w=0.25 rad/s');

%%
close all;
X=pos;
plot(X(:,1),X(:,2),'linewidth',1.6);
hold on;
plot(X(:,1),X(:,3),'linewidth',1.6);
%plot(X(:,1),X(:,2)-X(:,2),'--','linewidth',1.2);
%plot(X(:,1),2.5+X(:,3)-X(:,3),'--','linewidth',1.2);
grid on;
title('Respuesta posición')
xlabel('t [s]');
ylabel('Pos [rad]');
xlim([0 125.5]); 
ylim([-1.2 1.2]) %5.2
legend('Entrada','w=0.1 rad/s');

%%
close all;
X=pos2;
plot(X(:,1),X(:,2),'linewidth',1.6);
hold on;
plot(X(:,1),X(:,3),'linewidth',1.6);
%plot(X(:,1),X(:,2)-X(:,2),'--','linewidth',1.2);
%plot(X(:,1),0.25+X(:,3)-X(:,3),'--','linewidth',1.2);
grid on;
title('Respuesta posición')
xlabel('t [s]');
ylabel('Pos [rad]');
xlim([0 12.55]); %50 150
ylim([-1.2 1.2]) %1.2
legend('Entrada','w=1 rad/s');
%%
X=pos;
close all;
plot(X(:,1),X(:,2),'linewidth',1.6);
hold on;
grid on;
title('Respuesta posición')
xlabel('t [s]');
ylabel('Pos [rad]');
xlim([0 1.255]); %2.9 6.1
ylim([-1.2 1.2])
plot(X(:,1),X(:,3), 'linewidth',1.6);
plot(X(:,1),X(:,4), 'linewidth',1.6);
plot(X(:,1),X(:,5), 'linewidth',1.6);
legend('Entrada','Kc=20', 'Kc=40','Kc=80');