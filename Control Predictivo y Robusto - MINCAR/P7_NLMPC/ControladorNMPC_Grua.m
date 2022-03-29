% Autor: Asier Zubizarreta
% CoAutor: Sergio Pons
% Fecha: 14/01/2021
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Plantilla para la Práctica de Control MPC no lineal
%       Control Predictivo y Robusto
%
%
%   -Requisitos: Tener instalado Visual Studio 2019 en Windows
%   -Requisitos: Tener instalado ACADO Toolkit
%
%   Documentación en http://acado.sourceforge.net/matlab/doc/html/menu.html
%
%   ¿Cómo usar esta plantilla?
%   Las secciones que tienes que rellenar están marcadas. No modifiques las
%   partes fijas salvo que en el enunciado de la práctica se te indique lo
%   contrario. 
%   Repeta la nomenclatura utilizada.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


clc;
clear all;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Flags

EXPORT = 1; %Activar para compilar el MPC. 
            %Una vez compilado se puede poner a 0 para quitar este paso

stepbystepsim=1; %Activar para ver la animación


%% Creo el controlador MPC en ACADO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

acadoSet('problemname', 'mpc'); %Creo un OCP para resolver el MPC no lineal

Ts = 0.1;   %Tiempo de muestreo, que coincide con el periodo de control. 0.1
T=1;        %Tiempo del horizonte de predicción. valor inicial 1

N = T/Ts;   %Número de intervalos para la discretización en el horizonte 
            %de predicción de la ecuación no lineal. 

%El problema OCP se resolverá de 0 a T con N intervalos
ocp = acado.OCP( 0.0, T, N ); 

%% Definición del modelo no lineal
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Definición de estados diferenciales y acciones de control
%  Nótese que se usará la formulación extendida
 
DifferentialState  xm ym dtheta x l theta dx dl fx fl; 
Control dfx dfl;

%Ecuaciones del modelo, en formato implícito 0=f(dx,x,u)

M=1;
m=0.1;
g=9.81;
bl=0.05;
bx=0.5;

%Modelo para la predicción de forma implícita 
% Recuerda que el orden tiene que coincidir con la definición de los estados
% [xm ym dtheta x l theta dx dl fx fl dfx];

 ode = [ 0==xm-(x+l*sin(theta));
         0==ym-(l*cos(theta));
         0==m*l^2*dot(dtheta)+m*l*cos(theta)*dot(dx)+2*m*l*dl*dtheta+m*g*l*sin(theta) ;
         0==dx-dot(x);
         0==dl-dot(l);
         0==dtheta-dot(theta);
         0==(M+m)*dot(dx)+m*l*cos(theta)*dot(dtheta)+m*l*sin(theta)*dot(dl)+bx*dx+2*m*cos(theta)*dl*dtheta-m*l*sin(theta)*(dtheta)^2-fx ;
         0==(m+M)*dot(dl)+m*sin(theta)*dot(dx)+bl*dl-m*l*dtheta^2-m*g*cos(theta)-fl;
         0==dot(fx)-dfx;
         0==dot(fl)-dfl];
     
%asigno el modelo al problema OCP de ACADO
ocp.setModel(ode);


%% Matrices de ponderación
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%En esta sección tienes que definir las matrices de ponderación. Aunque es
%posible modificar su valor en tiempo de ejecución, nosotros las
%consideraremos constantes para todos los instantes de tiempo

%1 ) Matriz asociada a los estados y la acción de control: y=[x;u]
%   Dado que no es posible poner pesos a 0, inicializamos con un valor muy
%   pequeño.
W=1e-6*eye(12); 

% ===> EDITA AQUÍ LAS PONDERACIONES <====%
% Se modificaran los valores dados en el enunciado de la practica para
% realizar la pregunta 4.
rxm = 50;       %% 50
rym = 10;       %% 10    
rtheta = 10;    %% 10
qdfx = 0.01;    %%  0.01;
qdfl = 0.01;    %% 0.01; 

