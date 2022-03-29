function [Coste] = CalcularCoste_PI(Xpart)
K1 = 10;
a = 10;
%H = tf([K1], [1 a 0]);         % FT de clase
H = tf([K1], [1 2*a a*a]);          % FT de la planta (modificada)

Kp = Xpart(1);
Ti = Xpart(2);
R = tf([Kp*Ti Kp], [Ti 0]);     % FT del controlador

HLC = feedback(R*H,1);          % Lazo cerrado
resultados = stepinfo(HLC);
te = resultados.SettlingTime;
Mp = resultados.Overshoot;
Coste = Mp;   % Parámetro que se quiere reducir

if ((Kp<0) || (Ti<0) || (te>1))
    Coste = inf;    % Para delimitar la zona de trabajo
end
end