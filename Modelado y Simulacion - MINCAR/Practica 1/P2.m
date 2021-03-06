% P2.m

% Circuito paralelo.
% Encontrar la corriente y potencia de la fuente.

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
P_total = sum(Pn);

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
