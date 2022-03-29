% helloWorld.m

%% INTRODUCCION

% Filas y columnas
column = [1; 2; 3]
row = [4 5 6]

% Tamaño y longitud vectores
size(row)       
size(column)
length(row)
length(column)

% Matrizes fila x columna. m x n.
A = [1 2; 3 4];
% Concatenacion
a = [1 2];                      % fila Matriz 1 x 2
b = [3 4];                      % fila. Matriz 1 x 2
c = [5; 6];                     % columna. Matriz 2 x 1
d = [a; b];                      % concatenacion. Matriz 2 x 2.
e = [d c];                      % concatenacion. Matriz 2 x 3.
f = [[e e]; [a b a]];           % concatenacion. Matriz 3 x 6.    
str = ['Hello, I am' 'Paco'];   % concatenacion. Matriz 1 x 2.

% Guardar variables
save myVar column row a b

% Eliminar variables
clear a b

% Cargar variables
load myVar

%% EJERCICIO 1

% Guardar en startString el vector start
start = clock

size(clock)                     % Vector. Matriz 1 x 6.

startString = datestr(start)    % Conversion a fecha. String en 1x1.

save startTime start startString    % Guardar var

disp(['He comenzado a aprender matlab en ' startString]); % Mostrar por pantalla

%% EJERCICIO 2

secH = 60^2
finDclase = secH *6

matlabFinal = 1 - exp(-finDclase / secH)

disp([' Al final conoceré ' num2str(matlabFinal * 100) '%S de Matlab'])

%% Continuacion del tema

% Trasposicion
a = [1 2 3 4+i];

transpose(a)         % trasposicion
a'                   % traspuesta conjugada.

% La suma y producto de matrizes se realizan en cada elemento, por lo que
% el tamaño debe coincidir

B = row + column'   % Vector 1 x 3. Fila
C = row' + column   % Matriz 3 x 1. Columna

%% Operaciones sobre cada elemento. Vectores.
% Iguales que las escalares

% f1 y f2 son iguales
t = [1 2];
f1 = exp(t);
f2 = [exp(1) exp(2)]; 

% Operadores que son especiales. *, /, ^. (producto, division, potencia)
% Necesitan el punto . 

a = [1 2 3];        % Matriz 1x3
b = [4; 2; 1];      % Matriz 3x1

% a.*b, a./b, a.^b  son todos invalidos
disp(['a.*b, a./b, a.^b  son todos invalidos. Sigue necesitando tener misma dimension']);
a.*b'
a./b'
a.^(b')
a.\b' % multiplicar por la inversa. (b./a')'
(b./a')' % obtines una fila dividiendo b entre a
%% EJERCICIO 3

secPerMin = 60;
secPerH = secPerMin * 60;
secPerDay = secPerH * 24;
secPerMonth = secPerDay * 30.5;
secPerYear = secPerMonth * 12;

secondConversion = [secPerYear secPerMonth secPerDay secPerH secPerMin 1];

currentTime = clock;
disp(['Tiempo de inicio ' startString])
disp(['Tiempo actual ' datestr(currentTime)])


elapsedTime = currentTime - start;

% pasa cada columna a segundos
t = secondConversion.*elapsedTime;

% sumamos con sum(t) todas las celdas para obtener los segundos totales
ahoraMat = 1 - exp(- sum(t) / secH);

disp(['Ahora ya conozco un ' num2str(ahoraMat * 100) ' % de Matlab'])
%% Continuamos tema 1
clc
clear
% funciones para inicializar vectores
v1 = ones(2, 3);        % ones(numF, numCol)
v0 = zeros(2, 3);
entre0y1 = rand(2, 3);
A = NaN(10,10);         % noInicializado = NaN (nF, nC)
A(1:2, 1:2)=3;           % sustituye valores de las A(filas, columnas)= nuevoValor
A(9:10, 9:10)=25;


%% indices de vector
% ind2sub
IND = [3 4 5 6];
s = [3,3];
[I,J] = ind2sub(s,IND)  % Determina los valores de subindice equiv corresp a un unico indice en una matriz

% sub2ind
rng(0,'twister');   % Iniciar generador de numeros aleatorios
B = rand(3, 4, 2)   % Crear Matriz 3x4x2. Una matriz que contiene dos de 3x4
B(:,:,1)            % Primera matriz
B(:,:,2)            % Segunda matriz
linearInd = sub2ind(size(B),2,1,2)  %Obtener la posicion lineal (1 2 3 4 ... ) de los susindices
linearInd = 14
B(2,1,2)
B(14)

%% submatrices
clear
clc

A = rand(5)         % Crea matriz 5x5 random. Valores < 1
A(1:3,1:2)          % Especifica submatriz contigua
A([1 5 3], [1 4])   % Especifica submatriz por filas y columnas

[minVal, minInd] = min(A)   % Encuentra el min valor en cada columna
[maxVal, maxInd] = max(A)   % Encuentra el max valor en cada columna
[indRow, indColumn] = find(A>0.2 & A<0.5);   % Indice de las entradas que satisfacen la condicion
M = [indRow'; indColumn']
find(A>0.5 & A<0.8)

%% EJERCICIOS 4, 5 Y 6
% Ejercicio 4
secH = 60 * 60;
finDclase = 6 * secH;

tVec = linspace(0,finDclase, 10000);
knowledgeVec =  1 - exp(-tVec /secH);       %vector

% Ejercicio 5
[val, ind] = min (abs(knowledgeVec - 0.5));
halfTime = tVec(ind)

disp(['Conozco 50% despues de ' num2str(halfTime/secH) ' horas']);

% Ejercicio 6
figure
plot(tVec / secH, knowledgeVec);