function [G,F,Gp]=CreateMPC_SS_Du_Matrices(A,B,C,h);

%para el caso en el que se minimiza u

G=zeros(h,h);
G(1,1)=C*B;
aux=G(1,1);
for i=2:h
   G(i,1)=aux+C*A^(i-1)*B; 
   aux=G(i,1);
   G(i,2:end)=G(i-1,1:end-1);
end

F=zeros(h,1);
for i=1:h
    F(i,1)=C*A^i;
end

Gp=G(:,1);