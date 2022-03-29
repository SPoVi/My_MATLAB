Kt=3;
Gvel=5000/(s^2+1020*s+20000+5000*Kt);


close all

rlocus(1/s*(Gvel))
sisotool(1/s*(Gvel))

%%
close all
rlocus(Gpos*(s+1000)*(s+20)/s)
title('Lugar de las raíces')
xlabel('Re');
ylabel('Im');