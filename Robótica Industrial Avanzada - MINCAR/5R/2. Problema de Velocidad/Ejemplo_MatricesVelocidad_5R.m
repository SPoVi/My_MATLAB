

% Modelo de velocidad en un robot 5R

%% Par�metros

L1=0.5;
L2=0.5;
l1=0.3;
l2=0.3;
a1=[0;0];
a2=[1; 0];

%% Datos de entrada ==> Posici�n: Todo el problema deber�a ser conocido

qa=[pi/4; 3*pi/4];
X =[0.5000 ; 0.0917];
qna =[-2.7527; -2.8677];


x=X(1);
y=X(2);

qa1=qa(1);
qa2=qa(2);
qna1=qna(1);
qna2=qna(2);


%% Matrices Jacobianas de las cadenas serie Ji ==> Obtenidas por c�lculo simb�lico

%C�lculo de matrices Jqi ==>Script simb�lico
Jq1 =[...
[ - l1*sin(qa1 + qna1) - L1*sin(qa1), -l1*sin(qa1 + qna1)]
[   l1*cos(qa1 + qna1) + L1*cos(qa1),  l1*cos(qa1 + qna1)]
];

Jq2 =[... 
[ - l2*sin(qa2 + qna2) - L2*sin(qa2), -l2*sin(qa2 + qna2)]
[   l2*cos(qa2 + qna2) + L2*cos(qa2),  l2*cos(qa2 + qna2)]
];
 
%C�lculo de matrices Jxi==>Script simb�lico

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

%% C�lculo de Jqa Jqna y Jq: se obtienen reordenando los elementos de Ji. 

% vqa=Jqa*vx, donde Jqa,
Jqa=[J1(1,:); J2(1,:)];

%vqa=Jqa*vx, donde Jqna,

Jqna=[J1(2,:); J2(2,:)];

%vq=[vqa';vqna']'=Jq*vx;

Jq=[Jqa;Jqna];


%% C�lculo de T

% vq=T*vqa

T=[eye(2);Jqna*inv(Jqa)];


%% Problema de velocidad Una vez calculadas las matrices se resuelve todo el problema

%% Datos de entrada==> Velocidad

vqa=[0.1 ; 0.2]

vX=inv(Jqa)*vqa

vqna=Jqna*inv(Jqa)*vqa
