%% Plantilla para el cálculo simbólico de las Jacobianas necesarias para el Examen de 19/04/2021
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% NO MODIFICAR
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Variables simbólicas==> ¡TODOS ESCALARES!

syms qa1 qa2 real;
syms qna1 qna2 real;

syms x y real;

syms L1 L2 real;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% FIN NO MODIFICAR
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% CODIFICACIÓN AQUÍ DE LOS CÁLCULOS SIMBÓLICOS NECESARIOS

X = [x; y];
q1 = [qa1; qna1];
q2 = [qa2; qna2];

% Ecuaciones de cierre
EC1 = [qa1; 0] + L1 * [cos(qna1); sin(qna1)] - [x; y]; 
EC2 = [qa2; 0] + L2 * [cos(qna2); sin(qna2)] - [x; y];

Jxq1 = jacobian(EC1,X);	
Jxq2 = jacobian(EC2,X);

Jq1 = jacobian(EC1,q1);
Jq2 = jacobian(EC2,q2);	

J1 = -inv(Jq1) * Jxq1;
J2 = -inv(Jq2) * Jxq2;

% Jacobiana de articulaciones actuadas
Jqa = [J1(1,:); J2(1,:)];

% Jacobiana de articulaciones no actuadas
Jqna = [J1(2,:); J2(2,:)];

% Matriz T
T = [1 0; 0 1; Jqna * inv(Jqa)];


