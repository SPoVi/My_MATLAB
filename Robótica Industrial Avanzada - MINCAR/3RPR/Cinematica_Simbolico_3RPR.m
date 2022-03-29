%%%%%%%%%% Modelo Cinemático del robot 3RPR %%%%%%%%%%
%%% Calcula en Simbólico la ecuación de cierre y las jacobianas de
%%% velocidad y aceleración del robot 3RPR

%% Cinemática Simbólico 3RPR

syms qa1 qa2 qa3 real;
syms qna1 qna2 qna3 real;

syms x y  real;
syms tz;

syms vqa1 vqa2 vqa3 real;
syms vqna1 vqna2 vqna3 real;
syms vx vy vtz real;

syms L1 L2 L3 real;

syms OAx1 OAy1 real;
syms OAx2 OAy2 real;
syms OAx3 OAy3 real;

syms d1x d2x d3x real;
syms d1y d2y d3y real;


%% Vectores

px=[x;y];

d1=[d1x ;d1y];
d2=[d2x ;d2y];
d3=[d3x ;d3y];

a1=[OAx1;OAy1]; 
a2=[OAx2;OAy2]; 
a3=[OAx3;OAy3];

vL1=(L1+qa1)*[cos(qna1);sin(qna1)];
vL2=(L2+qa2)*[cos(qna2);sin(qna2)];
vL3=(L3+qa3)*[cos(qna3);sin(qna3)];

%Matriz de rotación en Rz

R=[cos(tz) -sin(tz); sin(tz) cos(tz)];

%% Ecuaciones de cierre vectoriales

V1=a1+vL1-R*d1-px;
V2=a2+vL2-R*d2-px;
V3=a3+vL3-R*d3-px;

EcCierre=[V1;V2;V3];


%% Derivadas para la ecuación EcCierre==> G(x,qr)=0

%Coordenadas de cada pata

q1=[qa1;qna1];
q2=[qa2;qna2];
q3=[qa3;qna3];

qa=[qa1 qa2 qa3]';
qp=[qna1 qna2 qna3]';

qr=[qa;qp];
X=[x;y;tz];

Jq1 = jacobian(V1,q1);
Jx1 = jacobian(V1,X);

Jq2 = jacobian(V2,q2);
Jx2 = jacobian(V2,X);

Jq3 = jacobian(V3,q3);
Jx3 = jacobian(V3,X);

%% Derivadas dJq y dJx
vX=[vx;vy;vtz];
vqa=[vqa1 vqa2 vqa3]';
vqp=[vqna1 vqna2 vqna3]';

vqr=[vqa;vqp];

dJq1 =0;
q_All=[qr;X];
vq_All=[vqr;vX];
for i=1:length(q_All)
    dJq1=dJq1+diff(Jq1,q_All(i))*vq_All(i);
end
dJq1=simplify(dJq1);

dJq2 =0;
for i=1:length(q_All)
    dJq2=dJq2+diff(Jq2,q_All(i))*vq_All(i);
end
dJq2=simplify(dJq2);

dJq3 =0;
for i=1:length(q_All)
    dJq3=dJq3+diff(Jq3,q_All(i))*vq_All(i);
end
dJq3=simplify(dJq3);

dJx1 =0;
for i=1:length(vq_All)
    dJx1=dJx1+diff(Jx1,q_All(i))*vq_All(i);
end
dJx1=simplify(dJx1);

dJx2 =0;
for i=1:length(vq_All)
    dJx2=dJx2+diff(Jx2,q_All(i))*vq_All(i);
end
dJx2=simplify(dJx2);

dJx3 =0;
for i=1:length(vq_All)
    dJx3=dJx3+diff(Jx3,q_All(i))*vq_All(i);
end
dJx3=simplify(dJx3);
