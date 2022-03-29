function [Reference, data]=CreateReference(trackdata,data,parameters)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Creates reference for the horizon based on the current vehicle CG
% location.
%  1- Estimates the nearest point of the CG location to the trajectory
%  considering the distance traveled
%  2-Calculates the reference for the h future setpoints considering a
%  constant speed vx.
%  NOTE: All reference variables are calculated
% 
% Inputs:
%   -trackdata: Track data as in trackdatafile.mat. 
%   -data: current and past state and input data.It updates
%   automatically last found index.
%   -parameters: horizon, discretization time, etc
%   -Xcg=[x;y]; current position and yaw vector in the global frame
%   -Yaw:Current yaw in the global frame
%   -x current position in the local frame (distance traveled)
%   -vx current velocity vector in the local frame (longitudinal speed)
%   -h, Td: horizon and discretization time
%
% Outputs:
%   -Reference.X global X reference for the horizon (constant vx
%   considered)
%   -Reference.Y global Y reference for the horizon (constant vx
%   considered)
%   -Reference.vx longitudinal speed reference for the horizon (constant 
%    vx considered)
%   -Reference.d longitudinal distance reference for the horizon (constant 
%    vx considered)
%   -Reference.s station indexes for the reference points.
%   -Reference.x local x reference for the horizon (constant vx considered)
%   -Reference.y local y reference for the horizon (constant vx considered)
%   -data structure with updated last found index
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

PosIni=data.previousiter.startidx;
Pcg=data.currentiter.Pcg;
Yaw=data.currentiter.X(3);
x=data.currentiter.X(1);
vx=data.currentiter.X(4);

h=parameters.h;
Td=parameters.Td;

%Estimate Pcg location in trackdata
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Last found index (position t-1)
i=PosIni;

% %Current local position is distance traveled: compare with path distance
% %from last found index
% 
% d_est= trackdata.d(i)+x; %Estimated total distance
% 
% %Search estimated distance in reference and save estimated index (position
% %t)
% 
% J=find(trackdata.d>=d_est);
% j=J(1);

j=length(trackdata.X);

%Define search region (from i==>j ==> j+(j-i) )
if(i==j)
    k=i;
else

    if(j+(j-i)<length(trackdata.X))
        P_search=trackdata.Pref(:,[i:j+(j-i)]);
    else
        P_search=trackdata.Pref(:,i:length(trackdata.X));
    end

%     %Transform to local frame to see if points are behind vehicle
    x_search=(P_search(2,:)-Pcg(2)).*sin(Yaw)+(P_search(1,:)-Pcg(1)).*cos(Yaw);

    %Only take positive inputs: 

    I=find(x_search>=0);
   
    k=I(1);
    % %Calculate point with minimum distance ==> Current index k
    
%     E=P_search-Pcg;
%     
%     [y,k]=min(sqrt(E(1,:).^2+E(2,:).^2));
end
Prefcurrent=trackdata.Pref(:,k+i-1); % Or P_search(:,k)
dcurrent=trackdata.d(k+i-1);

PosIniNext=k+i-1;

%Search for end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Calculate estimated travelled distance==> Suppose vx constant

if(vx==0)
   %Then reference V
   vx=5/3.6;
end

dend=dcurrent+vx*h*Td;

%Determine the distributed sequence of distances. Divide in h+1 sections
%and do not use the first (the current one)

dhorizon=linspace(dcurrent,dend,h+1); 
dhorizon=dhorizon(2:h+1);

%Search for distances and define reference vector:

I=zeros(1,h);
for i=1:length(dhorizon)
    J=find(trackdata.d>=dhorizon(i));
    if(isempty(J))
        I(i)=length(trackdata.X);
    else
     I(i)=J(1);
    end
end

Reference.X=trackdata.X(I);
Reference.Y=trackdata.Y(I);
Reference.vxmax=trackdata.V(I);
%Reference.s=trackdata.S(I);
Reference.d=trackdata.d(I);

%Local reference
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Reference.y=(Reference.Y-Pcg(2))*cos(Yaw)-(Reference.X-Pcg(1))*sin(Yaw);
Reference.x=(Reference.Y-Pcg(2))*sin(Yaw)+(Reference.X-Pcg(1))*cos(Yaw);

Reference.yaw_rel=zeros(1,h); %Relative yaw
for i=1:h-1
    Reference.yaw_rel(i+1)=atan2(Reference.y(i+1)-Reference.y(i),Reference.x(i+1)-Reference.y(i));
end

%Update last index

data.currentiter.startidx=PosIniNext;

% %Depuraci?n para ver el punto m?s cercano
% figure(2)
% plot(P_search(1,:),P_search(2,:))
% hold on
% plot(Pcg(1),Pcg(2),'o')
% plot(Prefcurrent(1),Prefcurrent(2),'b*');
% plot(Reference.X,Reference.Y,'.r');
% hold off


%    Rz=[cos(Yaw) -sin(Yaw); 
%        sin(Yaw) cos(Yaw)];
% E=[];
% for i=1:length(Reference.X)-1
%    E=[E sqrt((Reference.X(i+1)- Reference.X(i))^2+(Reference.Y(i+1)- Reference.Y(i))^2)];
% end

%plot(trackdata.Pref(1,:),trackdata.Pref(2,:),P_search(1,:),P_search(2,:))
% hold on
% plot(Pcg(1), Pcg(2),'o');
% plot(P_search(1,k), P_search(2,k),'*r');
% hold off