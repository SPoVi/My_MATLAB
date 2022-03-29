%% DE.m
% Autor : Sergio Pons
% Fecha : 07/10/2020
% Last ed: 08/11/2020

%% == Limpiar todo ==
clear all; 
close all; 
clc

%% == Parámetros Differential Evolution ==
Niter = 50;
Nagentes = 50;  % Columnas de la matriz X. NP : nº of population. Np >= 4.
Nvar  = 2;      % Filas de la matriz X
F = 1;          % Debe estar entre 0 y 2. Controla la amplificacion de la
                % variacion diferencial (Xa-Xb). Recomendado 0.8
GR = 0.5;       % Indice de recombinacion. Entre 0 y 1. Controla la
                % probabilidad de mutación. No es CR ??? Recomendado 0.9
                % storm

%% == Inicializacion ==
X = zeros(Nvar,Nagentes);   % Inicializacion a ceros de la matriz. Nvar x Nagentes
Costes = zeros(1,Nagentes); % Vector de costes. Fila.

% == Generacion aleatoria de los valores iniciales == 
for i = 1:Nagentes
    Costes(i) = inf;
    while Costes(i) >= inf  % cuando no sea inf saldrá del bucle
        X(:, i) = random('uniform',-10,10,Nvar,1);    % Columna de la matriz X
        Costes(i) = CalcularCostesDE(X(:,i));
    end
end

% == Representacion == 
figure(1)
subplot(2,1,1)
plot(X(1,:),X(2,:),'xg')
grid on 
hold on
subplot(2,1,2)

% == Obtencion de minimo coste entre los costes ==
[CosteOptimo,Refmin] = min(Costes); % Coste calculados con funcion CalcularCostesED

% == Ver resultados ==
X(:,Refmin)     % Devuelve la comlumna de agente con menor coste
CosteOptimo     % Devuelve el minimo coste de todos los agentes

plot(1,CosteOptimo,'og')
hold on
grid on

%% == Bucle principal ==

% Vector para guardar los valores de Bilbo en cada iteracion
vBilbo = zeros(1,Niter);
% Vector  para guardar los valores de GR en cada iteracion
vGR = zeros(1,Nagentes);
% Vector para guardor los valores de CosteOptimo en cada iteracion
vC = zeros(1,Niter);

for k = 1:Niter   
    % == Cambiar GR == CR
    % Al hacerlo en funcion de una variable la probabilidad de mutacion no
    % se fija. Será diferente en cada inicializacion por CosteOptimo y
    % variara con dada iteracion de k debido a Costes.
    
    Bilbo = CosteOptimo/mean(Costes);
    K1 = 1;
    GR = exp(-K1*Bilbo);        % Marcianada 
    
    % == Marciandas yo ==
    Marte = CosteOptimo^mean(Costes) / mean(vBilbo)^2
    
     GR = exp(-Bilbo^(CosteOptimo/Marte))      % Aceptable
    % GR = 1-sigmoid(-K1*Bilbo/Marte^(GR^2));  % Aceptable
    % GR = 1-((max(vGR)^min(vGR))* (CosteOptimo))/mean(Costes) - mean(vGR)^2;
    % GR = sigmoid(max(vBilbo)^mean(vBilbo) - Marte^mean(vBilbo))
    % GR = sigmoid(max(vBilbo) - min(vBilbo))

    vBilbo(k) = Bilbo;              % Guarda el valor de Bilbo
 
   fprintf("\nIteracion %d", k);
   
   % == MUTACION ==
   for i = 1:Nagentes % NP - Number of population
       % == Primero ==
       % Escoger de forma aleatoria un agente a
       Refvec = [1:Nagentes];                   % Vector referencia [1 2 3 4 ... Nagentes]
       Refa = random('unid', Nagentes,1,1);     % Numero aleatorio entre 1 y Nagentes. Ej: Refa = 4
       a = Refvec(Refa);                        % a = del Vector Refvec la posicion Refa. Ej: Refvec(4) de un vector del 1 al 5 es el 4.
       Xa = X(:,a);                             % Ej: X(:,4) es la columna 4 entera (todas las filas)
       Refvec(Refa) = [];   % Eliminas la columna escogida aleatoriamente y asignada a Xa. Ej Refvec = [1 2 3 5]
       
       % Depues b
       Refb = random('unid', Nagentes-1,1,1);   % Ej: Refb = 4
       b = Refvec(Refb);                        % Ej: Refvec(4) de [1 2 3 5] es 5.
       Xb = X(:,b);                             % Ej: Columna 5.
       Refvec(Refb) = [];                       % Ej: Refvec = [1 2 3]
       
       % Luego c
       Refc = random('unid', Nagentes-2,1,1);   % Ej: Refc = 3
       c = Refvec(Refc);                        % Ej: Refvec(3) de [1 2 3] es 3.
       Xc = X(:,c);                             % Ej: Columna 3
       Refvec(Refc) = [];                       % Ej: Refvec = [1 2]
       
       
       % == Calcular Y == 
       Y = Xc + F*(Xa-Xb);
       
       % == RECOMBINACION ==
       % == Evaluamos T == Vector de prueba (Trial vector) == 
       T = X(:,i);       
       for q = 1: Nvar
           if random('uniform',0,1,1,1) < GR
               T(q) = Y(q);
           end
       end
       
       % == SELECCION ==
       % Evaluar T y comparacion con X
       CosteT = CalcularCostesDE(T);
       if CosteT < Costes(i)
           Costes(i) = CosteT;
           X(:,i) = T;
       end
       
       fprintf("\n--------Bucle inerno %d",i);
     
   end
   
   % Graficar
   subplot(2,1,1)
   plot(X(1,:), X(2,:), 'xr');
   subplot(2,1,2)
   [CosteOptimo, Refmin] = min(Costes);  
   plot(k,CosteOptimo, 'ob')
   
   % Ver variables
   fprintf("\nIteracion %d", k);
   CosteOptimo
   X(:,Refmin)
   vGR(k) = GR;
   vC(k) = CosteOptimo;
   %GR
   pause(0.1)
end

%% == Ver solucion ==
fprintf("\n=== Valores finales ===");
[CosteOptimo, Refmin] = min(Costes);
CosteOptimo
fprintf("Agente minimo:");
X(:,Refmin)
GR

subplot(2,1,1)
plot(X(1,:), X(2,:), 'xm');
title("Posiciones X")
xlabel("Posicion X1");
ylabel("Posicion X2");
subplot(2,1,2)
plot(k,CosteOptimo, 'om')
title("Coste Optimo");
xlabel("Nº de iteraciones");
ylabel("Coste");

figure(2)
plot(vC,'b')
title("Funcion de coste");
xlabel("Iteracion");
ylabel("Coste");
grid
% 
figure(3)
plot(vBilbo)
hold on
plot(vGR)
legend("Bilbo", "GR");
title("Valores de los vectores Bilbo y GR");
grid
hold off


