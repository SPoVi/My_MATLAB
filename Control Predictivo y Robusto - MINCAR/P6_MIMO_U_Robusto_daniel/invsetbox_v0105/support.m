function fval = support(U,x)
% SUPPORT Calculates the support function of the polyhedron U evaluated at x
% 
%   Usage: 
%     fval = support(U,x)
%
%   Inputs:
%     U: Polyhedron in augmented form.
%     x: Vector at which support function is to be evaluated at.
%
%   Outputs:
%     fval: Value of the support function of U at x, 
%             i.e. fval = \max_u x'*u subject to u \in U
%
%   See also: AUG2STD, STD2AUG
%
% Invariant Set Toolbox
% Version 0.10, Date: 23/3/2001
% Copyright (c) by Eric Kerrigan

% Reference: I. Kolmanovsky and E.G. Gilbert, "Theory and computation of
% disturbance invariant sets for discrete-time linear systems",
% Mathematical Problems in Engineering: Theory, Methods and
% Applications, Gordon and Breach Publishers, 1998.
%
% See Equation 1.11

[S,r] = aug2std(U);

[dummy,fval] = lpsolver(-x(:),S,r);
fval = -fval;