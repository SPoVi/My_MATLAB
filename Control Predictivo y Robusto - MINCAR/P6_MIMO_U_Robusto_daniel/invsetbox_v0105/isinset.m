function fval = isinset(x,X)
% ISINSET True if a vector is an element of a polyhedron 
%
%   Usage: 
%     fval = isinset(x,X)
%
%   Inputs:
%     x: Element to be tested.
%     X: Polyhedron in augmented form.
% 
%   Outputs:
%     fval: 1 if x \in X
%           0 if x \notin X
%
%   See also STD2AUG, AUG2STD
%
% Invariant Set Toolbox
% Version 0.10, Date: 23/3/2001
% Copyright (c) by Eric Kerrigan

x = x(:);
[H,h] = aug2std(X);
N = length(h);

fval = 1;
i = 1;
while i <= N & fval == 1;
  if H(i,:)*x > h(i)
    fval = 0;
  end
  i = i + 1;
end

