function Fpm=Create_Fpm(A,B,C,Dm,h);
% Función para calcular la matriz de compensación asociadas a las
% perturbaciones medibles
%
% Input:
%   -A,B,C: Matrices del modelo nominal discretizado
%   -Dm: Matriz asociada a la dinámica de la perturbación medible
%   -h: Horizonte de predicción
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