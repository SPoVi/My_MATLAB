function fval = isemptyset(X)
% ISEMPTYSET True if a given polyhedron desribes an empty set
%
%   Usage: 
%     fval = isemptyset(X)
%
%   Inputs:
%     X: Polyhedron in augmented form.
% 
%   Outputs:
%     fval: 1 if X empty set.
%           0 if X not an empty set.
%
%   See also STD2AUG, AUG2STD
%
% Invariant Set Toolbox
% Version 0.10, Date: 23/3/2001
% Copyright (c) by Eric Kerrigan

% Solves the following:
%      min t
%      s.t. Ax <= b + 1t
% t > 0 if and only if Ax <= b is empty.
	 
[A,b] = aug2std(X);
[n,m] = size(A);

A = [-ones(n,1) A; 
	 -1         zeros(1,m)];
b = [b; 1];

f = [1; zeros(m,1)];

x = lpsolver(f,A,b);

if x(1) > 0 
  fval = 1;
else
  fval = 0;
end


	 