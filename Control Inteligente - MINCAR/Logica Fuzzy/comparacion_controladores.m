%% FUZZY
% https://es.mathworks.com/help/fuzzy/fuzzy-pid-control-with-type-2-fis.html
%% -- Limpiar --
clear all; close all; clc;

%% FUZZY - Impresora

load data
plot(PosicionReal);
grid
ylabel("Posición (cm)");
title("Logica Fuzzy - Control de posición Impresora");
upperline = refline(0,0.105); upperline.Color = 'k';
lowerline = refline(0,0.095); lowerline.Color = 'k';

% Simulink
impresora
sim("impresora.slx")
%% -- CODIGO --
% Planta
C = 0.5;
L = 0.5;
T = 0.5;
G = tf(C,[T 1],'Outputdelay',L);

% Generacion de contrlador PID
pidController = pidtune(G,'pidf');

% Parametros
Ce = 1;
tauC = 0.2;
Cd = min(T,L/2)*Ce;
C0 = 1/(C*Ce*(tauC+L/2));
C1 = max(T,L/2)*C0;

% Simular controladores
% model = 'comparepidcontrollers';  % Ejemplo de matlab
% load_system(model)


%% Creacion archivo FIS mediante script
fis1 = sugfis;

% Añadir input variables

fis1 = addInput(fis1,[-1 1],'Name','E');
fis1 = addInput(fis1,[-1 1],'Name','delE');

% Añadir funciones de membresia
fis1 = addMF(fis1,'E','trimf',[-2 -1 0],'Name','N');
fis1 = addMF(fis1,'E','trimf',[-1 0 1],'Name','Z');
fis1 = addMF(fis1,'E','trimf',[0 1 2],'Name','P');
fis1 = addMF(fis1,'delE','trimf',[-2 -1 0],'Name','N');
fis1 = addMF(fis1,'delE','trimf',[-1 0 1],'Name','Z');
fis1 = addMF(fis1,'delE','trimf',[0 1 2],'Name','P');

% Graficas
figure
subplot(1,2,1)
plotmf(fis1,'input',1)
title('Input 1')
subplot(1,2,2)
plotmf(fis1,'input',2)
title('Input 2')

% Añadir variables de salida
fis1 = addOutput(fis1,[-1 1],'Name','U');

% Añadir funciones de membresia
fis1 = addMF(fis1,'U','constant',-1,'Name','NB');
fis1 = addMF(fis1,'U','constant',-0.5,'Name','NM');
fis1 = addMF(fis1,'U','constant',0,'Name','Z');
fis1 = addMF(fis1,'U','constant',0.5,'Name','PM');
fis1 = addMF(fis1,'U','constant',1,'Name','PB');


% Añadir reglas
rules = [...
    "E==N & delE==N => U=NB"; ...
    "E==Z & delE==N => U=NM"; ...
    "E==P & delE==N => U=Z"; ...
    "E==N & delE==Z => U=NM"; ...
    "E==Z & delE==Z => U=Z"; ...
    "E==P & delE==Z => U=PM"; ...
    "E==N & delE==P => U=Z"; ...
    "E==Z & delE==P => U=PM"; ...
    "E==P & delE==P => U=PB" ...
    ];
fis1 = addRule(fis1,rules);

% Grafica Superficie de control

figure
gensurf(fis1)
title('Control surface of type-1 FIS')

% Simulacion ejemplo modificado
comparacion_fuzzy_pid
load data
sim("comparacion_fuzzy_pid.slx")

%% Graficas
plot(comparacion)
grid
title("Logica Fuzzy - Comparacion de controladores");
legend("PID","Sugeno","Mamdani","Ref");