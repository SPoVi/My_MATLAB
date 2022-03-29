function fval = isillcon(A,allowed)
% ISILLCON True if a given matrix is ill-conditioned
%
%   Usage:
%    fval = isillcon(A,allowed)
%
%   Inputs: 
%     A:       Matrix to be tested.  
%     allowed: (optional) Allowed ratio of the magnitude of the largest 
%                 to the smallest element in A. Default = 1e10.
%
%   Outputs:
%     fval: 1 if matrix A is ill-conditioned, 0 if not.
%
% Invariant Set Toolbox
% Version 0.10, Date: 23/3/2001
% Copyright (c) by Eric Kerrigan

if nargin < 2
  allowed = 1e10;
end

largest = abs(max(max(A)));
smallest = largest;
[r,c] = size(A);
for i = 1:r
  for j = 1:c
	element = abs(A(i,j));
	if element ~= 0
	  if element < smallest
		smallest = element;
	  end
	end
  end
end

ratio = largest/smallest;

if ratio > allowed
  fval = 1;
else
  fval = 0;
end

