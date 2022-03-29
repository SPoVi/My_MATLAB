function fval = isequalsets(X,Y,tol)
% ISEQUALSETS True if two sets are equal to within a given tolerance
%
%   Usage: 
%     fval = isequalsets(X,Y,tol)
%
%   Inputs:
%     X,Y: Polyhedra in augmented form.
%     tol: Optional tolerance parameter. Default tol=eps.
% 
%   Outputs:
%     fval: 1 if X \subseteq (1+tol)*Y and Y \subseteq (1+tol)*X is true.
%           0 if X \subseteq (1+tol)*Y and Y \subseteq (1+tol)*X is not true.
%
%   See also STD2AUG, AUG2STD, ISSUBSET
%
% Invariant Set Toolbox
% Version 0.10, Date: 23/3/2001
% Copyright (c) by Eric Kerrigan

if nargin >= 3
  if isempty(tol)
    tol = eps;
  end
else
  tol = eps;
end

[rX,cX] = size(X);
[rY,cY] = size(Y);
if rX == rY & cX == cY % if X and Y the same size
  fval = isequal(X,Y);
  if fval == 0 % if isequal failed
    fval = issubset(X,Y,tol,0) & issubset(Y,X,tol,0);
  end
else 
  fval = issubset(X,Y,tol,0) & issubset(Y,X,tol,0);
end