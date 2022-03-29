%% Práctica 2 - CPyR 
% Autor :               Sergio Pons
% Fecha creacion:       24/11/2020
% Ultima modificacion:  29/11/2020
%% == Limpiar ==
%clear all; close all; clc;

%% == 1. Iniciacion de variables ==
K1 = 1;        % Coeficiente del motor [Nm/V].
K2 = 1;        % Coeficiente del motor [Nm/V].
J1 = 0.001;    % Incercia [kg m2]
J2 = 0.002;    % Incercia [kg m2]
B1 = 0.05;     % Coef. de rozamiento lineal [Nms]
B2 = 0.03;     % Coef. de rozamiento lineal [Nms]
Kl = 10;        % Factor de efecto de carga [Nms/rad]
Kp1 = 0.5;      % Efecto del viento [m]. Pert.
Kp2 = 0.75;     % Efecto del viento [m]. Pert.

% = Matrices en continua =
Ac = [-B1/J1 0 0 0;
      1 0 0 0;
      0 -Kl/J2 -B2/J2 0;
      0 0 1 0];
Bc = [K1/J1 0 Kp1/J1;
      0 0 0;
      0 K2/J2 Kp2/J2;
      0 0 0];
Cc = [0 1 0 0;
      0 0 0 1];
Dc = 0;

%% == 2. Modelo de espacio de estados ==
sc = ss(Ac,Bc,Cc,Dc);

%% == 3. Determinar periodo de discretizacion ==
Td = (J1/B1)/10;     % Tiempo de muestreo 
sd = c2d(sc,Td);

%% == 4. Extraer matrices A,B,C ==
A = sd.a;
Be = sd.b;
C = sd.c;

B = Be(:,1:2);
Dm = Be(:,3);
D = 0;
%% == 5. Codificacion de referenia ==
N = 10000;
Ref = [zeros(1,floor(N/4)) ones(1,N-floor(N/4));
        zeros(1,floor(N/2)) ones(1,N-floor(N/2))];

% = Datos = 
h = 10; % horizonte
hu = 1; % horizonte de control
q = 0.1; % ponderacion de la accion de control. q = q_theta = q_gamma
q = [q 0;
     0 q];
r = 10;  % ponderacion del error  de referencia. r = r_theta = r_gamma
r = [r 0;
     0 r];
% = Matrices de ponderacion = 
[ny,nx] = size(C);
[nx,nu] = size(B);
% Matrices de ponderacion en el horizonte
Q = zeros(hu*nu);
for i = 1:nu:hu*nu
    Q(i:i+nu-1, i:i+nu-1) = q;
end

R = zeros(h*ny);
for i = 1:ny:h*ny
    R(i:i+nu-1, i:i+nu-1) = r;
end
%% == 6. Calculo de matrices G, F, Gp y Fpm ==
[G,Gp,F]=CreateMPC_SSMIMO_hu_Du_Matrices(A,B,C,h,hu);

Fpm=Create_Fpm(A,B,C,Dm,h);

%% == 7. Calculo de la ganancia ==
%SI no hay restricciones, la solución óptima se reduce al cálculo de la ganancia K
K=inv(G'*R*G+Q)*G'*R;
Knu = K(1:nu,:);    % K12

