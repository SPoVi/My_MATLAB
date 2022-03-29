%% === T6 - APRENDIZAJE POR REFUERZO - EJERCICIO - ===
% Autor : SPoVi
% Fecha de creación:        21/10/2020
% Fecha ultima modificacion: 12/11/2020

%% == Limpar == 
clc
clear all
close all

%% == Fase 0: Inicizalizacion de los parametreo del algoritmo ==
gamma = 0.9;	% Ratio de descuento
alpha = 0.1;	% Ratio de aprendizaje

Na = 20; 		% Nº de acciones
amax = 10; 		% Valor maximo de accion que se le puede aplicar al sistema
amin = -10; 	% Valor minimo de accion que se le puede aplicar al sistema

%a(t) = (amax-amin)*(aref/Na)+amin	% Accion que puede aplicar el 
                                    % controlador sobre el sistema
%s(t)	% Estado del sistema, y en nuestro caso se supone que es el error 
        % respecto a la consigna

Ns = 100; 		% No. de estados
smax = 5;		% Estado maximo admisible
smin= -5; 	 	% Estado minimo admisible

% Definicion del sistema a controlar
H=zpk([], [-1,-0.002], 1);  % Definicion de la funcion de transferencia del 
                         % sistema a controlar
Q = zeros(Ns,Na);                          
% La matriz Q contiene todos los ceros (el agente no ha explorado o 
% alcanzado el estado objetivo todavía, por lo que no sabe qué estados y 
% acciones son más o menos valiosos. No se sabe nada del entorno en este 
% momento, indicado por los ceros que ocupan la matriz. 
%% == Fase 1: Experimentacion ==
% Se genera de forma aleatoria una secuencia de acciones
T = 10;         % Horizonte de simulacion (segundos)
Nmax = 2000;    % longitud de la secuencia aleatoria

% Secuencia de acciones a aleatoria
avec = random('uniform',amin,amax,1,Nmax); %Nmax valores aleatorios[-10,10]
%avec = ones(1,max);
t = T*[0:Nmax-1]/Nmax;    % ratio de simulacion para que los Nmax valores 
                          % se simulen en el tiempo T.
                          
% Simular la respuesta temporal del sistema dinámico a entradas arbitrarias
yvec = lsim(H,avec,t);    % lineal simulation on simulink

% lsmin(sys,u,t)
% La entrada u es una matriz que tiene tantas filas como muestras de tiempo 
% (longitud(t)) y tantas columnas como entradas del sistema
% Por ejemplo, si sys es un sistema SISO, entonces u es un vector t por 1. 
% Si sys tiene tres entradas, entonces u es una matriz de t por 3. Cada fila
% u(i,:) especifica el/los valor(es) de entrada en el momento de la muestra 
% t(i). La señal u también aparece en el gráfico.
    

yconsigna=ones(1,Nmax);  % Consigna del sistema. Vector de unos.
error = yconsigna-yvec'; % Error del sistema y el estado
s = error;               % Estado
r = -abs(error);         % Calcuo del retorno. Negativo por que se quiere 
                         % minimizar.
                         
% = Gafica =
subplot(4,1,1)
plot(t,avec,'b');
legend('yvec');
title("Secuencia de entradas arbitrarias");
grid
subplot(4,1,2)
plot(t,yvec,'r',t,yconsigna,'g')
legend('yvec','yconsigna');
title("Respuesta temporal del sistema dinámico a enrtadas arbitrarias");
grid                        
subplot(4,1,3)
plot(t,r,'m');
title("Retorno");
legend("r");
grid
subplot(4,1,4)
plot(t,s,'c');
title("Error");
legend("s");
grid
hold off

%% == Fase 2: Entrenamiento ==
for k = Nmax-1:-1:1     % Se recorre hacia atrás
    % Aqui calculamos la fila y columna correspondiente a ese estado y a
    % esa accion
    sref = round(Ns*(s(k)-smin)/(smax-smin));
    % Control de limites
    if sref > Ns
        sref = Ns;
    end
    if sref < 1
        sref = 1;
    end
    %pause % Fila Q(s,a)
        
    % a(t) = (amax-amin)*(aref/Na)+amin
    % aref = round(Na*(avec(k)-amin)/(amax-amin))    % Columna Q(s,a)
    aref = round(Na*(avec(k)-amin)/(amax-amin));       
    % para que no de 0
    if aref < 1
        aref = 1;
    end
    % Calculamos
    stmas1 = s(k+1);    % La primera vez será la posicion Nmax.
    stmas1ref = round(Ns*(stmas1-smin)/(smax-smin));
    % Control de limites
    if stmas1ref > Ns
        stmas1ref = Ns;
    end
    if stmas1ref < 1
        stmas1ref = 1;
    end
    maxQstmas1 = max(Q(stmas1ref,:));   % Maximo valor de la fila
    % maxQstmas1 = max(Q(k+1,:));
    Q(sref,aref) = Q(sref,aref)+alpha*(r(k)+gamma*maxQstmas1-Q(sref,aref));
    %Q(aref,sref) = Q(aref,sref)+alpha*(r(k)+gamma*maxQstmas1-Q(aref,sref));
end

fprintf("\n#####################");
fprintf("\nFin del entrenamiento");
fprintf("\n#####################\n");
%pause
    
%% == Fase 3: Ejecucion o explotacion de resultados ==
Nsimulaciones=10000;            % Esta es la longitud de la simulacion
ysimul=zeros(1,Nsimulaciones);  % Vector inicizaliado a cero
avec_new = avec;
figure;

for k=1:Nsimulaciones-1
    tsimul=t(1);                
    y0=ysimul(k);               % ysimul tiene 2000,  y k llega hasta 100000
    
    s=yconsigna(k)-y0;                   % Error 
    sref=round(Ns*(s-smin)/(smax-smin));
    [Qmax,aref]=max(Q(sref,:));          % La accion que comete menos error
    
    
    a=(amax-amin)*((aref-amin)/Na);        % Inversa del calculo de aref para calcular la accion
    avec_new(aref) = a;                        % Sustituir en la posicion de refencia la accion calculada
    ysimul=lsim(H,avec_new,t,ysimul);
%     a = (amax-amin)*(aref/Na)+amin
%     ysimul(k+1) = lsim(H,avec,t,y0);    % lineal simulation on simulink

    % lsim(sys,u,t,x0) 
    % especifica además una condición inicial x0 para los estados del 
    % sistema. Esta sintaxis sólo se aplica cuando sys es un modelo de 
    % espacio de estado. x0 es un vector cuyas entradas son los valores 
    % iniciales de los correspondientes estados de sys.
    plot(ysimul,'r')
end

fprintf("\n#####################");
fprintf("\nFin de la ejecución");
fprintf("\n#####################\n");

% = Grafica =
figure;
plot(tsimul,ysimul,'r')
grid on
hold on
xlabel('tiempo [seg]')
ylabel('y [-]')
hold off
