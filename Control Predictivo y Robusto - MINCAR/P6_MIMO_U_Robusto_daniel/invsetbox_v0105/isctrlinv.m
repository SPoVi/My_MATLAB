function fval = isctrlinv(A,B,X,U,lambda)
% ISCTRLINV True if a polyhedron is control invariant for a
%             given non-autonomous discrete-time LTI system
%
%   Usage:
%    fval = isctrlinv(A,B,X,U,lambda)
%
%   Input:
%     A,B:     The A and B matrices of the LTI system x_{k+1} = Ax_k + Bu_k.
%     X:       Polyhedron to be checked in augmented form.
%     U:       Control constraints in augmented form.
%     lambda:  (optional) Contraction factor 0 < lambda <= 1. Default is 1.
%      
%   Output:
%     fval: 1 if X is control invariant (lambda-contractive).
%           0 if X is not control invariant.
%
%   See also STD2AUG, AUG2STD, ISROBCTRLINV, ISROBPOSINV, ISPOSINV, ISPOSINVCL
%
% Invariant Set Toolbox
% Version 0.10, Date: 23/3/2001
% Copyright (c) by Eric Kerrigan

if nargin >= 5
  if isempty(lambda)
	lambda = 1;
  end
else
  lambda = 1;
end

Q = k1set(A,B,X,U,X,0,lambda); % Compute one-step set
fval = issubset(X,Q); % Geometric condition for control invariance
