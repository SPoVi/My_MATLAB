%% Practica 4

% Parametros
%J=0.01 kg m2; b=0.1 Nm/(rad/s); K=Km=0.01= kg.m2/(A.s2); R=1 Ohm; L=0.5 H
J = 0.01;
b = 0.1;
K = 0.01;
R = 1;
L = 0.5;

% Ejercicio 1 -------------------------------------------
% Funcion de transferencia LA
s = tf('s');
FT_motor = K/((J*s+b)*(L*s+R)+K^2)
zpk(FT_motor) % muestra por pantalla la FT con polos y ceros
step(FT_motor)

%se obtiene por defecto la misma respuesta escalón obtenida anteriormente, 
% y pulsando con el botón derecho sobre la gráfica se puede seleccionar la opción Pole/Zero. 
ltiview(FT_motor)

%Ver si en base a la posición de los polos se podría obtener un modelo simplificado y justificarlo comparando las salidas de ambos modelos. 
% Como tienen una relacion de 5 si se puede obtener un modelo simplificado.
% Quitamos polo en 10.
% Ajustamos la ganacia -> Aplicando escalon unitario a un sistemas -> TVF->
FT_motor_simplificado = 0.2 / (s+2);
ltiview(FT_motor_simplificado)
step(FT_motor)
hold on 
step(FT_motor_simplificado)
hold off



% Ejercicio 2 -------------------------------------------
pole(FT_motor)        % Ubicacion de los polos
sisotool(FT_motor)


