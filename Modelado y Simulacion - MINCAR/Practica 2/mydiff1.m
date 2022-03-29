function [dw] = mydiff1(t,w)
a = -(1.2+sin(10*t));
dw = a*w;
end


