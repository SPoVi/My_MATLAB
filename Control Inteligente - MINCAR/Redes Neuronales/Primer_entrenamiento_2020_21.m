% Primer_entrenamiento_2020_21.m
%
% Ejemplo básico para entrenar una NARX a partir de las muestras recogidas
% en simulaciones con el sistema a identificar. (simout1, simout2,...)
% Posibles sistemas a simular:
% - SNL1: sim_SNL1.slx
% - SNL5: sim_SNL5.slx
% Lanzar los modelos de SIMULINK, antes de ejecutar este SCRIPT.
%
% Tras un entrenamiento satisfactorio la NARX podrá ser utilizada como
% MODELO NEURONAL del mencionado sistema.

% 30 de septiembre de 2016

%% Preparación de datos de entrenamiento
% Se 
% Seleccion de diferentes datos de entrada de ambos sistemas
time = [0:1:1000]';
inputData = simou1_SNL1(:,1);
targetData = simou1_SNL1(:,2);

% % representar la entrada y salida objetivo del entrenamiento
% figure;
% subplot(2,1,1)
% plot(time,simou1_SNL5(:,1),time,simou2_SNL5(:,1))
% title('Entardas del sistema')
% legend('Sim 1','Sim 2','Sim 3')
% xlabel('Tiempo(s)')
% grid on; 
% subplot(2,1,2)
% plot(time,simout1_SNL5(:,2),time,simout2_SNL5(:,2))
% title('Salidas del sistema')
% legend('Sim 1','Sim 2','Sim 3')
% xlabel('Tiempo(s)')
% grid on; 

% Si los datos han sido recogidos en ARRAY en el Workspace
% se pasa a neural network CELL (formato para trabajar con RNA en MATLAB)
[inputNet,toM] = tonndata(inputData,false,false);
[targetNet,toM] = tonndata(targetData,false,false);


%% Creación de la NARX
% A continuación se define la estructura de la red NARX
inputDelays = 0;        % Retrasos entrada exógena
feedbackDelays = 1:1;     % Retrasos realimentación 
HiddenLayerSize = 6;      % Numero de neuronas por capa oculta

% Creamos la red: 1 realimentación salida; 0 de entrada; 
% Algoritmo de entrenamiento: Levenberg-Maquardt
% Estructura de red: lazo abierto.
net = narxnet(inputDelays,feedbackDelays,HiddenLayerSize,'open','trainlm');
%view(net)

%% Entrenamiento de la NARX

% Para entrenar/utilizar la red preparamos los datos a time series
[x,initialInput,initialLayer,t] = preparets(net,inputNet,{},targetNet);

% Comprobar en net{} los ratios asignados por defecto
% Setup Division of Data for Training, Validation, Testing
%    net.divideParam.trainRatio = 70/100;
%    net.divideParam.valRatio = 15/100;
%    net.divideParam.testRatio = 15/100;

%net.divideFcn = 'divideblock';
net.divideFcn = 'dividerand';
net.divideParam.trainRatio = 75/100;
net.divideParam.valRatio = 15/100;
net.divideParam.testRatio = 10/100;
%entrenamos la red
[net,tr] = train(net,x,t,initialInput,initialLayer);

%% Comprobamos el resultado que nos da la NARX

% Conjunto entrenamiento:

yTrain= net(x,initialInput,initialLayer);

% Se pasan los datos de CELL a Matrix
yF = fromnndata(yTrain,toM, false, false);
performanceTrain = perform(net,t,yTrain);
% Comparación con datos de entrenameinto
figure;
plot(targetData(2:1001));  % Desplazado debido a las realimentaciones en la red
hold on
plot(yF,'r*--')
title('Resultado de los ejemplos APRENDIDOS (evolución temporal)')


%% Prueba de validación

% Realizarla con un nuevo conjunto de datos de simulaciones diferentes.
inputDataV = simou2_SNL1(:,1);   % Variable de entrada al sistema
targetDataV = simou2_SNL1(:,2);  % Variable de salida del sistema

% Si los datos han sido recogidos en ARRAY en el Workspace
% se pasa a neural network CELL (formato para trabajar con RNA en MATLAB)
[inputNetV,toM] = tonndata(inputDataV,false,false);
[targetNetV,toM] = tonndata(targetDataV,false,false);

% Para entrenar/utilizar la red preparamos los datos a time series
[x,initialInputV,initialLayerV,t] = preparets(net,inputNetV,{},targetNetV);

% Ejecución de red
yVali= net(x,initialInputV,initialLayerV);

% Se pasan los datos de CELL a Matrix
yV = fromnndata(yVali,toM, false, false);
performanceVali = perform(net,t,yVali);
% Comparación con datos de entrenameinto
figure;
plot(targetDataV(2:1001)); % Desplazado debido a las realimentaciones en la red
hold on
plot(yV,'b*--')
title('Resultado de los ejemplos VALIDADOS (evolución temporal)')

performanceTrain
performanceVali
% Generamos un modelo de simulink con la red neuronal
NETsimulink = gensim(net)
netsimp = net 
save Complejo net netsimp
%Vector performance

TrainP = [0.0847 0.0252 0.0028 1.8214*10^-4 1.3234*10^-5 2.87*1'^-4 0.0013 6.7877*10^-9 8.8336*10^-8 2.079*10^-9]
ValiP = [0.0175 0.006 0.0013 6.9091*10^-5 3.4611*10^-6 7.512*10^-5 1.3751*10^-4 1.7616*10^-10 1.76*10^-8 6.45*10^-11]
Neuronas = [2 3 4 5 6 7 8 9 15 30]
