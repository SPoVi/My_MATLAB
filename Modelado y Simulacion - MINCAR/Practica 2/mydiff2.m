function [dx] = mydiff2(t,x)

dx(1) = x(2); 
dx(2) = (-3/(1+t^2))*x(1)-((2*t)/(1+t^2))*x(2)+2/(1+t^2);

dx = [dx(1) dx(2)]'

end


