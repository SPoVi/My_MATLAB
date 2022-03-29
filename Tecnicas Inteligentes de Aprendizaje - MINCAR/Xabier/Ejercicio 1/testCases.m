%% Comprobaciones de las funciones (Coursera)

clc
clear
%% Comprobacion funcion computeCost
fprintf("Comprobacion funcion: computeCost\n")
computeCost([1 2; 1 3; 1 4;1 5], [7;6;5;4], [0.1; 0.2])
fprintf("valor deseado 11.9450\n")

computeCost([1 2 3; 1 3 4; 1 4 5; 1 5 6], [7;6;5;4], [0.1; 0.2; 0.3])
fprintf("Valor deseado 7.0175\n")

%% Comprobacion funcion gradientDescent
fprintf("\n\nComprobacion funcion: gradientDescent\n")

[theta J_hist] = gradientDescent([1 5; 1 2; 1 4; 1 5], [1 6 4 2]', [0 0]', 0.01, 1000);
theta
fprintf("Valor de theta deseado: 5.2148 y -0.5733\n")
J_hist(1)
fprintf("Valor de J_hist(1) deseado: 5.9794\n")
J_hist(1000)
fprintf("Valor de J_hist(1000) deseado: 0.85426\n")

%% Comprobacion de funcion featureNormalize()
fprintf("\n\nComprobracion de funcion: featureNormalize()");

[Xn mu sigma] = featureNormalize([1; 2; 3])
fprintf("Valor deseado: Xn = -1; 0; 1     mu = 2    sigma = 1\n")
[Xn mu sigma] = featureNormalize(magic(3))
[Xn mu sigma] = featureNormalize([-ones(1,3); magic(3)])

%% Comprobacion funcion computeCostMulti()
fprintf("\n\nComprobacion de funcion: computeCostMulti()");
X = [2 1 3; 7 1 9; 1 8 1; 3 7 4];
y = [2; 5; 5; 6];
theta_test = [0.4; 0.6; 0.8];
computeCostMulti(X, y, theta_test)
fprintf("Valor deseado: 5.2950")

%% Comprobacion funcion gradientDescentMulti
fprintf("\nComprobacion funcion: gradientDescentMulti()");
X = [2 1 3; 7 1 9; 1 8 1; 3 7 4];
y = [2; 5; 5; 6];
[theta J_hist] = gradientDescentMulti(X, y, zeros(3,1), 0.01, 100);
theta
J_hist(1)
J_hist(end)
fprintf("\nValor deseado: theta = [0.23680; 0.56524; 0.31248]    J_hist(1)=2.8299  J_hist(end)=0.0017196");

%% Comprobacion funcion normalEqn
fprintf("\n\nComprobacion funcion: normalEqn()");
X = [2 1 3; 7 1 9; 1 8 1; 3 7 4];
y = [2; 5; 5; 6];
theta = normalEqn(X,y)
fprintf("\nValores deseados: [0.0083857; 0.5681342; 0.4863732]");
