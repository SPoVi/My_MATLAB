function [Gx,Gpx,Fx]=CreateMPC_SSMIMO_hu_Du_MatricesEstado(A,B,C,h,hu)

[ny,nx]=size(C*A);
[ny,nu]=size(C*B);
%Gp
%========================

%Por lo tanto:

Gpc=cell(h,1);
for i=1:h
    Gpc{i,1}=0;
    for j=1:i
        Gpc{i,1} =Gpc{i,1}+A^(j-1)*B;   
    end
end

Gp=cell2mat(Gpc);


%G
%========================


%Genero toda la matriz para hu=h 
Gc=cell(h,h);

for i=1:h
    for j=1:h
        if(j==1)
            Gc{i,j}=Gpc{i};
        else
            Gc{i,j}=zeros(nx,nu);
        end
    end
end



for i=2:h
    for j=2:h
        Gc{i,j}=Gc{i-1,j-1}; 
    end
end

%Ahora escojo s?lo las hu primeras columnas

%Ahora sumo las columnas >hu y se las sumo a la ?ltima
Gaux=cell2mat(Gc(:,hu));
for i=hu+1:size(Gc,2)
    Gaux=Gaux+cell2mat(Gc(:,i));
end

G=[cell2mat(Gc(:,1:hu-1)) Gaux];

%Gaux=cell2mat(Gc);

%F
%========================

%F es la matriz que multiplica al estado actual.

Fc=cell(h,1);

for i=1:h
   Fc{i}=A^i;
end

F=cell2mat(Fc);

Gx=G;
Gpx=Gp;
Fx=F;
