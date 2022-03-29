function [OK,X,q]=UserDKP(Parametros,qa,X0)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%           Calcula la cinemática directa del robot 3RRR
%
%-Input
%   -Parametros : Estructura de parámetros que contiene los parámetros
%   cinemáticos y dinámicos del robot (desglosado en la cabecera)
%   -qa=[qa1 qa2 qa3]', vector 3x1 con todas las variables
%   articulares.
%   -X0=[x0 y0 tz0]' vector  3x1  que contiene la posición inicial sobre la
%   que iterar
%-Output:
%   -OK, será =1 si todo ha ido correctamente, o 0 si no existe solución
%   -X=[x y tz]' vector  3x1  que contiene la posición x e y en m del TCP 
%   y su orientación (rad)
%   -q=[qa1 qa2 qa3 qna1 qna2 qna3]', vector 6x1 con todas las variables
%   articulares.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

X=[];
q=[];
OK=0;

a1=Parametros.Longitudes.a1;
a2=Parametros.Longitudes.a2;
a3=Parametros.Longitudes.a3;

a1x=a1(1); a1y=a1(2);
a2x=a2(1); a2y=a2(2);
a3x=a3(1); a3y=a3(2);

%Desglose de parámetros: Longitudes
L1=Parametros.Longitudes.L1;
L2=Parametros.Longitudes.L2;
L3=Parametros.Longitudes.L3;

l1=Parametros.Longitudes.l1;
l2=Parametros.Longitudes.l2;
l3=Parametros.Longitudes.l3;

%Desglose de parámetros: Geometria plataforma
d1=Parametros.Longitudes.d1;
d2=Parametros.Longitudes.d2;
d3=Parametros.Longitudes.d3;

d1x=d1(1); d1y=d1(2);
d2x=d2(1); d2y=d2(2);
d3x=d3(1); d3y=d3(2);

%Desglose de variables de entrada
qa1=qa(1); qa2=qa(2); qa3=qa(3);

%Algoritmo de Newton Raphson
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

MaxIter=1000; %Parámetros del algoritmo
epsilon=1e-3;
detLimit=1e-3;

Xant=X0;

%Bucle de iteración

for i=1:MaxIter
   
    x=Xant(1);
    y=Xant(2);
    tz=Xant(3);
    
    %Matriz Jacobiana Js==>Copiada del resultado simbólico
    
    Js =[...
    [ 2*x - 2*a1x - 2*L1*cos(qa1) + 2*d1x*cos(tz) - 2*d1y*sin(tz), 2*y - 2*a1y - 2*L1*sin(qa1) + 2*d1y*cos(tz) + 2*d1x*sin(tz), 2*(d1y*cos(tz) + d1x*sin(tz))*(a1x - x + L1*cos(qa1) - d1x*cos(tz) + d1y*sin(tz)) + 2*(d1x*cos(tz) - d1y*sin(tz))*(y - a1y - L1*sin(qa1) + d1y*cos(tz) + d1x*sin(tz))]
    [ 2*x - 2*a2x - 2*L2*cos(qa2) + 2*d2x*cos(tz) - 2*d2y*sin(tz), 2*y - 2*a2y - 2*L2*sin(qa2) + 2*d2y*cos(tz) + 2*d2x*sin(tz), 2*(d2y*cos(tz) + d2x*sin(tz))*(a2x - x + L2*cos(qa2) - d2x*cos(tz) + d2y*sin(tz)) + 2*(d2x*cos(tz) - d2y*sin(tz))*(y - a2y - L2*sin(qa2) + d2y*cos(tz) + d2x*sin(tz))]
    [ 2*x - 2*a3x - 2*L3*cos(qa3) + 2*d3x*cos(tz) - 2*d3y*sin(tz), 2*y - 2*a3y - 2*L3*sin(qa3) + 2*d3y*cos(tz) + 2*d3x*sin(tz), 2*(d3y*cos(tz) + d3x*sin(tz))*(a3x - x + L3*cos(qa3) - d3x*cos(tz) + d3y*sin(tz)) + 2*(d3x*cos(tz) - d3y*sin(tz))*(y - a3y - L3*sin(qa3) + d3y*cos(tz) + d3x*sin(tz))]
    ];

    %Ecuación de cierre f(x,qa)==>Copiada del resultado simbólico
    f=[...
     (a1x - x + L1*cos(qa1) - d1x*cos(tz) + d1y*sin(tz))^2 - l1^2 + (y - a1y - L1*sin(qa1) + d1y*cos(tz) + d1x*sin(tz))^2
     (a2x - x + L2*cos(qa2) - d2x*cos(tz) + d2y*sin(tz))^2 - l2^2 + (y - a2y - L2*sin(qa2) + d2y*cos(tz) + d2x*sin(tz))^2
     (a3x - x + L3*cos(qa3) - d3x*cos(tz) + d3y*sin(tz))^2 - l3^2 + (y - a3y - L3*sin(qa3) + d3y*cos(tz) + d3x*sin(tz))^2
    ];

    %Verifico invertibilidad
    
    if(abs(det(Js))<detLimit)
        break; %Posición singular
    end
        
    %Calculo siguiente punto
    
    X=Xant-inv(Js)*f;
    
    
    %Descomentar para animación de iteración
    %disp([num2str(i) '-x=[' num2str(X') '] e=' num2str(norm(x-xk))]);
    
    %Condicación de finalización
    if(norm(X-Xant)<=epsilon)      
        OK=1; %Ha convergido!
        break; %Salgo del bucle
    else
        Xant=X;
    end
end



%% Calculo Parámetros Pasivos
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%A rellenar por el alumno

if(OK==1)
    x=X(1);
    y=X(2);
    tz=X(3);

% Calculamos la posición de la articulación no actuada (en los apuntes B
% significa p1i)
    B1=a1+L1*[cos(qa1);sin(qa1)];
    B2=a2+L2*[cos(qa2);sin(qa2)];
    B3=a3+L3*[cos(qa3);sin(qa3)];

    B=[B1 B2 B3];
    
% Calculamos la posición de los extremos de la plataforma movil (En los apuntes C significa B)

    R=[cos(tz) -sin(tz); sin(tz) cos(tz)];
    PC1=R*d1;
    PC2=R*d2;
    PC3=R*d3;

    
    P=[x;y];

    C1=PC1+P;
    C2=PC2+P;
    C3=PC3+P;

    C=[C1 C2 C3];

    %qp, ángulos de los segmentos B1C1-qa1
    qp=zeros(3,1);

    for i=1:3
        qp(i)=atan2(C(2,i)-B(2,i),C(1,i)-B(1,i))-qa(i);
    end


    q=[qa;qp];
end
