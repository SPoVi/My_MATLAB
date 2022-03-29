function fval = issubset(U,V,tol,display)
% ISSUBSET True if polyhedron U is a subset of or equal to polyhedron V
%
%   Usage: 
%     fval = issubset(U,V,tol,display)
%
%   Inputs:
%     U,V:     Polyhedra to be checked in augmented form.
%     tol:     (optional) Tolerance parameter, tol >=0 (default tol=eps).
%              Scales V, i.e. tests for U \subseteq (1+tol)*V
%     display: (optional) 1 to output progress of calculation.
%              0 to suppress progress output (default).
%
%   Output:
%     fval: 1 if U is a subset of or equal to V.
%           0 if U is not a subset of or equal to V.
%
%   See also STD2AUG, AUG2STD, ISEQUALSETS, SCALESET
%
% Invariant Set Toolbox
% Version 0.10, Date: 23/3/2001
% Copyright (c) by Eric Kerrigan

if nargin >= 4
  if isempty(display)
    display = 0;
  end
else
  display = 0;
end

if nargin >= 3
  if isempty(tol)
	tol = eps;
  end
else
  tol = eps;
end

if tol > 0
  V = scaleset(1+tol,V); % Scales V to check whether U \subseteq (1+tol)*V
end

[S,r] = aug2std(V);
N = length(r);

fval = 1;
i = 1;
while i <= N & fval == 1
  if display == 1
    disp(sprintf('ISSUBSET: Testing constraint %d of %d',i,N))
  end
  if support(U,S(i,:)) > r(i)
    fval = 0; % then U not a subset of (1+tol)*V
  end
  i = i + 1;
end