% Daniel Campelo Olivera
%ROBUSTO

function [parameters, Ref,Td]=Initialization_MPC_SS;
close all; clear; clc;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Esta funcion se ejecuta antes de la simulacion del bloque MPC SS Control
% SISO u(k) y permite calcular los parametros del MPC que pueden ser
% calculados offline. Estos par?metros se almacenanan en parameters.
%
% Ref almacena la referencia offline calculada para la simulaci?n. Ten en
% cuenta que si la simulaci?n es mayor que el n?mero de datos en Ref, se
% tomar? el ?ltimo valor como constante.
%
% Td es el periodo de discretizaci?n, que se usar? para definir cada cuanto
% se ejecuta el controlador
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

parameters=[];
Ref=[];
Td=[];


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Añade el Path de las toolbox que se requieren
if(ismac)
    addpath([cd '/invsetbox_v0105']);
else
    addpath([cd '\invsetbox_v0105']);
end

%% Periodo de Discretizaci?n
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Td=0.1;

%% Matrices del modelo discretizado
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

m=1000;
Br=1000;
Ka=50000;

    
%Sistema continuo

Ac=[-Br/m 0; 1 0];
Bc=[Ka/m;0];
Cc=eye(2);

%Dscretizaci?n

sc=ss(Ac,Bc,Cc,0);

%% Sistema discretizado:

sd=c2d(sc,Td);
A=sd.a;
B=sd.b;
C=sd.c;

parameters.A=A;
parameters.B=B;
parameters.C=C;



%% Cálculo de los par?metros y matrices del controlador
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Horizonte de predicci?n
h = 50;
hu = 50;
parameters.h= h;
parameters.hu= hu;

%Matrices de ponderaci?n
qk = 1;
rk = [0 0; 0 10];

Q=cell(hu);
for i=1:hu
for j=1:hu
if(i==j)
Q{i,j}=qk;
else
Q{i,j}=zeros(size(qk));
end
end
end
Q=cell2mat(Q);

R=cell(h);
for i=1:h
for j=1:h
if(i==j)
R{i,j}=rk;
else
R{i,j}=zeros(size(rk));
end
end
end
R=cell2mat(R);

parameters.Q= Q;
parameters.R= R;

%Matrices de la ecuaci?n de predicci?n vectorial
[Gx,Fx]=CreateMPC_SSMIMO_hu_U_MatricesEstado(A,B,h,hu);
parameters.Fx= Fx;
parameters.Gx= Gx;



%% Restricciones
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Umin = -10;
Umax = 10;
Vmax= 33;
Vmin=-33;
Pmax=550;
Pmin=-550;
parameters.constraints.Umin= Umin;
parameters.constraints.Umax= Umax;
parameters.constraints.Xmin= [Pmin, Vmin]';
parameters.constraints.Xmax= [Pmax, Vmax]';

%% mRPI
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

wlim = [2.7140, 0.1405]';
%Valores máximos de la incertidumbre
parameters.robust.Wmax= [wlim(1), wlim(2)]';   

%Politopos del MPC robusto

%Definicón de las matrices del conjunto X
%Restricciones de estado (V velocidad y P posición angular)

% -Vmax, Vmin son las velocidades máxima y mínima
% -Pmax y Pmin son las posiciones máxima y mínima
[ny,nx]=size(C*A);
[ny,nu]=size(C*B);

Ax=[eye(2);
-eye(2)];
bx=[Vmax;Pmax;
-Vmin;-Pmin];
%Definición de las matrices del conjunto Wx
Aw=[eye(nx);
-eye(nx)];
bw=[ wlim;
-(-wlim)];
%Cálculo del invariante y la ganancia
%K se calcula para que sea un control de tiempo mínimo
[PhiK,K] = ominset(A,B,[Aw bw],[Ax bx]);
%Obtención de las matrices de restricción que definen PhiK
[Aphi,bphi]=aug2std(PhiK);
%Conversión a objeto Politopo para poder operar con ello
figure(1);
PhiK_polytope=polytope(Aphi,bphi);
plot(PhiK_polytope);

%Estado admisible del sistema real
Ax=[eye(2);
-eye(2)];
bx=[Vmax;Pmax;
-Vmin;-Pmin];
X_polytope=polytope(Ax,bx);
%Entrada admisible del sistema real
Au=[eye(1);
-eye(1)];
bu=[Umax;
-Umin];
U_polytope=polytope(Au,bu);
%Region admisible del estado y entrada nominal
Xnom_polytope=X_polytope-PhiK_polytope;
Unom_polytope=U_polytope-K*PhiK_polytope;
%Ploteo los conjuntos
figure(2);
plot(X_polytope,'b',Xnom_polytope,'r');
legend('X','X_{nom}')
xlabel('vx (t)');
ylabel('x (t)');
figure(3);
plot(U_polytope,'b',Unom_polytope,'r');
h2=legend('U','U_{nom}')
xlabel('F_a (t)');

parameters.robust.Unom_polytope= Unom_polytope;
parameters.robust.Xnom_polytope= Xnom_polytope;
parameters.robust.PhiK_polytope= PhiK_polytope;

%Ganancia del controlador de tubo
parameters.robust.K= K;

%Matrices auxiliares para definir el problema de minimización en términos
%de v
Gv=[Fx Gx];
Qv=[zeros(nx,nx)    zeros(nx,hu*nu);
    zeros(hu*nu,nx)  Q];
parameters.robust.Gv= Gv;
parameters.robust.Qv= Qv;


%% Vector de Referencia
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

N=300;
Ref=[zeros(1,N);
zeros(1,5) 400*ones(1,N-5)];