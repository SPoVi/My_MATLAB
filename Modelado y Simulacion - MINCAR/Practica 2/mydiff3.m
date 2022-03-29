function [dx] = mydiff3(t,x,param)
b=param(1);
p=param(2);
dx=b*x-p*x^2;
end