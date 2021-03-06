% Practica1Y2.m

% Practica 1 y 2: Analisis de circuitos electricos

% Encontrar la corriente y potencia proporcionada por la fuente

% Datos
Vin = 48;
R1 = 27;
R2 = 15;
R3 = 10;
R4 = 18;
R5 = 22;
R6 = 20;

% Resistencia equivalente

Req = R1 + R2 + R3 + R4 + R5 + R6;

% Vector con resistencias
Rn = [R1 R2 R3 R4 R5 R6];

Vn = Rn * Vin / Req;

Pn = Rn * Vin^2 / Req^2;

% Calculo de potencia
I = Vin / Req;
P = Vin * I;

% Tabla
Table = [Rn', Vn', Pn']

% Mostrar
disp(' PRACTICA 1 ');
disp(' ');
disp(' Resistencia    Tension    Potencia');
disp('   (ohms)         (V)        (W)   ');
disp(' ');
disp(Table)
disp(' ');
fprintf(' La corriente del circuito es de %2.2f A\n', I);
fprintf(' La apotnecia de la fuente es de %3.2f W\n', P);


%% Practica 2

% Circuito paralelo.
% Encontrar la corriente y potencia de la fuente.
disp(' ');
disp(' PRACTICA 2');
disp(' ');
% Parametros

Vin = input(' Dar valor a la fuente de tension: '); %24
Rn = input(' Dar valor a las resistencias en un vector fila: '); % [10 15 5 18 10]

% USO DEL PUNTO ??
% Corriente por cada resistencia (rama)
in = Vin./ Rn;

% Resistencia equivalente
Req = 1 / (sum(1./Rn));

% Corriente fuente
Iin = Vin / Req;

% Potencia disipada por cada resistencia
Pn = in.^2.*Rn;

% Potencia fuente
Pn_comp = Vin * Iin;

% Tabla
Table = [Rn', in', Pn']

% Mostrar

disp(' ');
disp(' Resistencia    Tension    Potencia');
disp('   (ohms)         (V)        (W)   ');
disp(' ');
disp(Table)
disp(' ');
fprintf(' La corriente del circuito es de %2.2f A\n', Iin);
fprintf(' La apotnecia de la fuente es de %3.2f W\n', Pn_comp);