%%  === ADABOOST ===
% Autor:        Ekaitz Zulueta
% Modificado:   Sergio Pons
% Fecha:        15/10/2020
% Ultima mod:   24/10/2020

%% == Limpiar todo ==
clc
close all
clear all
%% == Ejemplo Adaboost ==
% == Poblacion : Cruces ==
% Generaciond de parametros
Ncruces=100;
ycruces=-ones(1,Ncruces);
area=10;
perimetro=100;
sigma=50;
% Generamos los datos de forma aleatoria
XareaCruces=random('norm',area,sigma,Ncruces,1);
XperimetroCruces=random('norm',perimetro,sigma,Ncruces,1);
plot(XperimetroCruces,XareaCruces,'xr')
hold on
grid on
xlabel('Perimetro')
ylabel('Area')

% == Otra población: Circulos ==
% Generacion de variables
Nrect=100;
yrect=ones(1,Nrect);
area=100;
perimetro=10;
sigma=50;
% Generamos los datos de forma aleatoria
XareaRect=random('norm',area,sigma,Nrect,1);
XperimetroRect=random('norm',perimetro,sigma,Nrect,1);
plot(XperimetroRect,XareaRect,'ob')
hold on
grid on
xlabel('Perimetro')
ylabel('Area')

%% == Generador de clasificadores débiles ==
%Datos
Ydata=[ycruces,yrect];
Xdata=[[XperimetroCruces;XareaCruces],[XperimetroRect;XareaRect]]';

%Se trata de lograr un conjunto de clasificadores que tengan una tasa de
%error del 50% o menos
Nclasificadores=1000;
Wthita=zeros(3,Nclasificadores); %Cada columna representa un clasificadores con w1, w2 y thita
% yclasificador=signo(W1*x1+W2*x2+thita)
% X1=perimetro
% X2=area
TasaErrorVec=[]; % Vector para guardar los valores de las tasas de error

for k=1:Nclasificadores
    %Generamos un clasificador de forma aleatoria
    W1W2Thita=random('uniform',-10,10,1,3);
    %Calculamos su error
    yclasificador=sign(W1W2Thita*[Xdata;ones(1,Ncruces+Nrect)]);
    Error=abs(yclasificador-Ydata)/2;
    Nerrores=sum(Error);
    TasaError=100*Nerrores/length(Error);
    %Se da más del 50% de errores, cambiamos de signo todos los pesos
    if TasaError>=50
        W1W2Thita=-W1W2Thita;
    end
    %Calculamos finalmente la tasa de error de cada clasificador
    yclasificador=sign(W1W2Thita*[Xdata;ones(1,Ncruces+Nrect)]);
    Error=abs(yclasificador-Ydata)/2;
    Nerrores=sum(Error);
    TasaError=100*Nerrores/length(Error)
    Wthita(:,k)=W1W2Thita';
    pause(0.1)
    TasaErrorVec=[TasaErrorVec,TasaError];
end

%% == Algoritmo Adaboost ==
% == Inicializacion de parametros del Adaboost ==
Nc = Nclasificadores;
Np = Ncruces+Nrect;     % Numero de patrones
K = zeros(Np,Nc);
for j=1:Nc
   for i=1:Np
      yclasificador=sign(Wthita(:,j)'*[Xdata(:,i);1]);
      if yclasificador~=Ydata(i) 
          K(i,j) = -Ydata(i);   % Aqui en caso de que haya un error
      else
          K(i,j) = Ydata(i);	% Aqui en caso de que no lo haya
      end
   end
end

% == Inicializacion de Adaboost ==
ref_clas=[1:Nc];        % referencia de los clasificadores
Errores=zeros(1,Nc);
for j=1:Nc
   Errores(j) = sum(abs(K(:,j)-Ydata')/2);
end

% Se calcula el mejor clasificador para inicializar el adaboost
[ErrorMin,Ref]=min(Errores);
alpha=(log((Np-ErrorMin)/ErrorMin))/2;
lista_clasif=ref_clas(Ref); %Se toma la referencia
ref_clas(Ref)=[]; %Despues lo borramos del pool o lista de clasificadores disponibles.
% K(:,Ref)=[];


for m=2:Nc
    Cm=zeros(1,Np);
    for i=1:Np
       %Cm(i)=alpha*K(i,:)';
       for r=1:length(alpha)
           Cm(i)=Cm(i)+alpha(r)*K(i,lista_clasif(r));
       end
    end
    %Aqui se calcula para el paso numero m del algoritmo Adaboots, los
    %Nc-m+1 alphas posibles
    alpha_aux=zeros(1,Nc-m+1);
    for q=1:Nc-m+1
        errores_ponderados=0;
        aciertos_ponderados=0;
        for i=1:Np            
          if Ydata(i)==K(i,ref_clas(q))
            aciertos_ponderados=aciertos_ponderados+exp(-Ydata(i)*Cm(i));  
          else
            errores_ponderados=errores_ponderados+exp(-Ydata(i)*Cm(i));  
          end
        end
        alpha_aux(q)=(log(aciertos_ponderados/errores_ponderados))/2;        
    end
    [alpha_max,Ref_q]=max(alpha_aux);
    if alpha_max <= 0
       break;
    end
    Ref=ref_clas(Ref_q);
    ref_clas(Ref_q)=[];
    alpha=[alpha,alpha_max];
%     K(:,Ref)=[];
    lista_clasif=[lista_clasif,Ref];
end

% == Ejecucion del metaclasificador Adaboost ==
YAdaboost=zeros(1,Np);
Error=0;
for i=1:Np
    C=0;
       for r=1:length(alpha)
           C=C+alpha(r)*K(i,lista_clasif(r));
       end  
     YAdaboost(i)=sign(C);
     if YAdaboost(i)~=Ydata(i)
         Error=Error+1;
     end
end
tasa_errorAdaboost=100*(Error/Np);

%% == Resultados ==
fprintf("\n === RESULTADOS ==\n");
fprintf("\nNumero de clasificadores: %d", Nclasificadores); 
fprintf("\nTasa de error  Adaboost: %.2f%%\n", tasa_errorAdaboost);

