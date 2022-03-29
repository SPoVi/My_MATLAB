

%% Newton Raphson en un robot 5R

%Parámetros

L1=0.5;
L2=0.5;
l1=0.3;
l2=0.3;
a1=[0;0];
a2=[1; 0];

%% Datos de entrada

iMax=5; %Iteraciones máximas
tol=1e-6; %Tolerancia relativa

%posición articular

qa=[pi/4; 3*pi/4];

%Punto inicial para iterar
X0=[0;0];


%% Algoritmo NR

OAx1=a1(1);
OAy1=a1(2);    
OAx2=a2(1);
OAy2=a2(2); 

qa1=qa(1);
qa2=qa(2);

i=0;
X=X0;
Xant=X0;
while(1)
    
    %Desglose de parámetros
    px=Xant;
    x=Xant(1);
    y=Xant(2);
     
    
    %Ecuación de cierre
    
    vL1=[L1*cos(qa1); L1*sin(qa1)]; 
    vL2=[L2*cos(qa2); L2*sin(qa2)]; 
    
    f=[...
    (a1+vL1-px)'*(a1+vL1-px)-l1^2
    (a2+vL2-px)'*(a2+vL2-px)-l2^2];
    %Jacobiana
    J =[...
        [ 2*x - 2*OAx1 - 2*L1*cos(qa1), 2*y - 2*OAy1 - 2*L1*sin(qa1)]
        [ 2*x - 2*OAx2 - 2*L2*cos(qa2), 2*y - 2*OAy2 - 2*L2*sin(qa2)]
        ];
    
    %Iteración
    X=Xant-inv(J)*f;
    
    %Tolerancia
    e=norm(X-Xant);
    
    %Visualización
    
    disp(['Iteracion: ' num2str(i) '-' 'x=[' num2str(X') ']-e=' num2str(e)]);

    %Condición de salida
    if(e<=tol)
        disp('Tolerancia alcanzada');
        break;
    elseif (i>=iMax)
        disp('Máximo número de iteraciones alcanzado');
        break;
    end
    
    %Siguiente iteración
    
    Xant=X;

end

disp('Resultado X');
disp(X);


%% Conocido X es posible obtener qp

%Calculo puntos Bi a partir de qai 

B1=L1*[cos(qa(1));sin(qa(1))];
B2=L2*[cos(qa(2));sin(qa(2))];


%qp, ángulos de los segmentos B1X-qa1

qp1=atan2(X(2)-B1(2),X(1)-B1(1)-qa(1));
qp2=atan2(X(2)-B2(2),X(1)-B2(1)-qa(1));
qp=[qp1;qp2];


disp('Resultado qp');
disp(qp);



