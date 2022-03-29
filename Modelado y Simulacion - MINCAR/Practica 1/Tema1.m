finDclase = 6 * secH;
secH = 60 * 60;

% Ejercicio
tVec = linspace(0,finDclase, 10000);
knowledgeVec =  1 - exp(-tVec /secH);

% Ejercicio
[val, ind] = min (abs(knowledgeVec - 0.5));
halfTime = tVec(ind)

disp(['Conozco 50% despues de ' num2str(halfTime/secH) ' horas']);

% Ejercicio
figure
plot(tVec / secPerHour, knowledgeVec);