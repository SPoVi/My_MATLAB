function [sys,x0,str,ts] = sfun_MPC_SS(t,x,u,flag)
%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%
%       sfunction wrapper for generic MIMO  MPC calculation w/o
%       disturbances
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
% v2.0: 1/1/2018
%
%Notas:
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Static Memory

persistent k;
persistent data;
persistent parameters;
persistent Ref;

switch flag,
  %%%%%%%%%%%%%%%%%%
  % Initialization %
  %%%%%%%%%%%%%%%%%%
  % Initialize the states, sample times, and state ordering strings.
  case 0
    [parameters, Ref,Td]=Initialization_MPC_SS;
    [sys,x0,str,ts,data]=mdlInitializeSizes(parameters,Td);

  %%%%%%%%%%%
  % Outputs %
  %%%%%%%%%%%
  % Return the outputs of the S-function block.
  case 3
    [sys,data]=mdlOutputs(t,x,u,data,parameters, Ref);

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
[nx,nu]=size(parameters.B);
[ny,nx]=size(parameters.C);
if(isfield(parameters,'Dm'))
    nvm=size(parameters.Dm,2);
else
    nvm=0;
end
if(isfield(parameters,'D'))
    nv=size(parameters.D,2);
else
    nv=0;
end

Uant=zeros(nu,1);
Xant=zeros(nx,1);
Vant=zeros(nv,1);
Vmant=zeros(nvm,1);

data.previousiter.U=Uant;
data.previousiter.X=Xant;
data.previousiter.V=Vant;
data.previousiter.Vm=Vmant;
data.previousiter.k=-1;
data.currentiter.X=Xant;
data.currentiter.U=Uant;
data.currentiter.V=Vant;
data.currentiter.Vm=Vmant;
data.currentiter.k=0;
data.currentiter.Vplus=[];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

sizes = simsizes;
sizes.NumContStates  = 0;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 2*nu+ny+1;  
sizes.NumInputs      = nv+nx+nvm;  
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
function [sys,data]=mdlOutputs(t,x,u,data,parameters, Ref);


%Sizes extract
nx=size(parameters.C,2);

if(isfield(parameters,'Dm')) %Check if disturbances (measurable) exist
    nvm=size(parameters.Dm,2);
else
    nvm=0;
end
if(isfield(parameters,'D')) %Check if disturbances (predictable) exist
    nv=size(parameters.D,2);
else
    nv=0;
end


h=parameters.h;

%Increase time step and shift data to previous iteration

data.previousiter.k=data.currentiter.k;
data.previousiter.U=data.currentiter.U;
data.previousiter.X=data.currentiter.X;
data.previousiter.V=data.currentiter.V;
data.previousiter.Vm=data.currentiter.Vm;

data.currentiter.k=data.currentiter.k+1;
k=data.currentiter.k;

%Get system state and measurable disturbance from u (if exist)

data.currentiter.X=u(1:nx); %Current state X(k)
data.currentiter.Vm=u(nx+1:nx+nvm); %Current disturbance (measurable)
data.currentiter.V=u(nx+1+nvm:nx+nvm+nv); %Current disturbance value (measurable and predictable)


%Get future reference
w=[];
for j=k+1:k+h
    if(j<=size(Ref,2))
        w=[w ;Ref(:,j)];
    else
        w=[w ;Ref(:,end)];
    end
end

%Current reference
if(k>length(Ref))
    wk=Ref(:,end);
else
    wk=Ref(:,k);
end

%Estimated disturbance in horizon if disturbances exist
if(nv>0 && isfield(parameters,'V'))
    V=parameters.V;
    N=size(V,2);
    Vplus=[];
    for j=k:k+h-1
        if(j<=N)
            Vplus=[Vplus ;V(:,j)];
        else
            Vplus=[Vplus ;V(:,end)]; %Final value is maintained if simulation is longer than number of points
        end
    end

    data.currentiter.Vplus=Vplus;
end

%Llamada a ley de control

[U,DU]=ControlLaw_MPC_SS(parameters,w,data);

%Save calculated output 
data.currentiter.U=U;

sys = [U;DU;wk;k];


% end mdlOutputs

