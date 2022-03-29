% Daniel Campelo Olivera
%ROBUSTO

function [U,DU]=ControlLaw_MPC_SS(parameters,w,data);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Esta funci?n se ejecuta cada ciclo de control e implementa la ley de
% control del MPC
%
% Entrada:
%   -parameters: Estructura seg?n lo definido en la funci?n
%   [parameters, Ref,Td]=Initialization_SS_MIMO_DU;
%   -w: vector de referencia futura
%   -data: estructura compuesta por dos campos
%       data.previousiter : almacena los datos de la iteraci?n anterior
%           -data.previousiter.U : Valor de la acci?n anterior de control
%           -data.previousiter.X: Valor del estado anterior
%           -data.previousiter.V: Valor anterior de la perturbaci?n
%           conocida y medible (si existe)
%           -data.previousiter.Vm: Valor anterior de la perturbaci?n
%           medible (si existe)
%           -data.previousiter.k: Valor de la iteraci?n anterior (n?mero de
%           iteraci?n)
%       data.currentiter : almacena los datos de la iteraci?n actual
%           -data.currentiter.U : Valor actual de la acci?n de control
%           -data.currentiter.X: Valor actual del estado
%           -data.currentiter.V: Valor actual de la perturbaci?n medible y
%           conocida (si existe)
%           -data.currentiter.Vm: Valor actual de la perturbaci?n medible (si existe)
%           -data.currentiter.k: Valor de la iteraci?n actual (n?mero de
%           iteraci?n)
%           -data.currentiter.Vplus: Valor de la secuencia estimada de la
%           perturbaci?n conocida para el horizonte correspondiente al
%           instante actual (almacena desde t a t+h-1) (si existe)
%           -data.currentiter.Y: Valor actual de la salida del sistema
%
%   NOTA: Los valores de esta estructura se actualizan autom?ticamente,
%
% Salida:
%   -U: Acci?n de control en el instante actual
%   -DU:Variaci?n de control en el instante actual
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



Xnom_polytope = parameters.robust.Xnom_polytope;
Unom_polytope = parameters.robust.Unom_polytope;
PhiK_polytope = parameters.robust.PhiK_polytope;
K = parameters.robust.K;
Gx = parameters.Gx;
Fx = parameters.Fx;
R = parameters.R;
Q = parameters.Q;
B = parameters.B;
hu = parameters.hu;
h = parameters.h;

[nx,nu]=size(B);

%Ponderación de v en J
Qv=[zeros(nx,nx) zeros(nx,hu*nu);
zeros(hu*nu,nx) Q];
%Matriz de predicción vectorial en términos de v
Gv=[Fx Gx];
%Restricciones adaptadas a v
[Ac,bc]=CreateConstraints4robustMPC(data.currentiter.X, Xnom_polytope, Unom_polytope,PhiK_polytope,B,h,hu,Gv);


H=(Gv'*R*Gv+Qv);
hf=-Gv'*R*w;
    %Optimización cuadrática con restricciones lineales
    options =  optimset('Display','off');
    [Vopt,FVAL,exitflag] = quadprog((H+H')/2,hf',Ac,bc,[],[],[],[],[],options);
    if(exitflag<0)
        disp('No ha convergido. Problema no factible');
        return;
    end

    
    Xnom(:,1)=Vopt(1:nx);
    Unom(:,1)=Vopt(nx+1:nx+nu);
    
    U=Unom(:,1)+K*(data.currentiter.X(:,1)-Xnom(:,1)); 
    
    DU=0; %Este controlador se define en términos de U
    