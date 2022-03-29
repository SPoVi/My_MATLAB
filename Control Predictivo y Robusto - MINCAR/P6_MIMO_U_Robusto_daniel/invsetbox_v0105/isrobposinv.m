function fval = isrobposinv(A,E,X,W)
% ISROBPOSINV True if a polyhedron is robust positively invariant
%              for a given discrete-time LTI system with disturbances on
%              the states
% 
%   Usage:
%     fval = isrobposinv(A,E,X,W)
%
%   Inputs:
%     A,E:  State space matrices of the discrete-time LTI system
%                 x_{k+1} = Ax_k + Ew_k
%     X:    Polyhedron to be checked in augmented form.
%     W:    Disturbance set in augmented form, i.e. w_k \in W.
%
%   Outputs:
%     fval:  1 if X is robust positively invariant.
%            0 if X is not robust positively invariant.
%
%   See also AUG2STD, STD2AUG, ISPOSINV, ISPOSINVCL, ISCTRLINV, ISROBCTRLINV
%
% Invariant Set Toolbox
% Version 0.10.4, Date: 10/8/2001
% Copyright (c) by Eric Kerrigan

% Reference: I. Kolmanovsky and E.G. Gilbert, "Theory and computation of
% disturbance invariant sets for discrete-time linear systems",
% Mathematical Problems in Engineering: Theory, Methods and
% Applications, Gordon and Breach Publishers, 1998.
%
% Based on test in Equation 3.2

[S,r] = aug2std(X);
N = length(r);

fval = 1;
%stop = 0;
i  = 1;
while fval == 1 & i <= N
%while stop == 0 & i <= N
%  disp(sprintf('Checking if d-invariant: step %d of %d',i,N))
  [dummy,F] = lpsolver(-S(i,:)*A,S,r);
  F = -F;
  if F - eps > r(i) - support(W,E'*S(i,:)') % MOD 10/8/01
	%stop = 1;
	fval = 0;
  end
  i = i + 1;
end




