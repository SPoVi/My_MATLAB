function [OK,q]=UserIKM(Parametros,X,mt)
%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%
%           Calcula la cinemática inversa de la plataforma 3RRR
%
%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%
%Sintaxis:
%[OK,ErrorMsg,qr,EcCierre]=ThreeRRR_IKM(Parametros,X)
%
%Parámetros:
%->Input:
%%   -Parametros=Estructura de datos definida en ScriptParametrosGough.m
%  -X=[x y tz]' vector  3x1  que contiene la posición x e y en m del TCP 
%   y su orientación (rad) 
%   -mt=[mt1 mt2 mt3]', vector 3x1 que permite seleccionar el modo de
%   trabajo de cada cadena cinemática si existen dos soluciones posibles.
%   mt1, mt2, mt3 pueden tomar los valores 0 o 1.
%->Output:
%   -q=[qa;qp], valores de todas las coordenadas articulares
%   -OK,ErrorMsg: Son funciones de error. SI todo va bien, OK=1 y ErrorMsg
%   está vacío. Si existe error, OK=0 y el error se detalla en ErrorMsg.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

EcCierre=[];
q=[];
OK=0;
ErrorMsg=[];

%Parámetros
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

OA1=Parametros.Longitudes.a1;
OA2=Parametros.Longitudes.a2;
OA3=Parametros.Longitudes.a3;

L1=Parametros.Longitudes.L1;
L2=Parametros.Longitudes.L2;
L3=Parametros.Longitudes.L3;

l1=Parametros.Longitudes.l1;
l2=Parametros.Longitudes.l2;
l3=Parametros.Longitudes.l3;

d1=Parametros.Longitudes.d1;
d2=Parametros.Longitudes.d2;
d3=Parametros.Longitudes.d3;

x=X(1);
y=X(2);
theta=X(3);

P=[x;y]; 

%Consideramos la traslación al punto P=[x,y], calcular la posición de los
%puntos C (B en el documento)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
R=[cos(theta) -sin(theta); sin(theta) cos(theta)];
PC1=R*d1;
PC2=R*d2;
PC3=R*d3;

C1=PC1+P;
C2=PC2+P;
C3=PC3+P;

% Calculamos los posibles puntos Bi (pi en el documento)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[OK,ErrorMsg,B1a,B1b]=InterseccionCircunferencia(L1,OA1(1),OA1(2),l1,C1(1),C1(2));
if(OK==0) % Si ha habido un error
    return;
end

[OK,ErrorMsg,B2a,B2b]=InterseccionCircunferencia(L2,OA2(1),OA2(2),l2,C2(1),C2(2));
if(OK==0)
    return;
end

[OK,ErrorMsg,B3a,B3b]=InterseccionCircunferencia (L3,OA3(1),OA3(2),l3,C3(1),C3(2));
if(OK==0)
    return;
end

Ba=[B1a' B2a' B3a']; 
Bb=[B1b' B2b' B3b'];

%Detecto los puntos del modo de trabajo
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Trazo rectas de Ai a Ci

A=[OA1 OA2 OA3];
C=[C1 C2 C3];
B=[];

for i=1:3
    Vta=cross([Ba(:,i);0]-[A(:,i);0],([C(:,i);0]-[Ba(:,i);0])); % Se calcula el producto vectorial de los 2 vectores
    Vtb=cross([Bb(:,i);0]-[A(:,i);0],([C(:,i);0]-[Bb(:,i);0])); % y se ve su sentido para seleccionar el modo.
                                                                % Es decir, el signo de la coordenada z.            
    if(Vta(3)<=0 && mt(i)==0 || Vta(3)>=0 && mt(i)==1)          % Si es mt=0 tiene que ser negativo y si es mt=1 positivo.   
      B=[B Ba(:,i)];                                            % Y con este if sabemos Ba y Bb equivale al modo 0 o 1
    elseif(Vtb(3)<=0 && mt(i)==0 || Vtb(3)>=0 && mt(i)==1)
        B=[B Bb(:,i)];
    else
        OK=0;
        ErrorMsg='Comrpuebe mt 0 o 1.';
        return;
    end    
              
end

%Genero los ángulos asociados
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%qa, ángulos de los segmentos A1B1
qa=zeros(3,1);

for i=1:3
    qa(i)=atan2(B(2,i)-A(2,i),B(1,i)-A(1,i));
end

%qp=qna, ángulos de los segmentos B1C1-qa1
qp=zeros(3,1);

for i=1:3
    qp(i)=atan2(C(2,i)-B(2,i),C(1,i)-B(1,i))-qa(i);
end


OK=1;
q=[qa;qp];

end