W(1,1)=rxm;
W(2,2)=rym;
W(6,6)=rtheta;
W(11,11)=qdfx;
W(12,12)=qdfl;

%2 ) Matriz asociada al estado terminal
%   Dado que no es posible poner pesos a 0, inicializamos con un valor muy
%   pequeño.
WN=1e-6*eye(10); 

% ===> EDITA AQUÍ LAS PONDERACIONES <====%
WN(1,1)=rxm;
WN(2,2)=rym;
WN(6,6)=rtheta;


Wdim = acado.BMatrix(eye(size(W))); 
WNdim = acado.BMatrix(eye(size(WN)));
ocp.minimizeLSQ( Wdim, [xm ym dtheta x l theta dx dl fx fl dfx dfl] ); 
ocp.minimizeLSQEndTerm( WNdim, [xm ym dtheta x l theta dx dl fx fl] ); 


%% Restricciones
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Valores de las restricciones (max y min): Manten esta nomenclatura para
%que luego funcione la animación

% Se modificarán los valores dados en el enunciado de la practica para
% realziar la pregunta 4.

xmin =-4;
xmax =4;

lmin =0;
lmax=2;

% Para Pregunta 2 : Modificar de +-pi/40 a +-pi/200
% Volver a valor original para pregunta 3
thetamin=-pi/20;
thetamax=pi/20;

xmmin=-4;
xmmax=4;

ymmin=0;
ymmax=2;

fxmin=-50;
fxmax=50;

flmin=-50;
flmax=50;


dfxmin=-10;
dfxmax=10;

dflmin=-10;
dflmax=10;


%En esta sección tienes que definir las restricciones usando el comando
%ocp.subjectTo

% ===> EDITA AQUÍ LAS RESTRICCIONES <====%
ocp.subjectTo( xmin <= x <= xmax );
ocp.subjectTo( lmin <= l <= lmax );
ocp.subjectTo( thetamin <= theta <= thetamax );
ocp.subjectTo( xmmin <= xm <= xmmax );
ocp.subjectTo( ymmin <= ym <= ymmax );
ocp.subjectTo( fxmin <= fx <= fxmax );
ocp.subjectTo( flmin <= fl <= flmax );
ocp.subjectTo( dfxmin <= dfx <= dfxmax );
ocp.subjectTo( dflmin <= dfl <= dflmax );

% Añadido para Pregunta 3 :restricciones terminales
% ocp.subjectTo( 'AT_END', [dx] == 0 );
% ocp.subjectTo( 'AT_END', [dtheta] == 0 ); 
% ocp.subjectTo( 'AT_END', [dl] == 0 );

% ejemplo de restricciones iniciales
% ocp.subjectTo( 'AT_START', [dtheta] == 0 ); 


%% Configuración de los integradores para el MPC
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

mpc = acado.OCPexport( ocp );
mpc.set( 'HESSIAN_APPROXIMATION',       'GAUSS_NEWTON'      );
mpc.set( 'DISCRETIZATION_TYPE',         'MULTIPLE_SHOOTING' );
mpc.set( 'SPARSE_QP_SOLUTION',          'FULL_CONDENSING_N2');
mpc.set( 'INTEGRATOR_TYPE',             'INT_IRK_GL2'       );
mpc.set( 'NUM_INTEGRATOR_STEPS',        2*N                 ); %% orignalmente 2*N
mpc.set( 'QP_SOLVER',                   'QP_QPOASES'    	);

%Compilo si el flag está activo. Esto sólo hay que hacerlo una vez.

if EXPORT
    global ACADO_;
    copyfile([ACADO_.pwd '/../../external_packages/qpoases'], 'export_MPC/qpoases')
    mpc.exportCode( 'export_MPC' );
    
    cd export_MPC
    make_acado_solver('../acado_MPCstep')
    cd ..
end



%% Crear el modelo para simulación==> NO EDITAR
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%ACADO permite usar sus integradores también para simular la planta. Se
%creará una función compilada llamada integrate_grua que permitirá simular
%la misma. 

