function [U,DU,ek,Duopt,Reference,parameters]=ControlLaw_MPC_SS(parameters,trackdata,data);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Esta funci�n se ejecuta cada ciclo de control e implementa la ley de
% control del MPC
%
% Entrada:
%   -parameters: Estructura seg?n lo definido en la funci?n
%   [parameters, Ref,Td]=Initialization_SS_MIMO_DU;
%   -trackdata: Estrcutura con la referencia (No cambiar!)
%   -data: estructura compuesta por dos campos
%       data.previousiter : almacena los datos de la iteraci?n anterior
%           -data.previousiter.U : Valor de la acci?n anterior de control
%           -data.previousiter.X: Valor del estado anterior
%           -data.previousiter.Pcg: valor del CG (centro de gravedad) del estado anterior
%           -data.previousiter.k: Valor de la iteraci?n anterior (n?mero de
%           iteraci?n)
%           -data.previousiter.startidx (No cambiar!)
%       data.currentiter : almacena los datos de la iteraci?n actual
%           -data.currentiter.U : Valor actual de la acci?n de control
%           -data.currentiter.X: Valor actual del estado
%           -data.currentiter.Pcg: valor del CG del estado anterior
%           -data.currentiter.k: Valor de la iteraci?n actual (n?mero de
%           iteraci?n)
%          -data.currentiter.startidx (No cambiar!)
%
%   NOTA: Los valores de esta estructura se actualizan autom?ticamente,
%
% Salida:
%   -U: Acci�n de control en el instante actual
%   -DU:Variaci�n de control en el instante actual
%   -ek: Error instant�neo asociado al instante t, de igual dimensi�n que
%   las salidas consideradas.
%   -Duopt: Secuencia de control �ptima completa (Se usa para plotear)
%   -Reference: Estructura Reference que da la funci�n CreateReference. (Se
%   usa para plotear)
%   -Parameters: Se requiere para la animaci�n. En modelos lineales
%   constantes tiene el valor de la entrada. En modelos lineles LTV es
%   necesario actualizar sus campos en esta funci�n.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

   

%Recuerda que para generar la referencia en el SR local has de usar esta
%funci�n. La documentaci�n est� en el cuaderno de pr�cticas
[Reference, data]=CreateReference(trackdata,data, parameters);
w =[];
limitsup = 8;
for j = 1:parameters.h
    w = [w; Reference.y(j)];
    % Filtro de la velocidad de referencia
    if Reference.vxmax(j) > limitsup
        w = [w; limitsup];
    else
        w = [w; Reference.vxmax(j)];
    end
end

%Recuerda que para plotear es fundamental para plotear que en la estructura
%parameters est�n almacenadas correctamente.
% parameters.A
% parameters.B
% parameters.C
% parameters.h
% parameters.hu
% parameters.Gp
% parameters.F
% parameters.G

%En el caso de controladores LTV, que var�an de un instante a otro, se
%recomienda actualizarlos en esta funci�n (en vez de hacerlo en
%Initialization).

%Para el c�lculo del error instant�neo, que permite ver si el controlador
%funciona adecuadamente, se recomienda usar la forma
%
%ek= w(1:2)-C*X
%
%donde w(1:2) es la referencia de y (lateral) y vx( longitudinal), C es la
%matriz de SS lineal y X el valor del estado en el instante actual (cogido
%de data.currentiter).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Respuesta libre F*x(t)+Gp*u(t-1)
f = parameters.F*data.currentiter.X + parameters.Gp*data.previousiter.U;

[ny,nx] = size(parameters.C);
[nx,nu] = size(parameters.B);

% = Restricciones de la variacion de la entrada DU
Adu = [eye(parameters.hu*nu);
      -eye(parameters.hu*nu)];
bdu = [repmat(parameters.constraints.Dumax,parameters.hu,1);
    -repmat(parameters.constraints.Dumin,parameters.hu,1)];

% = Restricciones en la entrada u(t)
% Matriz tirangular inferior por bloques
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
     
% = Restricciones de la salida
j= 0;
ymax = zeros(parameters.h,1);
ymin = zeros(parameters.h,1);
for i = 1:parameters.h
    ymax(i+j,1) = Reference.y(i) + 2.*cos(Reference.yaw_rel(i));
    ymin(i+j,1) = Reference.y(i) - 2.*cos(Reference.yaw_rel(i));
    ymax(i+1+j,1) = Reference.vxmax(i);
    ymin(i+1+j,1) = 0;

    j = j+1;
end
parameters.constraints.Ymin = ymin;
parameters.constraints.Ymax = ymax;

Ay = [parameters.G;
    -parameters.G];

by = [parameters.constraints.Ymax-f
    -((parameters.constraints.Ymin-f))];
% by = [repmat(parameters.constraints.Ymax,1)-f;
%     -(repmat(parameters.constraints.Ymin,1)-f)];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% = Matrices de la ecuacion de coste
H = (parameters.G'*parameters.R*parameters.G + parameters.Q);
hf = (parameters.G'*parameters.R*(f-w));    % la traspones mas adelante  

% = Matrices de restricciones
SelectConstraints = 5;
switch SelectConstraints
    case 1 % du(t) - variacion de las entradas (control)
        Ac = Adu;
        bc = bdu;
    case 2 % u(t) - entradas (control)
        Ac = Au;
        bc = bu;
    case 3 % y(t) - salidas
        Ac = Ay;
        bc = by;
    case 4
        Ac = [Adu;Ay];
        bc = [bdu;by];
    case 5 % todas
        Ac = [Adu;Au;Ay];
        bc = [bdu;bu;by];
    otherwise
        Ac = [];
        bc = [];
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% = Optimiacion cuadr�tica con restricciones lineales
% if (exist('quadprog')==2)
%     % Optimization toolbox instalada
%     options = optimset('Display','off');
%     [Duopt,FVAL,exitflag] = quadprog(H,hf',Ac,bc,[],[],[],[],[],options);
%     if (exitflag < 0)
%     % Usar el quadprog open.source
%     [Duopt,FVAL,exitflag] = quadprog(H,hf',[],[]);
%     end
% end

options=optimset('Display','off');
[Duopt,FVAL,exitflag] = quadprog((H+H')/2,hf',Ac,bc,[],[],[],[],[],options);

% = Salidas
DU = Duopt(1:2,:); % Las dos primeras filas 
U = DU + data.previousiter.U;
ek = w(1:2)-parameters.C*data.currentiter.X;
        


