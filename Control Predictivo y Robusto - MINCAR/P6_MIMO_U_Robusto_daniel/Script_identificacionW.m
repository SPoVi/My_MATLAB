
%Script para identificación de los valores máximos y mínimos de la
%incertidumbre
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% Periodo de Discretizaci?n

Td=0.1;

%% Matrices del modelo discretizado

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



%% Ejecuto simulación de Identificacion_Simulink.slx 

%Entrada para el experimento
t=0:Td:30;

Fa=[];
Fa.time=t';
Fa.signals.values=[0.5*sin(2*t)+0.5*cos(0.1*t)]';
Fa.signals.dimensions=1;

%Simulación
sim('Identificacion_Simulink.slx');

X=X.signals.values';
U=Fa.signals.values';

% Ahora calculo W para cada instante con el modelo nominal
W=zeros(size(X));
for k=2:length(X)
    
   Xnom=A*X(:,k-1)+B*U(k-1);
   W(:,k)=X(:,k)-Xnom;
   
end

wlim=max(W,[],2)



