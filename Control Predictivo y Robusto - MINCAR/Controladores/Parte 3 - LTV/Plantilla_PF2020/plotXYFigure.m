function plotXYFigure(hfig,Xcg,Yaw,trackdata,Reference,parameters,Duopt,data,Xlim);

persistent h; %handles structure
persistent Gx;
persistent Gpx;
persistent Fx;

a=2; %vehicle width
b=3.5; %Vehicle length

Xlim=Xlim; %Width of window
Ylim=Xlim; %Heigh of window

%Detect if figure has not been created first
if(data.currentiter.k==1)
    if(ishandle(hfig))
        close(hfig);
    end
    figure(hfig)
    
    h=[];
    %If not, then plot track
    h.axes=axes;
    h.ref=plot(trackdata.X(1,:), trackdata.Y(1,:),'g--');   
    hold on
    h.lim1=plot(trackdata.X(1,:), trackdata.Ylim1(1,:),'k');  
    h.lim2=plot(trackdata.X(1,:), trackdata.Ylim2(1,:),'k'); 
    %Create empty containers
    
    C=zeros(2,4);
    h.vehicle=fill(h.axes,C(1,:),C(2,:),'b');
    
    h.cg=plot(NaN,NaN,'or');
    
    h.w=plot(NaN,NaN,'r.','linewidth',2);
    h.xcgest=plot(NaN,NaN,'b.','linewidth',2);
    
    axis square;
   hold off
   
   %Create matrices
   
   [Gx,Gpx,Fx]=CreateMPC_SSMIMO_hu_Du_MatricesEstado(parameters.A,...
       parameters.B,parameters.C,parameters.h,parameters.hu);
   
end

if(not(isempty(Xcg)))
   %If it is not empty, then plot vehicle 
   
   %RePlot vehicle CG
   
   h.cg.YData=Xcg(2);
   h.cg.XData=Xcg(1);
   
   %ReCalculate vehicle corners
   Rz=[cos(Yaw) -sin(Yaw); 
       sin(Yaw) cos(Yaw)];
   C=zeros(2,4);
   C(:,1)=Xcg(1:2)+Rz*[b/2; a/2];
   C(:,2)=Xcg(1:2)+Rz*[-b/2; a/2];
   C(:,3)=Xcg(1:2)+Rz*[-b/2; -a/2];
   C(:,4)=Xcg(1:2)+Rz*[b/2; -a/2];
   h.vehicle.Vertices=C';

   %Referencia calculada
   
   h.w.YData=Reference.Y;
   h.w.XData=Reference.X;
   
   %Update and show prediction of output
   
   Gp=parameters.Gp;
   F=parameters.F;
   G=parameters.G;
   
   f=Fx*data.currentiter.X+Gpx*data.previousiter.U;
   xest=Gx*Duopt+f;
   
   %Create vector:
   X=[];
   for i=1:6:length(xest)
       X=[X xest(i:i+6-1)];
   end

   Xcg_est=Xcg+Rz*[X(1:2,:)-X(1:2,1)]; %Origen en 0,0

   h.xcgest.XData=Xcg_est(1,:);
   h.xcgest.YData=Xcg_est(2,:);   
   %Update viewpoint:
   
  axis(h.axes,[Xcg(1)-Xlim/2 Xcg(1)+Xlim/2 Xcg(2)-Ylim/2 Xcg(2)+Ylim/2]);
axis square
end

drawnow; %UPdate plots command!
