%% === ADABOOST V1 ===
% Autor:                Ekaitz Zulueta
% Modificado :          Sergio Pons
% Fecha ultima mod:     24/10/2020
%% == Limpiar ==
% Descomentar si no se utiliza el archivo pruebas_adaboost.m
%clc; clear all; close all;  

%% ==  Inicializacion de parametros del Adaboost ==
% DESCOMENTAR EN CASO DE NO UTILIZAR pruebas_adaboost.m
% Nc = 10;                                 % Numero de clasificadores
% Np = 200;                                % Numero de patrones
%
% Calcular de forma aleatoria las salidas que debiera de dar
Y = sign(random('uniform',-1,1,1,Np));  % Valores posibles -1, 0 y 1
Y(Y==0)=1;                              % En caso de dar 0 convertir a 1
%
% Graficar
% plot(Y,'xr')    
% xlabel('Numero de patron')
% ylabel('Resultado de los patrones')
% grid on
%
% Crear matriz de ceros de dimensiones Np x Nc (filas x columnas)
K = zeros(Np,Nc);   % Hipotesis (hn)

% DESCOMENTAR EN CASO DE NO UTULIZAR pruebas_adaboost.m
% pError=0.3;         % Probabilidad de error. Debe ser menor que 0.5.
% Generacion de datos de forma aleatoria. Valores: -1 o 1.
for j=1:Nc
   pError = pError;%*1.01; % Se incrementa la probabilidad
   for i=1:Np
      if random('uniform',0,1,1,1) < pError
          K(i,j) = -Y(i);
      else
          K(i,j) = Y(i);
      end
   end
end

%% == Inicializacion de Adaboost ==
ref_clas=[1:Nc];            % Referencia de los clasificadores
Errores=zeros(1,Nc);        % Tasa de errores We
%
% == Calculo de los errores de cada clasificador ==
% == Primer paso ==
% abs(K(:,j) -> Resultados que da cada clasificador
% Y' -> Resultados esperados (YsubMu)
for j=1:Nc
   Errores(j) = sum(abs(K(:,j)-Y')/2); 
end
%
[ErrorMin,Ref]=min(Errores);            % Calcula el minimo y su posicion (referencia)
alpha=(log((Np-ErrorMin)/ErrorMin))/2;  % Calculo del primer alpha
ref_clas(Ref)=[];                       % Eliminar la referencia de la lista
% K(:,Ref)=[];
lista_clasif=Ref;                       % Añadir la referencia a la lista de clasificadores
%
% == Siguientes pasos ==
for m=2:Nc
    % Clasificadores
    Cm=zeros(1,Np);             % Combinacion de clasificadores. Vector de ceros.
    for i=1:Np      % Para cada clasificador
       %Cm(i)=alpha*K(i,:)';
       %
       % Varia en funcion de los alphas ya calculados
       for r=1:length(alpha)    % Por cada alpha ya calculada 
           Cm(i)=Cm(i)+alpha(r)*K(i,lista_clasif(r));
       end
    end
    
    % En cada ronda hay que calcular los alphas_n para cada clasificador
    % que aun no se ha añadido
    alpha_aux=zeros(1,Nc-m+1);          % Vector alphas auxiliares
    for q=1:Nc-m+1
        errores_ponderados=0;
        aciertos_ponderados=0;
        % Se penalizarán en mayor medida los errores.
        % En caso de acierto la exponencial da un resultado muy pequeño, en
        % caso de fallo da un resultado muy grande. 
        for i=1:Np            
          if Y(i)==K(i,ref_clas(q))
            aciertos_ponderados=aciertos_ponderados+exp(-Y(i)*Cm(i));  
          else
            errores_ponderados=errores_ponderados+exp(-Y(i)*Cm(i));  
          end
        end
        alpha_aux(q)=(log(aciertos_ponderados/errores_ponderados))/2;        
    end
    %
    % Obtener la mejor alpha
    [alpha_max,Ref_q]=max(alpha_aux);   
    if alpha_max <= 0
       break;
    end
    Ref=ref_clas(Ref_q);                % Obtener la referencia
    ref_clas(Ref_q)=[];                 % Eliminamos la referencia de la lista
    alpha=[alpha,alpha_max];
%     K(:,Ref)=[];
    lista_clasif=[lista_clasif,Ref];    % Añadir a la lista de clasificadores que metemos en el Adaboost
end

%% == Ejecucion del metaclasificador Adaboost ==
YAdaboost=zeros(1,Np);
Error=0;
for i=1:Np
    C=0;
       for r=1:length(alpha)
           C=C+alpha(r)*K(i,lista_clasif(r));
       end  
     YAdaboost(i)=sign(C);
     if YAdaboost(i)~=Y(i)
         Error=Error+1;
     end
end
tasa_error=100*(Error/Np);
fprintf("\nLa tasa de error es del %.2f%% \n", tasa_error);