%Para que no haya problemas, se define usando el mismo conjunto de
%ecuaciones (modelo ideal) y el tiempo de discretización del MPC:

acadoSet('problemname', 'sim');
sim = acado.SIMexport( Ts );
sim.setModel(ode);
sim.set( 'INTEGRATOR_TYPE',             'INT_IRK_GL2' );

numSteps = N*2;
sim.set( 'NUM_INTEGRATOR_STEPS',        numSteps        );

if EXPORT
    sim.exportCode( 'export_SIM' );
    
    cd export_SIM
    make_acado_integrator('../integrate_grua')
    cd ..
end


%% Preparación de la simulación
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

nx=10;  %Número de estados en DifferentialStates
ny=2;   %Número de salidas. La referencia para nosotros es xm e ym
nu=2;   %Número de entradas. dfx y dfl



% Referencia 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ===> EDITA AQUÍ LA REFERENCIA <====%
Nsim=30/Ts;
Freq1=0.05;
Freq2=0.1;

% Pregunta 4: Aumentar al doble las frecuencias ...........................
Freq1 = Freq1*2;
Freq2 = Freq2*2;
Ref =[zeros(1,20) sin(Freq1*[0:Nsim-1]);
    ones(1,20) 1+0.3*sin(Freq2*[0:Nsim-1])];

Nref=size(Ref,2); %Número de puntos a simular (columnas de Ref)

%Inicialización MPC: Estados predichos y acciones de control calculadas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Estado inicial para la simulación:
% Orden de DifferentialState  [xm ym dtheta x l theta dx dl fx fl];
X0 = [0 1 0 0 1 0 0 0 0 0]; 

%El MPC requiere un valor inicial de la trayectoria predicha del estado y
%la acción de control. En nuestro caso, vamos a suponer que es la asociada
%al estado inicial X0, para que no haya problemas de convergencia.

%-En input.x hay que inicializar los instantes predichos de X(k), con
%k=0,... N . En total,  N+1 instantes 

% ===> EDITA AQUÍ EL VALOR INICIAL DE LA SECUENCIA PREDICHA DE X====%    
input.x = [repmat(X0,N+1,1)];
%-En input.u hay que inicializar la acción de control U(k) con k=0,.. N (N
%instantes)

% ===> EDITA AQUÍ EL VALOR INICIAL DE LA SECUENCIA PREDICHA DE U====%   
input.u = zeros(N,2); 
%Inicialización MPC: Deshabilitar horizonte deslizante automático
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Con referencias que sean variables es mejor ponerlo a 0, e ir actualizando
%manualmente las referencias, como haremos en el for.

input.shifting.strategy = 0;    

%Inicialización MPC: Ponderaciones
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ACADO permite que esto se modifique dentro del FOR. Por simplicidad vamos
%a considerarlas constantes en toda la simulación, con lo que las
%inicializamos aquí

% He eliminado la k de Wk y WNk
input.W = W;
input.WN =WN; 


%Inicialización de la simulación: Variables para plotear
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Estas variables se usan para almacenar el estado, la salida (xm e ym) y la
%acción de control, con el fin de plotearlos al acabar el FOR. Se
%recomienda no editar esta parte y mantener la sintaxis.

%Columna: instante de tiempo, fila: variable

Y=NaN*ones(ny,Nref);
X=NaN*ones(nx,Nref);
U=NaN*ones(nu,Nref);

%Inicializamos el estado inicial de la simulación (t=0, que en Matlab
%corresponde con el índice 1 de los arrays definidos).

