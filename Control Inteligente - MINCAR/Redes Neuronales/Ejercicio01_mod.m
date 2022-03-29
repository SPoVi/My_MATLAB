%% Ejercicio de entrenamiento de una RNA para mapear una de las variables
%  del espacio de trabajo de un Robot Paralelo 3PRS.
%  La red elegida para su mapeo será una MLP de una capa oculta.
close all; clear all; clc
%% Creación de una red MLP

    numNeuronas = 30;

    MLP_z = feedforwardnet(numNeuronas); 

    %Ratio de entrenamiento
    MLP_z.divideParam.trainRatio = 1;
    %Ratio de validacion
    MLP_z.divideParam.valRatio = 0;
    %Ratio de test
    MLP_z.divideParam.testRatio = 0;
   
    % Reducción del gradiente mínimo (límite de entrenamiento)
    MLP_z.trainParam.min_grad = 1e-10;
    % Objetivo de entrenamiento en relación al error de aprendizaje
    MLP_z.trainParam.goal = 1e-8;
    
        
    % Copiamos red para posteriores modificaciones
    net2 = MLP_z;
    
% == Cargar los ejemplos para el entrenameinto ==
    load('TrainingData_MalladoGrueso.mat');
    
%% Entrenamiento de la MLP
    MLP_z = train(MLP_z,TrainData.TrainingSet.P,TrainData.TrainingSet.Tp(:,:),'showResources','yes');
    % trainedNet = train(net,X,T,Xi,Ai,EW)
    % net : Input network
    % X : Networks inputs
    % T : Networks targets
    % xi: Initial input delay conditions
    % Ai: Initial layer delay conditions
    % EW: Error Weights

%% Validación de la MLP 

    %Propagación de datos de entrada
    out_z = MLP_z(TrainData.TestSet.P);     % vector o matriz
    
    %Cálculo del error cometido en cada punto
    e_z = TrainData.TestSet.Tp(:,:) - out_z;     % vector o matriz
    
    %Extracción del máximo error cometido 
    e_z_max = max(e_z,[],2);                % columna valor        
    
    %Obtención del MSE (Mean Squared Error) de la validación.
    perf_z = perform(MLP_z,out_z,TrainData.TestSet.Tp(:,:));
        % perform(net,t,y,ew) = perform(net,Target data, Output data, Error
        % Wieghts (defalut = 1))
        
    
%% == NET1 : Una sola neurona ==
% == Number of Inputs and Layers ==
net1.numInputs = 1;  % Cambia el numero de entradas
net1.numLayers = 2;  % Cambia el numero de capas
net1.layers{1}.size = 10;  

% == Connections == Bias - Input - Weight - Output
net1.biasConnect = [1; 1];        % indica si la capa tiene bias (1) o no (0)
net1.inputConNect = [1; 0];       % Indica que input esta conectado a que capa
net1.layerConnect = [0 0; 1 0];   % Indica que capa se le conecta. Cada ; es una capa.
net1.outputConnect = [0 1]        % Indica que capas se conectan a la salida

%% Entrenamiento de la NET1
    net1 = train(net1,TrainData.TrainingSet.P,TrainData.TrainingSet.Tp,'showResources','yes');
    % trainedNet = train(net,X,T,Xi,Ai,EW)

view(net1)
%% == NET2: Dos neuronas ==
% == Number of Inputs and Layers ==
net2.numInputs = 1;  % Cambia el numero de entradas
net2.numLayers = 4;  % Cambia el numero de capas

% == Connections == Bias - Input - Weight - Output
net2.biasConnect = [1; 1; 1; 1];                % indica si la capa tiene bias (1) o no (0)
net2.inputConNect = [1; 1; 0; 0];         % Indica que input esta conectado a que capa
net2.layerConnect = [0 0 0 0; 0 0 0 0; 1 0 0 0; 0 1 0 0];   % Indica que capa se le conecta. Cada ; es una capa.
net2.outputConnect = [0 0 1 1]                 % Indica que capas se conectan a la salida

% == Layers ==
net2.layers{1}.name = 'Hidden N1';        % Change name of layer
net2.layers{2}.name = 'Hidden N2';
net2.layers{3}.name = 'Output N1';
net2.layers{4}.name = 'Output N2';

% Layer 2 : Hidden N2
net2.layers{2}.transferFcn = net2.layers{1}.transferFcn;   % Change transfer function
net2.layers{2}.size = 100;                                 % Change number neurons
% Layer 3 : Output N1
net2.layers{3}.transferFcn = net1.layers{2}.transferFcn;
net2.layers{3}.size = 1;
% Layer 4 : Output N2
net2.layers{4}.transferFcn = net1.layers{2}.transferFcn;
net2.layers{4}.size = 2;

view(net2)
%% Entrenamiento de la NET2
    net2= train(net2,TrainData.TrainingSet.P,TrainData.TrainingSet.Tp,'showResources','yes');

%% == Validación de la NET2 ==

    %Propagación de datos de entrada
    out_z = net2(TrainData.TestSet.P); 
    
    %Cálculo del error cometido en cada punto
    e_z = TrainData.TestSet.Tp(1,:) - out_z; 
    
    %Extracción del máximo error cometido 
    e_z_max = max(e_z,[],2);               
    
    %Obtención del MSE (Mean Squared Error) de la validación.
    perf_z = perform(net2,out_z,TrainData.TestSet.Tp(1,:));

% View the architecture
view(net2)
    
%% Plots
% Variables de salida
figure
subplot(3,1,1)
plot(out_z(1,:))
legend('Output Z')
subplot(3,1,2)
plot(out_z(2,:))
legend('Output thetaX')
subplot(3,1,3)
plot(out_z(3,:))
legend('Output thetaY')    