%% Plantilla para el cálculo simbólico de las Jacobianas necesarias para el Examen de 19/04/2021
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% NO MODIFICAR
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Variables simbólicas==> ¡TODOS ESCALARES!

syms qa1 qa2 real;
syms qna1 qna2 real;

syms x y real;

syms L1 L2 real;
px=[x;y];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% FIN NO MODIFICAR
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% CODIFICACIÓN AQUÍ DE LOS CÁLCULOS SIMBÓLICOS NECESARIOS
%% Se considera que A0 = [0,0]
EC1 = qa1 + L1*[cos(qna1);sin(qna1)] - [x;y];
EC2 = qa2 + L2*[cos(qna2);sin(qna2)] - [x;y];
q1 = [qa1;qna1]; %Variables articulares de la cadena 1
q2 = [qa2;qna2]; %Variables articulares de la cadena 2
Jq1 = jacobian(EC1, q1);
Jq2 = jacobian(EC2, q2);
Jx1 = jacobian(EC1,px);
Jx2 = jacobian(EC2,px);
J1 = -inv(Jq1)*Jx1;
J2 = -inv(Jq2)*Jx2;
Jqa = [J1(1,:);J2(1,:)]
Jqna = [J1(2,:);J2(2,:)]
T = [eye(2);Jqna*inv(Jqa)]
