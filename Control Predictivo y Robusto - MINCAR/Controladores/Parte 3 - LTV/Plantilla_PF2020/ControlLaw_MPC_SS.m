function [U,DU,ek,Duopt,Reference,parameters]=ControlLaw_MPC_SS(parameters,trackdata,data);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Esta función se ejecuta cada ciclo de control e implementa la ley de
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
%   -U: Acción de control en el instante actual
%   -DU:Variación de control en el instante actual
%   -ek: Error instantáneo asociado al instante t, de igual dimensión que
%   las salidas consideradas.
%   -Duopt: Secuencia de control óptima completa (Se usa para plotear)
%   -Reference: Estructura Reference que da la función CreateReference. (Se
%   usa para plotear)
%   -Parameters: Se requiere para la animación. En modelos lineales
%   constantes tiene el valor de la entrada. En modelos lineles LTV es
%   necesario actualizar sus campos en esta función.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

   

%Recuerda que para generar la referencia en el SR local has de usar esta
%función. La documentación está en el cuaderno de prácticas
[Reference, data]=CreateReference(trackdata,data, parameters);
w =[];
limitsup = 8;
limitinf = 0;
for j = 1:parameters.h
    w = [w; Reference.y(j)];
    % Filtro de la velocidad de referencia
    if Reference.vxmax(j) < limitinf
        w = [w; limitinf];
    elseif  Reference.vxmax(j) > limitsup
        w = [w; limitsup];
    else
        w = [w; Reference.vxmax(j)];
    end
end

%Recuerda que para plotear es fundamental para plotear que en la estructura
%parameters estén almacenadas correctamente.
% parameters.A
% parameters.B
% parameters.C
% parameters.h
% parameters.hu
% parameters.Gp
% parameters.F
% parameters.G

%En el caso de controladores LTV, que varían de un instante a otro, se
%recomienda actualizarlos en esta función (en vez de hacerlo en
%Initialization).

%Para el cálculo del error instantáneo, que permite ver si el controlador
%funciona adecuadamente, se recomienda usar la forma
%
%ek= w(1:2)-C*X
%
%donde w(1:2) es la referencia de y (lateral) y vx( longitudinal), C es la
%matriz de SS lineal y X el valor del estado en el instante actual (cogido
%de data.currentiter).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Inicializacion de variables
% = Parametros del modelo =
a = 0.9269;         % m
b = 0.7591;         % m
m = 611.5;          % kg
Rf = 0.265;         % m
Rr = 0.281;         % m
Iz = 430.166;       % kg m2
froll = 0.002;      %  
Cr = 42550.81/1.8;  % N/rad
Cf = 352.54/2;      % N/rad
g = 9.81;           % m/s2

% Lectura de valores actuales vx, vy:
vx = data.currentiter.X(4);
vy = data.currentiter.X(5);
% vx = 2;
% vy = 2;

% = Matrices en continua =
Ac = [0 0 0 1 0 0;
      0 0 0 0 1 0;
      0 0 0 0 0 1;
      0 0 0 -froll*g 0 vy;
      0 0 0 0 (-2*(Cf+Cr)/(m*vx)) 2*(Cr*b-Cf*a)/(m*vx)-vx;
      0 0 0 0 2*(Cr*b-Cf*a)/(Iz*vx) -2*(Cf*a^2+Cr*b^2)/(Iz*vx)];

Bc = [0 0;
     0 0;
     0 0;
     0 2/(Rr*m);
     2*Cf/m 0 ;
     2*Cf*a/Iz 0];
 
 % Controlas velocidad (dx), distancia al borde de carril (y)
 %Para dos salidas: y vx
 Cc = [0 1 0 0 0 0;
     0 0 0 1 0 0];

Dc = 0;

% = Modelo de espacio de destados = 
sc = ss(Ac,Bc,Cc,Dc);

% = Discretizacion =
Td=0.05;            % Periodo de discretizacion
sd = c2d(sc,Td);

% = Matrices del model discretizado
parameters.A = sd.a;
parameters.B = sd.b;
parameters.C = sd.c;

% = Calculo de matrices G, F y Gp =
[G,Gp,F]=CreateMPC_SSMIMO_hu_Du_Matrices(parameters.A,parameters.B,parameters.C,parameters.h,parameters.hu);

%Matrices de la ecuaci?n de predicci?n vectorial
parameters.F=F;
parameters.G=G;
parameters.Gp=Gp;

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
% Factor de mod de la velocidad
j= 0;
ymax = zeros(parameters.h,1);
ymin = zeros(parameters.h,1);
for i = 1:parameters.h
    ymax(i+j,1) = Reference.y(i) + 2.*cos(Reference.yaw_rel(i));
    ymin(i+j,1) = Reference.y(i) - 2.*cos(Reference.yaw_rel(i));
    ymax(i+1+j,1) = Reference.vxmax(i);
    ymin(i+1+j,1) = 3;

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
%= Optimiacion cuadrática con restricciones lineales
% if (exist('quadprog')==2)
%     % Optimization toolbox instalada
%     options = optimset('Display','off');
%     [Duopt,FVAL,exitflag] = quadprog(H,hf',Ac,bc,[],[],[],[],[],options);
% else
%     % Usar el quadprog open.source
%     [Duopt,FVAL,exitflag] = quadprog(H,hf',Ac,bc);
% end

options=optimset('Display','off');
[Duopt,FVAL,exitflag] = quadprog((H+H')/2,hf',Ac,bc,[],[],[],[],[],options);

% = Salidas
DU = Duopt(1:2,:); % Las dos primeras filas 
% Duopt = quadprog(H,hf',Ac,bc);
U = DU + data.previousiter.U;
ek = w(1:2)-parameters.C*data.currentiter.X;
        


