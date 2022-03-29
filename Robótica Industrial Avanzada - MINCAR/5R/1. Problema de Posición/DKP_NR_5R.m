% Newton Raphson en un robot 5R

%% Par�metros

L1=0.5;
L2=0.5;
l1=0.3;
l2=0.3;
a1=[0;0];
a2=[1; 0];

%% Datos de entrada 

iMax=5; %Iteraciones m�ximas (Se seleccionan en funci�n de las necesidades: coste computacional vs error)
tol=1e-6; %Tolerancia relativa

%posici�n articular
qa=[pi/4; 3*pi/4];

%Punto inicial seleccionada, la elecci�n de un punto u otro puede llevar a
%diferente resoluci�n (modo de ensamblaje)
%X0=[0;0];
X0=[0;1];


%% Algoritmo NR

OAx1=a1(1);
OAy1=a1(2);    
OAx2=a2(1);
OAy2=a2(2); 

qa1=qa(1);
qa2=qa(2);

i=0;
X=X0;
Xant=X0; %X de la iteraci�n anterior 

while(1)
    
    %Desglose de px necesario en la ecuaci�n de cierre
    px=Xant; %El valor del TCP en la posici�n anterior
    x=Xant(1);
    y=Xant(2);
         
    %Deficiones de los vectores L1 y L2 necesarios en la ecuaci�n de cierre
    
    vL1=[L1*cos(qa1); L1*sin(qa1)]; 
    vL2=[L2*cos(qa2); L2*sin(qa2)]; 
    
    % Defici�n de le ecuaci�n de cierre
    f=[...
    (a1+vL1-px)'*(a1+vL1-px)-l1^2
    (a2+vL2-px)'*(a2+vL2-px)-l2^2];

    %Jacobiana calculado anteriormente
    J =[...
        [ 2*x - 2*OAx1 - 2*L1*cos(qa1), 2*y - 2*OAy1 - 2*L1*sin(qa1)]
        [ 2*x - 2*OAx2 - 2*L2*cos(qa2), 2*y - 2*OAy2 - 2*L2*sin(qa2)]
        ];
    
    %Iteraci�n
    X=Xant-inv(J)*f;
    
    %Tolerancia
    e=norm(X-Xant);
    
    % N�mero de iteraciones    
    i=i+1;
    
    %Visualizaci�n de los resultados de la iteraci�n
    
    disp(['Iteracion: ' num2str(i) '; ' 'x=[' num2str(X') ']; e=' num2str(e)]);

    %Condici�n de finalizar la iteraci�n: 1- Tolerancia menor que la
    %deseada o numero de iteraci�n mayor que el deseado
    if(e<=tol)
        disp('Tolerancia alcanzada');
        break;
    elseif (i>=iMax)
        disp('M�ximo n�mero de iteraciones alcanzado');
        break;
    end
    
    %Siguiente iteraci�n    
    Xant=X;
end

% Visualizar el resultado final
disp('Resultado');
disp(X);


