function Fpm=Create_Fpm(A,B,C,Dm,h);
% Funci�n para calcular la matriz de compensaci�n asociadas a las
% perturbaciones medibles
%
% Input:
%   -A,B,C: Matrices del modelo nominal discretizado
%   -Dm: Matriz asociada a la din�mica de la perturbaci�n medible
%   -h: Horizonte de predicci�n
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Perturbaci?n medible Fw
Fpm=cell(h,1); 
for j=1:h
    Fpm{j,1}=0;
    for i=1:j
        Fpm{j,1} =Fpm{j,1}+C*A^(i-1)*Dm;   
    end
end

Fpm=cell2mat(Fpm);