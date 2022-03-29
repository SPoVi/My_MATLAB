function fval = isbounded(X,large)
% ISBOUNDED True if a given polyhedron is bounded
%
%   Usage: 
%     fval = isbounded(X,large)
%
%   Inputs:
%     X:     Polyhedron in augmented form.
%     large: (Optional) A large, positive scalar. Default = 1e12.
% 
%   Outputs:
%     fval: 1 if X is bounded.
%           0 if X is not bounded.
%
%   See also STD2AUG, AUG2STD
%
% Invariant Set Toolbox
% Version 0.10.1, Date: 18/07/2001
% Copyright (c) by Eric Kerrigan

if nargin < 2
  large = 1e12;
elseif isempty(large)
  large = 1e12;
else
  large = abs(large);
end

[A,b] = aug2std(X);

n = size(A,2);

[C,d] = aug2std(symineq(2*n*large*ones(n,1)));

A = [A; C];
b = [b; d];

[x,f] = lpsolver(-ones(1,n),A,b);

if f < large*n
  fval = 1;
else
  fval = 0;
end

[x,f] = lpsolver(ones(1,n),A,b);

if f > -large*n
 fval = 1;
else
 fval = 0;
end