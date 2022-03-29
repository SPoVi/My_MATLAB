function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices. 
% 
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% =========================================================================
% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));
         
% Setup some useful variables
m = size(X, 1);
         
% You need to return the following variables correctly 
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the code by working through the
%               following parts.
%
% Part 1: Feedforward the neural network and return the cost in the
%         variable J. After implementing Part 1, you can verify that your
%         cost function computation is correct by verifying the cost
%         computed in ex4.m
%
% Part 2: Implement the backpropagation algorithm to compute the gradients
%         Theta1_grad and Theta2_grad. You should return the partial derivatives of
%         the cost function with respect to Theta1 and Theta2 in Theta1_grad and
%         Theta2_grad, respectively. After implementing Part 2, you can check
%         that your implementation is correct by running checkNNGradients
%
%         Note: The vector y passed into the function is a vector of labels
%               containing values from 1..K. You need to map this vector into a 
%               binary vector of 1's and 0's to be used with the neural network
%               cost function.
%
%         Hint: We recommend implementing backpropagation using a for-loop
%               over the training examples if you are implementing it for the 
%               first time.
%
% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.
%

% ======= 1.3 - Feedforward and Cost Function ============================
% Convert y to matrix
K = length(unique(y));  % number of classes
Y = zeros(K,m);         % 10x5000     

% Recode labels matrix Y as vectors containing only valures 0 or 1.
% Assing 1 to correspongid row for each 500 iters.
% For digit 5, from 2001:2500 column is [0 0 0 0 1 0 0 0 0 0]'
for i = 1:m             % m = 5000
    Y(y(i), i) = 1;
end

% Forward propagation (ex3 predict.m)
A1 = [ones(1,m); X'];    % add BIAS -> column ones 
Z2 = Theta1*A1;
A2 = [ones(1, m); sigmoid(Z2)];
Z3 = Theta2*A2;
A3 = sigmoid(Z3);

% Hypothesis
H = A3;

% Cost Function (mod ex2 costFunction.m)
J = (1/m)*sum(sum(-Y .* log(H) - (1 - Y) .* log(1 - H)));

% ======= 1.4. - Regularized Cost Function ===========================
% Regularization (mod ex2 costFunctionReg.m)
% NOTE: exclude firts column (correspond to BIAS) ->  Theta(:, 2:end)
reg_penalty = sum(sum(Theta1(:, 2:end) .^2)) + sum(sum(Theta2(:, 2:end) .^2));
J = J + (lambda / (2*m)) * reg_penalty;

% ======== 2.3 - BACKPROPAGATION ==========================================
% Backpropagation
D3 = A3 - Y;    % delta 3
aux = Theta2'*D3;
D2 = aux(2:end, :) .* sigmoidGradient(Z2); % Remove first column.

% Gradients unregularized
Theta1_un_grad = (D2 * A1') / m;   
Theta2_un_grad = (D3 * A2') / m;

% Theta1_grad = Theta1_un_grad;
% Theta2_grad = Theta2_un_grad;

% ======== 2.5 - Regularized NN ===========================================
% Regularized gradients
Theta1_grad = Theta1_un_grad + (lambda / m) * Theta1;
Theta2_grad = Theta2_un_grad + (lambda / m) * Theta2;

Theta1_grad(:, 1) = Theta1_un_grad(:, 1);
Theta2_grad(:, 1) = Theta2_un_grad(:, 1);


% =========================================================================

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
