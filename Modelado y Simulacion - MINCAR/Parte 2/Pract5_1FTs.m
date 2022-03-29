M1 = 2500;
M2 = 320;
K1 = 80000;
K2 = 500000;
b1 = 350;
b2 = 15020;

s = tf('s');
G1 = ((M1+M2)*s^2+b2*s+K2)/((M1*M2*s^4)+(M1*b2+M2*b1+M1*b1)*s^3+(M1*K2+b2*b1+M2*K1+M1*K1)*s^2+(K2*b1+b2*K1)*s+K1*K2)
G2 = (-M1*b2*s^3-M1*K2*s^2)/((M1*M2*s^4)+(M1*b2+M2*b1+M1*b1)*s^3+(M1*K2+b2*b1+M2*K1+M1*K1)*s^2+(K2*b1+b2*K1)*s+K1*K2)


den=[(M1*M2) (M1*(b1+b2))+(M2*b1) (M1*(K1+K2))+(M2*K1)+(b1*b2) (b1*K2)+(b2*K1) K1*K2];
R=roots(den)