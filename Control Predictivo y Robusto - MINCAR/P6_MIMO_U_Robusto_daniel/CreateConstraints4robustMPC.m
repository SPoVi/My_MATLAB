function [Ac,bc]=CreateConstraints4robustMPC(X_actual,Xnom_polytope,Unom_polytope,PhiK_polytope,B,h,hu,Gv)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Esta función adapta las restricciones impuestas en Xnom y Unom, así
%   como la restricción del estado nominal inicial
%   xnom\in x(t)\oplus -\phi_K
%   a un problema de optimización donde se optimiza una variable
%   v=[xnom(t); u^+]
%
%   Devuelve las matrices Ac y bc, tal que Ac*v<=bc, que pueden usarse
%   directamente en quadprog.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    [nx,nu]=size(B);
    
    %Restricciones estado Xadmisible nominal para todo el horizonte
    
    [Axnom,bxnom]=double(Xnom_polytope);
    
    Axnomh=cell(h);
    Omatrix=zeros(size(Axnom));
    for i=1:h
        for j=1:h
            if(i==j)
                Axnomh{i,j}=Axnom;
            else
                Axnomh{i,j}=Omatrix;
            end
        end
    end
    Axnomh=cell2mat(Axnomh);
    bxnomh=repmat(bxnom,h,1);
    
   %Restricciones estado Uadmisible nominal para todo el horizonte
    [Aunom,bunom]=double(Unom_polytope);
    
    Aunomh=cell(hu);
    Omatrix=zeros(size(Aunom));
    for i=1:hu
        for j=1:hu
            if(i==j)
                Aunomh{i,j}=Aunom;
            else
                Aunomh{i,j}=Omatrix;
            end
        end
    end
    Aunomh=cell2mat(Aunomh);
    bunomh=repmat(bunom,hu,1);    
    
    %Restricciones estado inicial xnom\in x(t)\oplus -\phi_K
    
    [Axt,bxt]=double(X_actual+(-PhiK_polytope));
    
    
    %Ahora tengo que montar las restricciones considerando que optimizo 
    %v=[x(t); u^+]
    
    %Por tanto tengo que modificar todas las Ai:
    
    Ac=[Axnomh*Gv;
        [zeros(size(Aunomh,1),nx) Aunomh];
        Axt    zeros(size(Axt,1),hu*nu)];
    bc=[bxnomh;
        bunomh;
        bxt];