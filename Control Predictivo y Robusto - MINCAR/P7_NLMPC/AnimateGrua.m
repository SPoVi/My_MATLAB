function AnimateGrua(FigRef,X, limx, limy, time );

k=1;
xmmin=limx(1);
xmmax=limx(2);

ymmin=limy(1);
ymmax=limy(2);


figure(FigRef)

%Dibujo el arco:

plot([xmmin xmmin xmmax xmmax],[-ymmax ymmin ymmin -ymmax], 'k','linewidth',4);

set(gca,'Color',[1 1 1])
hold on
%Dibujo el carro

carroh=0.25;
carrow=0.5;
 %[xm ym dtheta x l theta dx dl fx fl  | dfx dfl];
rectangle('Position',[X(4,k)-carrow/2 -carroh/2 carrow carroh],'FaceColor','g')

%Dibujo el cable

plot([X(4,k) X(1,k)],[0 -X(2,k)],'b','LineWidth',2);

%Dibujo el péndulo
radious=0.1;
rectangle('Position',[X(1,k)-radious/2 (-X(2,k)-radious/2)  radious radious],'FaceColor','r','Curvature',[1 1])
plot(X(1,k),-X(2,k),'kx')


%Axis
n=1.1;
xlim([xmmin*n n*xmmax]);
ylim([-n*ymmax n*ymmin]);
axis equal
set(gca,'PlotBoxAspectRatio',[1 1 1]);
grid on
text(xmmin*n+0.08,-n*ymmin+1.2,['current time: ' num2str(time(end)) 's'])%'FontSize',11);
text(xmmin*n+0.08,n*ymmin+0.8,[' x(t): ' num2str(X(1,k)) ' m ']);%,'FontSize',11);
text(xmmin*n+0.08,n*ymmin+0.4,[' y(t): ' num2str(X(2,k)) ' m ']);%,'FontSize',11);
hold off
drawnow    