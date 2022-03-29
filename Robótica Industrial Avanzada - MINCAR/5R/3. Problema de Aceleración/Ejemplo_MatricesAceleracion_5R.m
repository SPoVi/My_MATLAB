

%% Problema de aceleración en un robot 5R

%Parámetros

L1=0.5;
L2=0.5;
l1=0.3;
l2=0.3;
a1=[0;0];
a2=[1; 0];

%% Datos de entrada ==> Posición: Todo el problema debería ser conocido

qa=[pi/4; 3*pi/4];
X =[0.5000 ; 0.0917];
qna =[-2.7527; -2.8677];


x=X(1);
y=X(2);

qa1=qa(1);
qa2=qa(2);
qna1=qna(1);
qna2=qna(2);

%% Datos de entrada ==> Velocidad: Todo el problema debería ser conocido

vqa =[ 0.1 ; 0.2];
vX =[ -0.0158; 0.0272];
vqna =[ -0.0292 ; 0.1741];

vqa1=vqa(1);
vqa2=vqa(2);
vx=vX(1);
vy=vX(1);
vqna1=vqna(1);
vqna2=vqna(2);


%% Matrices Jacobianas de las cadenas serie Ji ==> Obtenidas por cálculo simbólico en la problema de velocidad

%Ecuación de velocidad Jqi*vqi+Jxi*vx=0

%Cálculo de matrices Jqxi ==>Script simbólico
Jq1 =[...
[ - l1*sin(qa1 + qna1) - L1*sin(qa1), -l1*sin(qa1 + qna1)]
[   l1*cos(qa1 + qna1) + L1*cos(qa1),  l1*cos(qa1 + qna1)]
];

Jq2 =[... 
[ - l2*sin(qa2 + qna2) - L2*sin(qa2), -l2*sin(qa2 + qna2)]
[   l2*cos(qa2 + qna2) + L2*cos(qa2),  l2*cos(qa2 + qna2)]
];
 
%Cálculo de matrices Ji==>Script simbólico

Jx1 =[... 
[ -1,  0]
[  0, -1]
];

Jx2 =[... 
[ -1,  0]
[  0, -1]
];

% Por tanto, vqi=Ji*vx , si q1=[qa1 qna1] y q2=[qa2 qna2]:

J1=-inv(Jq1)*Jx1;
J2=-inv(Jq2)*Jx2;

%% Cálculo de Jqa Jqna y Jq

%Se obtienen reordenando los elementos de Ji. 


% vqa=Jqa*vx, donde Jqa,
Jqa=[J1(1,:); J2(1,:)];

%vqa=Jqa*vx, donde Jqna,

Jqna=[J1(2,:); J2(2,:)];

%vq=[vqa';vqna']'=Jq*vx;

Jq=[Jqa;Jqna];


%% Cálculo de T

% vq=T*vqa

T=[eye(2);Jqna*inv(Jqa)];


%% Derivadas de las matrices Jacobianas de las cadenas serie dJi==> Cálculo simbólico

%Permiten definir la ecuación de aceleración
%Jq1*aq1+dJq1*vq1+Jx1*ax+dJx1*vx=0

%Matrices dJq1

dJq1 =[... 
[ - vqa1*(l1*cos(qa1 + qna1) + L1*cos(qa1)) - l1*vqna1*cos(qa1 + qna1), -l1*cos(qa1 + qna1)*(vqa1 + vqna1)]
[ - vqa1*(l1*sin(qa1 + qna1) + L1*sin(qa1)) - l1*vqna1*sin(qa1 + qna1), -l1*sin(qa1 + qna1)*(vqa1 + vqna1)]
 ];

dJq2 =[... 
[ - vqa2*(l2*cos(qa2 + qna2) + L2*cos(qna2)) - l2*vqna2*cos(qa2 + qna2), -l2*cos(qa2 + qna2)*(vqa2 + vqna2)]
[ - vqa2*(l2*sin(qa2 + qna2) + L2*sin(qna2)) - l2*vqna2*sin(qa2 + qna2), -l2*sin(qa2 + qna2)*(vqa2 + vqna2)]
];


%Matrices dJxi

dJx1=zeros(2);
dJx2=zeros(2);

%Matrices dJqi

%Esta matriz relaciona aqi=Ji*ax+dJi*vx

dJ1=-inv(Jq1)*(dJx1+dJq1*Jq1);
dJ2=-inv(Jq2)*(dJx2+dJq2*Jq2);

%% Problema de aceleración inverso + variable no articuladas: Cálculo de matrices dJqa, dJqna y dJq

dJqa=[ dJ1(1,:) ; dJ2(1,:) ];
dJqna= [ dJ1(2,:) ; dJ2(2,:) ];
dJq=[dJqa; dJqna];

%% Problema de aceleració directo: Cálculo de matrices dJp y Jp
% aq=Jq*ax+dJq*vx
% aqa=Jqa*ax+dJqa*vx==> ax=inv(Jqa)*aqa-inv(Jqa)*dJqa*vx=inv(Jqa)*aqa-inv(Jqa)*dJqa*inv(Jqa)*vqa
% vx=inv(Jqa)*vqa=Jp=vqa ==> ax=Jp*aqa+dJp*vqa

Jp=inv(Jqa);
dJp= -inv(Jqa)*dJqa*inv(Jqa);

%% Relación de la variables aticulares: Cálculo de dT
dT1=[zeros(2) ; dJqna*inv(Jqa)-Jqna*inv(Jqa)*dJqa*inv(Jqa)]

%% Problema de aceleración

aqa=[0.001; 0.002];

aX=Jp*aqa+dJp*vqa