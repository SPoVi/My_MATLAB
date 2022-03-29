close all
rlocus(Gpos*(s+20))
title('Lugar de las raíces')
xlabel('Re');
ylabel('Im');
%%
sisotool(Gpos*(20+s)/s)