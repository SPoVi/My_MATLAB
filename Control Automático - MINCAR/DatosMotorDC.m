%DatosMotorDC

J = 1;
b = 20;
Ra = 1;
La = 1*10^-3;
ka = 5;

s = tf('s');

Garm = (ka) / (La*s + Ra);
Gcar = (1) / (J*s +b);

G = Garm*Gcar;
Gred = 5 / (s+20);

Gpos=G*1/s;