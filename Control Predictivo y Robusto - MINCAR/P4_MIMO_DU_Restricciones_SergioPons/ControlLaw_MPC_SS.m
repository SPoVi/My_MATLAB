function [U,DU]=ControlLaw_MPC_SS(parameters,w,data);
% Autor:
% Modificado por: Sergio Pons
% Fecha: 01/12/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Esta funci?n se ejecuta cada ciclo de control e implementa la ley de
% control del MPC
%
% Entrada:
%   -parameters: Estructura seg?n lo definido en la funci?n
%   [parameters, Ref,Td]=Initialization_MPC_SS;
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

f = parameters.F*data.currentiter.X + parameters.Gp*data.previousiter.U;


[ny,nx] = size(parameters.C);
[nx,nu] = size(parameters.B);
% = Restricciones de la variacioon de la entrada Delta u =
Adu = [eye(parameters.hu*nu);
    -eye(parameters.hu*nu)];
   
bdu = [repmat(parameters.constraints.Dumax,parameters.hu,1);
    -repmat(parameters.constraints.Dumin,parameters.hu,1)];

% = Restricciones de la entrada u(t) =
% Creamos matriz triangular inferior por bloques
I = eye(nu);
O = zeros(nu);
Aux = cell(parameters.hu);

for i = 1:parameters.hu
    for j = 1:parameters.hu
        if(j<=i)
            Aux{i,j} = I;
        else
            Aux{i,j} = O;
        end
    end
end

% Matrices de restriccion
Au = [cell2mat(Aux);
    -cell2mat(Aux)];

bu = [repmat(parameters.constraints.Umax-data.previousiter.U,parameters.hu,1);
    -repmat(parameters.constraints.Umin-data.previousiter.U,parameters.hu,1)];

% = Restricciones de la salida y(t) =
Ay = [parameters.G;
    -parameters.G];

by = [repmat(parameters.constraints.Ymax,parameters.h,1)-f;
    -(repmat(parameters.constraints.Ymin,parameters.h,1)-f)];

% = Restricciones de sobreimpulso =
Asy = parameters.G;
bsy = (w-f);

Asiy = -parameters.G;
bsiy = -(w-f);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Matrices de la ecuación de coste
H=(parameters.G'*parameters.R*parameters.G+parameters.Q);
hf=(parameters.G'*parameters.R*(f-w));

% Matrices de restricciones
% Ac = [];
% bc = [];
% Selección de restricciones

SelectConstraints = 3;


switch SelectConstraints
    case 1 % Delta u
        Ac=Adu;
        bc=bdu;  
    case 2 % u(t)
        Ac=Au;
        bc=bu;             
    case 3 % y(t)
        Ac=Ay;
        bc=by;
    case 4 % Sobreimpulso  positivo
        Ac=Asy;
        bc=bsy;
    case 5 % Sobreimpulso negativo
        Ac = Asiy;
        bc = bsiy;
    case 6 % Sobreimpulsos positivo y negativo
            Ac = Asy;
            bc = bsy;
        if data.previousiter.U(2) < -0.01 || data.previousiter.U(2) > 0.01
            Ac = Asiy;
            bc = bsiy;
        end
    case 7 % Para observar que NO SE PUEDEN poner ambas restricciones de Mp al mismo tiempo
        Ac=[Asy;Asiy];
        bc=[bsy;bsiy];  
    case 8  % Au , u(t) e y(t)
        Ac=[Adu;Au;Ay];
        bc=[bdu;bu;by];
    otherwise % Sin restricciones
        Ac=[];
        bc=[];               
end

% Optimización cuadrática con restricciones lineales
if(exist('quadprog')==2)
    %Optimization toolbox instalada
    options =  optimset('Display','off');
    [Duopt,FVAL,exitflag] = quadprog(H,hf',Ac,bc,[],[],[],[],[],options);
else
    %Usar el quadprog open.source
    [Duopt,FVAL,exitflag] = quadprog2(H,hf',Ac,bc);
end
% DU = parameters.K12*(w-f);
DU = Duopt(1:2,:); % Las dos primeras filas
U= DU + data.previousiter.U;