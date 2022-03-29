function [X_norm, mu, sigma] = featureNormalize(X)
%FEATURENORMALIZE Normalizes the features in X 
%   FEATURENORMALIZE(X) returns a normalized version of X where
%   the mean value of each feature is 0 and the standard deviation
%   is 1. This is often a good preprocessing step to do when
%   working with learning algorithms.

% You need to set these values correctly
X_norm = X; %47x3
mu = zeros(1, size(X, 2)); %1x3
sigma = zeros(1, size(X, 2)); %1x3

% ====================== YOUR CODE HERE ======================
% Instructions: First, for each feature dimension, compute the mean
%               of the feature and subtract it from the dataset,
%               storing the mean value in mu. Next, compute the 
%               standard deviation of each feature and divide
%               each feature by it's standard deviation, storing
%               the standard deviation in sigma. 
%
%               Note that X is a matrix where each column is a 
%               feature and each row is an example. You need 
%               to perform the normalization separately for 
%               each feature. 
%
% Hint: You might find the 'mean' and 'std' functions useful.
%       


mu = mean(X);
sigma = std(X);
X_norm = (X- mu)./sigma;

% % Column vector of all-ones
% column_ones = ones(size(X,1),1);
% 
% % Every row of the matrix will be identical
% mu_matrix = mu.*column_ones;
% sigma_matrix = sigma.*column_ones;
% 
% % Substract mu matrix from X
% X_norm = X_norm - mu_matrix;
% % Divide element-wise by sigma matrix
% X_norm = X_norm./sigma_matrix;



% ============================================================

end
