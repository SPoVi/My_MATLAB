% cirtuitosSerieYParalelo.m

%% EJERCICIO 1 -  SERIE
clc
clear
% Encontrar la tension y potencia disipada en cada resistencia
% Encontrar la corriente y potencia proporcionada por la fuente. I, P
% Datos

Vin = 48;                   % Tension de la fuente
R = [27 15 10 18 22 20];    % Vector con valores de las resistencias

Req = sum(R);               % Resistencia equivalente.

% Datos fuente
I = Req\Vin;                % Corriente de la fuente.
P = Vin * I;                % Potencia de la fuente.

% Datos individuales
V = I*R
PR = I*V
% Mostrar por pantalla
disp(['La corriente de la fuente es: ' num2str(I) 'A']);
fprintf('La potencia de la fuente es %2.2f W\n', P);
disp(' ');                                                  % Linea en blanco
for i = 1:length(V)
    % disp(V(i))
    fprintf('Hay una caida de tenion en la R%d de %2.2f V\n',i,V(i))
    fprintf('La potencia en R%d es de %2.2f W\n',i,PR(i))
    disp(' ');
end

% Tabla
Table = [R', V', PR'];  % Crea tabla de 6x3
% Mostrar Tabla de datos 
disp(' PRACTICA 1 - Circuito Serie');
disp(' ');
disp(' Resistencia    Tension    Potencia');
disp('   (ohms)         (V)        (W)   ');
disp(' ');
disp(Table)
disp(' ');
%% EJERCICIO 2 - PARALELO
clc
clear
% Calcular la corriende y potencia disipada en cada resistencia
% Encontrar la corriente y potencia proporcionada por la fuente

% Datos
Vin = 24;               % Tension fuente
R = [10 15 5 18 10];    % Vector resistencias

% Calculos in
in = Vin./R;             % Corriente por cada resistencia
I = sum(in);             % Corriente de la fuente
P = Vin * I;             % Potencia de la fuente

% Potencia en cada resistencia
Pn = (in.^2).*R;        % A cada elmento del vector in lo elevas al cuadrado. 
                        % A cada elmento de in^2 lo divides por cada elemento de R

% Mostrar dados
disp(' PRACTICA 1 - Circuito Paralelo');
disp(' ');
fprintf('La corriente disipada del circuito es %2.2fA \ny la potencia %2.2fW\n', I,P);
% Tabla
Table = [R', in', Pn'];  % Traspuesta para obtener una tabla de tres columnas

% Mostrar tabla de datos
disp(' ');
disp(' Resistencia  Intensidad  Potencia');
disp('   (ohms)        (A)         (W)   ');
disp(' ');
disp(Table)
disp(' ');

% Comprobacion de resultados
p = sum(Pn);
fprintf('Si los calculos estan bien hechos, p = %2.2f y P = %2.2f son iguales\n',p,P)

