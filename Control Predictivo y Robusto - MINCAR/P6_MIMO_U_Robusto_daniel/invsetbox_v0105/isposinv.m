function fval = isposinv(A,X,display)
% ISPOSINV True if a polyhedron is positively invariant for a
%            given autonomous discrete-time LTI system 
%
%   Usage:
%     fval = isposinv(A,X,display)
%
%   Input:
%     A: The A matrix of the LTI system x_{k+1} = Ax_k.
%     X: Polyhedron in augmented form.
%     display: (optional) 1 to output progress of calculation.
%              0 to suppress outpu (default).
%
%   Output:
%     fval: 1 if X is positively invariant.
%           0 if X is not positively invariant.
%
%   See also STD2AUG, AUG2STD, ISPOSINVCL, ISROBPOSINV, ISCTRLINV, ISROBCTRLINV
%
% Invariant Set Toolbox
% Version 0.10, Date: 23/3/2001
% Copyright (c) by Eric Kerrigan

if nargin >= 3
  if isempty(display)
	display = 0;
  end
else
  display = 0;
end

Q = onestepaut(A,X);
fval = issubset(X,Q,[],display); % Geometric condition for invariance
