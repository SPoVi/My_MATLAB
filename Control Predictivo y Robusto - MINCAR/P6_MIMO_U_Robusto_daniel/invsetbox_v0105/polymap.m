function V = polymap(A,U,remove)
% POLYMAP Computes the linear map of a polyhedron
%
%   Usage:
%     V = polymap(A,U,remove)
%   
%   Inputs:
%     A:      Real matrix.
%     U:      Polyhedron in augmented form.
%     remove: (optional) 1 to remove redundant inequalities (default).
%             0 not to remove redundant inequalities.
%
%   Outputs:
%     V: Transformed polyhedron:
%            V = A * U
%
%   See also STD2AUG, AUG2STD, SCALESET, TRANSLATE, INEQPROJ
%
% Invariant Set Toolbox
% Version 0.10, Date: 23/3/2001
% Copyright (c) by Eric Kerrigan

if nargin >= 3
  if isempty(remove)
	remove = 1;
  end
else
  remove = 1;
end


[D1,d2]=aug2std(U);
rD = length(d2);

if 0 % isinvertible(A)
 
  G = D1*inv(A)
  h = d2
   
  [n,m] = size(A);
  if n > 1 & remove == 1
	[G,h] = remred(G,h);
  end
  
  V = std2aug(G,h);
else
  
  % Compute linear map as the projection of the polyhedron
  %  {(v,u): v = Au, u \in U} onto the first coordinate.
  
  [n,m]=size(A);

  G = [eye(n)     -A; 
	   -eye(n)    +A;
	   zeros(rD,n) D1];

  h = [zeros(2*n,1);
	   d2];

  V = ineqproj([G h],n);
end
