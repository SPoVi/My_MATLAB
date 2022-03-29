

%% Problema Cinemático Inverso de un robot 5R

%Parámetros del Robot

L1=0.5;
L2=0.5;
l1=0.3;
l2=0.3;
a1=[0;0];
a2=[1; 0];

%% Datos de entrada

mt=[1 1]; %Modo de trabajo 1 o 0 por cada pata (4 modos en total)

X=[0.5 ;
   0.091726]; % Posición del TCP 

x=X(1);
y=X(2);

%%  Punto B1-Intersección de Circunferencias L1 y l1

[OK,ErrorMsg,B1a,B1b]=InterseccionCircunferencia(L1,a1(1),a1(2),l1,x,y); % Datos: radio 1, centro 1, radio 2, centro 2

%Detecto si no hay intersección, en ese caso se visualizaría ErrorMsg
if(OK==0)
    disp(ErrorMsg); 
    return;
end

%Si hay intesercción se calcula qa1 a partir del ángulo de a1B1

% Para seleccionar el modo deseado
if(mt(1)==1)
    B1=B1a;
else
    B1=B1b;
end

qa1=atan2(B1(2)-a1(2),B1(1)-a1(1)); %Arco tangente de 4 cuadrantes

%%  Punto B2-Intersección de Circunferencias L2 y l2

[OK,ErrorMsg,B2a,B2b]=InterseccionCircunferencia(L2,a2(1),a2(2),l2,x,y);

if(OK==0)
    disp(ErrorMsg); %Detecto si no hay intersección
    return;
end

%qa2 se obtiene a partir del ángulo de a2B2

if(mt(2)==1)
    B2=B2a;
else
    B2=B2b;
end

qa2=atan2(B2(2)-a2(2),B2(1)-a2(1)); %Arco tangente de 4 cuadrantes

%% Solución qa

qa=[qa1;qa2];

disp('Solución');
disp(qa);


