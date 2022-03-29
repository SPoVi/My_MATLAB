function [sys,x0,str,ts] = sfun_MPC_AD(t,x,u,flag,PlotCheck,Xlim)
%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%
%       sfunction wrapper for MPC for Automated vehicle
%
%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%
%                               Inputs/Outputs
%**************************************************************************
%
%**************************************************************************
%Autor: Asier Zubizarreta
%Revisiones:
% v1.0: 25/10/2015
% v2.0: 25/1/2018
% v3.0: 25/12/2020
%Notas:
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Static Memory

persistent k;
persistent data;
persistent parameters;
persistent trackdata;

switch flag,
  %%%%%%%%%%%%%%%%%%
  % Initialization %
  %%%%%%%%%%%%%%%%%%
  % Initialize the states, sample times, and state ordering strings.
  case 0
    [parameters, trackdata,Td]=Initialization_MPC_SS;
    parameters.Td=Td;
    [sys,x0,str,ts,data]=mdlInitializeSizes(parameters,Td);

  %%%%%%%%%%%
  % Outputs %
  %%%%%%%%%%%
  % Return the outputs of the S-function block.
  case 3
    [sys,data]=mdlOutputs(t,x,u,data,parameters, trackdata,PlotCheck,Xlim);

  %%%%%%%%%%%%%%%%%%%
  % Unhandled flags %
  %%%%%%%%%%%%%%%%%%%
  % There are no termination tasks (flag=9) to be handled.
  % Also, there are no continuous or discrete states,
  % so flags 1,2, and 4 are not used, so return an emptyu
  % matrix 
  case { 1, 2, 4, 9 }
    sys=[];

  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  % Unexpected flags (error handling)%
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  % Return an error message for unhandled flag values.
  otherwise
    error(['Unhandled flag = ',num2str(flag)]);

end

% end timestwo

%
%=============================================================================
% mdlInitializeSizes
% Return the sizes, initial conditions, and sample times for the S-function.
%=============================================================================
%
function [sys,x0,str,ts,data]=mdlInitializeSizes(parameters,Td);

%Initialize static memory buffer
nx=6; %6 Estados-fixed
nu=2; %2 acciones de control-fixed
ny=2;  %2 salidas -fixed

Uant=zeros(nu,1);
Xant=zeros(nx,1);


data.previousiter.U=Uant;
data.previousiter.X=Xant;
data.previousiter.k=-1;

%AV Specific
data.previousiter.Pcg=[0;0];
data.previousiter.startidx=1;


data.currentiter.X=Xant;
data.currentiter.U=Uant;
data.currentiter.k=0;

%AV Specific
data.currentiter.Pcg=[0;0];
data.currentiter.startidx=1;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

sizes = simsizes;
sizes.NumContStates  = 0;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 2*nu+ny+1;  
sizes.NumInputs      = nx+2; %El estado + la ubicaci?n GPS  
sizes.DirFeedthrough = 1;   % has direct feedthrough
sizes.NumSampleTimes = 1;

sys = simsizes(sizes);
str = [];
x0  = [];
ts  = [Td 0];         % discrete Simulation


% end mdlInitializeSizes

%
%=============================================================================
% mdlOutputs
% Return the output vector for the S-function
%=============================================================================
%
function [sys,data]=mdlOutputs(t,x,u,data,parameters, trackdata,PlotCheck,Xlim);


%Sizes extract
nx=6; %Fixed

h=parameters.h;

%Increase time step and shift data to previous iteration

data.previousiter.k=data.currentiter.k;
data.previousiter.U=data.currentiter.U;
data.previousiter.X=data.currentiter.X;
%AV

data.previousiter.Pcg=data.currentiter.Pcg;
data.previousiter.startidx=data.currentiter.startidx;

data.currentiter.k=data.currentiter.k+1;
k=data.currentiter.k;

%Get system state and measurable disturbance from u (if exist)

data.currentiter.X=u(1:nx); %Current state X(k)
data.currentiter.X(1)=0;
data.currentiter.X(2)=0;

%AV
data.currentiter.Pcg=u(nx+1:nx+2);



try
%Llamada a ley de control    
[U,DU,ek,Duopt,Reference,parameters]=ControlLaw_MPC_SS(parameters,trackdata,data);

if(PlotCheck==1)
    %ploteo la figura si est? activo
    Pcg=data.currentiter.Pcg;
    Yaw=data.currentiter.X(3);
    plotXYFigure(1,Pcg,Yaw,trackdata,Reference,parameters,Duopt,data,Xlim);
end

catch
   disp('Error en función de control o fin de la trayectoria. Comprueba ControlLaw_MPC_SS');   
end

%Save calculated output 
data.currentiter.U=U;

sys = [U;DU;ek;k];


% end mdlOutputs

