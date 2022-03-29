function fval = isinvertible(A)
% ISINVERTIBLE True if a given matrix is invertible
% 
% Usage: 
%   fval = isinvertible(A)
%
% Inputs:
%   A: Real matrix
%
% Output:
%   fval: 1 if A is invertible.
%         0 if A is not invertible.
%
% Invariant Set Toolbox
% Version 0.10, Date: 23/3/2001
% Copyright (c) by Eric Kerrigan

[m,n] = size(A);
if n == m
  if det(A) ~= 0
    fval = 1;
  else
	fval = 0;
  end
else
  fval = 0;
end
