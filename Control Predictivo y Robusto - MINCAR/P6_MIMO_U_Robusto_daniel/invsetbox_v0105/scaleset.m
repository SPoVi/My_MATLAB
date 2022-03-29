function Y = scaleset(a,X)
% SCALESET Scales a given polyhedron
%
%   Usage:
%     Y = scaleset(a,X)
%
%   Inputs:
%     X: Polyhedron in augmented form.
%     a: Scalar (a must not be 0).
%
%   Output:
%     Y: Scaled X, i.e. Y = a*X.
%
%   See also AUG2STD, STD2AUG, POLYMAP, TRANSLATE
%
% Invariant Set Toolbox
% Version 0.10, Date: 23/3/2001
% Copyright (c) by Eric Kerrigan

if a == 0
    error('a is not allowed to be zero')
  else
    [R,s] = aug2std(X); 
    Y = std2aug(R/a,s); 
end


