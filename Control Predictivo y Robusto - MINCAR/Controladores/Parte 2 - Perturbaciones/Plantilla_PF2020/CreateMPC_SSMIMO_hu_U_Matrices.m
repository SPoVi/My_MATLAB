function [G,F]=CreateMPC_SSMIMO_hu_U_Matrices(A,B,C,h,hu)

%Creates x=Gx*Du+fx

[nx,nu]=size(B);
%Gp
%========================

%Por lo tanto:

Gpc=cell(h,1);
for i=1:h
    Gpc{i,1}=0;
    for j=1:i
        Gpc{i,1} =C*A^(j-1)*B;   
    end
end


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

%Ahora sumo las columnas >hu y se las sumo a la ?ltima

Gaux=cell2mat(Gc);

G=[Gaux(:,1:hu-1) sum(Gaux(:,hu:end),2)];

%F
%========================

%F es la matriz que multiplica al estado actual.

Fc=cell(h,1);

for i=1:h
   Fc{i}=C*A^i;
end

F=cell2mat(Fc);
