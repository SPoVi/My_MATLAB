function Parametros=Ex21_ParametrosRobot

% Parámetros del Robot del Examen del 19/04/2021

% NO EDITAR!!!

%Longitudes brazos 

L1=1; 
L2=1;
LcL1=0.5;
LcL2=0.5;

% Masas
mL1=0.5;
mL2=0.5;
mD1=0.1;
mD2=0.1;
mC=0.1;

%Inercias
IL1=0.01;
IL2=0.01;
IC=0.01;

g=9.8;


%Estructura de parámetros

Parametros=[];

Parametros.L1=L1;
Parametros.L2=L2;
Parametros.LcL1=LcL1;
Parametros.LcL2=LcL2;

Parametros.IL1=IL1;
Parametros.IL2=IL2;
Parametros.IC=IC;

Parametros.mL1=mL1;
Parametros.mL2=mL2;
Parametros.mD1=mD1;
Parametros.mD2=mD2;
Parametros.mC=mC;

Parametros.g=g;