X(:,1)=X0;
Y(:,1)=[X0(1:2)'];
U(:,1)=zeros(nu,1);
DU(:,1)=zeros(nu,1);

%Usados para almacenar los datos que nos ofrece ACADO.
time = 0;
INFO_MPC = [];
controls_MPC = [];

%% Bucle de simulación
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

display('----------------------------------------------------------------')
display('             Simulation Loop'                                    )
display('----------------------------------------------------------------')

%El instante i=1 es el 0 debido a que los arrays comienzan en 1 en Matlab.
%Además, dado que para calcular el MPC necesitamos tener los N siguientes
%puntos de la referencia, la simulación acabará N instantes antes que el
%número de puntos que tengamos en la referencia. 

for k=1:Nref-N 
    
    %Actualizo la referencia w=[xm ym] %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    w=zeros(2,N);
    for j=k+1:k+N
        if(j>length(Ref))
            w(:,j-k)= Ref(:,end); %Mantengo el último valor si simulo más puntos
        else
            w(:,j-k)=Ref(:,j);
        end
    end
    w=w'; %traspongo
    
    %Valor inicial de U(k-1) para el integrador.%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % En la primera iteración lo supongo 0
    if(k==1)
        Uant=zeros(nu,1);
    else
        Uant=U(:,k-1);
    end
    
    %Actualizar el estado X(0) para el MPC%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    %En nuestro caso es un vector 1xnx
    
    % ===> EDITA AQUÍ EL ESTADO ACTUAL X(k)====%   N+1 x nx  
    input.x0 = [X(:,k)]'; %Estado actual medido
    
    %Actualizar referencia para ACADO. %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %
    %Nótese que en w teneos sólo las variables xm e ym, dado que el resto,
    %o no nos interesa seguir la referencia, o ésta es 0 siempre.
    
    %Referencia de los estados y la acción de control : yd=[x u], en
    %nuestro caso: yd=[xm ym dtheta x l theta dx dl fx fl  | dfx dfl];
    %En nuestro caso, cada fila se corresponde con un instante de tiempo, y
    %cada columna con la variable de yd correspondiente.
    
    % ===> EDITA AQUÍ EL VALOR INICIAL DE LA REFERENCIA YD====%  Nx(nu+nx)
    % 10x12
%     ys = zeros(10);
%     ys(:, 1:2) = w;
%     input.y=[ys zeros(N,2)];
    input.y=[w zeros(N,10)];
    %Valor del estado terminal. En nuestro caso se corresponde con la
    %referencia tras N instantes yN. 
    %Recuerda que yNd sólo contempla los estados en x, esto es:
    % YNd=[xm ym dtheta x l theta dx dl fx fl]
    
    % ===> EDITA AQUÍ EL VALOR INICIAL DE LA REFERENCIA YND====%  
    input.yN=input.y(end,1:10);

    %Ejecuto MPC %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
    output = acado_MPCstep(input);    
     %Inicializo los valores predichos de x y u para la siguiente iteración
    input.x = output.x;
    input.u = output.u;    
    INFO_MPC = [INFO_MPC; output.info]; %Datos del MPC
    
    %Extraigo u(0) %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %en la estructura output, el campo u almacena la secuencia ´´optima de
    %la acción de control 
    % ===> EDITA AQUÍ EL VALOR de u(0)====%
    DU(:,k) = output.u(1,:);
    
    %Integrador, dado que controlamos en términos de DU %%%%%%%%%%%%%%%%%%%
    if(k==1)
        U(:,k)=DU(:,k); %Asumimos inicio =0,
    else
        U(:,k)=U(:,k-1)+DU(:,k);
    end
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %Simulo planta%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %No edites esta parte
    
    % Simulate system
    sim_input.x = X(:,k); %Estado actual
    sim_input.u = DU(:,k); %accuión de control
    x = integrate_grua(sim_input);
    
    %extraigo el valor del nuevo estado X(k+1) y la salida (xm e ym)
    X(:,k+1)=x.value;
    Y(:,k+1)=[eye(2) zeros(2,8)]*X(:,k+1);   
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    %Update iteration %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    nextTime = k*Ts; 
    disp(['current time: ' num2str(nextTime) '   ' char(9) ' (RTI step -- QP error: ' num2str(output.info.status) ',' ' ' char(2) ' KKT val: ' num2str(output.info.kktValue,'%1.2e') ',' ' ' char(2) ' CPU time: ' num2str(round(output.info.cpuTime*1e6)) ' Âµs)'])
    time = [time nextTime];
    % Simulate image %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    if(stepbystepsim==1)
  
    AnimateGrua(20,X(:,k), [xmmin xmmax], [ymmin ymmax], time(end) );  
    end
    

    
      
end %END FOR SIMULACIÓN


%% FIGURAS Y RESULTADOS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%ploteo Y %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(9)

%Plot de Y
subplot(2,1,1);
plot(Y(1,:),'linewidth', 2); hold on;
plot(Ref(1,:),'r--','linewidth', 2);
plot([0 size(Y,2)], [xmmin xmmin], 'g--','linewidth', 2);
plot([0 size(Y,2)], [xmmax xmmax], 'g--','linewidth', 2);
hold off
xlabel('t (paso)');
ylabel('x_m (m)');
grid on;

subplot(2,1,2);
plot(Y(2,:),'linewidth', 2); hold on;
plot(Ref(2,:),'r--','linewidth', 2);
plot([0 size(Y,2)], [ymmin ymmin], 'g--','linewidth', 2);
plot([0 size(Y,2)], [ymmax ymmax], 'g--','linewidth', 2);
hold off
xlabel('t (paso)');
ylabel('y_m (m)');
grid on;

%ploteo X %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(10);

%Plot de X [xm ym dtheta x l theta dx dl fx fl  | dfx dfl];
subplot(3,1,1);
plot(X(4,:),'linewidth', 2); hold on;
plot([0 size(X,2)], [xmin xmin], 'g--','linewidth', 2);
plot([0 size(X,2)], [xmax xmax], 'g--','linewidth', 2);
hold off
xlabel('t (paso)');
ylabel('x (m)');
grid on;

subplot(3,1,2);
plot(X(5,:),'linewidth', 2); hold on;
plot([0 size(X,2)], [lmin lmin], 'g--','linewidth', 2);
plot([0 size(X,2)], [lmax lmax], 'g--','linewidth', 2);
hold off
hold off
xlabel('t (paso)');
ylabel('l (m)');
grid on;

subplot(3,1,3);
plot(X(6,:),'linewidth', 2); hold on;
plot([0 size(X,2)], [thetamin thetamin], 'g--','linewidth', 2);
plot([0 size(X,2)], [thetamax thetamax], 'g--','linewidth', 2);
hold off
xlabel('t (paso)');
ylabel('\theta (rad))');
grid on;


%ploteo U %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(11);

subplot(2,1,1);
stairs( U(1,:),'linewidth', 2);
hold on;
plot([0 size(U,2)], [fxmin fxmin], 'g--','linewidth', 2);
plot([0 size(U,2)], [fxmax fxmax], 'g--','linewidth', 2);
hold off
xlabel('t (paso)');
ylabel('fx (N)');
grid on;

subplot(2,1,2);
stairs( U(2,:),'linewidth', 2);
hold on;
plot([0 size(U,2)], [fxmin fxmin], 'g--','linewidth', 2);
plot([0 size(U,2)], [fxmax fxmax], 'g--','linewidth', 2);
hold off
xlabel('t (paso)');
ylabel('fl (N)');
grid on;

%ploteo DU %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(12);

subplot(2,1,1);
stairs(DU(1,:),'linewidth', 2);
hold on;
plot([0 size(DU,2)], [dfxmin dfxmin], 'g--','linewidth', 2);
plot([0 size(DU,2)], [dfxmax dfxmax], 'g--','linewidth', 2);
hold off
xlabel('t (paso)');
ylabel('dfx (N/step)');
grid on;

subplot(2,1,2);
stairs( DU(2,:),'linewidth', 2);
hold on;
plot([0 size(DU,2)], [dfxmin dfxmin], 'g--','linewidth', 2);
plot([0 size(DU,2)], [dfxmax dfxmax], 'g--','linewidth', 2);
hold off
xlabel('t (paso)');
ylabel('dfl (N/step)');
grid on;
