function fval = is0inint(X)
% IS0ININT True if the origin is in the interior of a polyhedron
%
%   Usage: 
%     fval = is0inint(X)
%
%   Inputs:
%     X: Polyhedron in augmented form.
% 
%   Outputs:
%     fval: 1 if 0 \in int{X}
%           0 if 0 \notin int{X}
%
%   See also STD2AUG, AUG2STD
%
% Invariant Set Toolbox
% Version 0.10, Date: 23/3/2001
% Copyright (c) by Eric Kerrigan


[H,h] = aug2std(X);
N = length(h);

fval = 1;
i = 1;
while i <= N & fval == 1;
  if h(i) <= 0
    fval = 0;
  end
  i = i + 1;
end

