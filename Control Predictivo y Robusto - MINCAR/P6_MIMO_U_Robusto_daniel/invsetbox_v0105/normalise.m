function U = normalise(V)
% NORMALISE Normalises a polyhedron in augmented form
%
%   Usage:
%     U = normalise(V)
%
%   Inputs:
%     V: Polyhedron in augmented form [A b] with 0 in interior.
%
%   Outputs:
%     U: Normalised polyhedron in augmented form [G 1].
%
% See also AUG2STD, STD2AUG, IS0ININT
%
% Invariant Set Toolbox
% Version 0.10, Date: 23/3/2001
% Copyright (c) by Eric Kerrigan

U = V;
[rU,cU] = size(U);

if is0inint(V)
  for i = 1:rU
    U(i,:) = U(i,:)./U(i,cU);
  end
else
  error('The origin is not in the interior');
end

