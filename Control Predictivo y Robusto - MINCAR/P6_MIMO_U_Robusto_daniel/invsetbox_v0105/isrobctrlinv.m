function fval = isrobctrlinv(A,B,X,U,E,W,lambda)
% ISROBCTRLINV  True if a polyhedron is robust control invariant
%                 for a given discrete-time LTI system with disturbances on
%                 the inputs and states, subject to polytopic uncertainty
% 
%   Usage:
%     fval = isrobctrlinv(A,B,X,U,E,W,lambda)
%
%   Inputs:
%     A,B,E:   State space matrices of the discrete-time LTI system
%                  x_{k+1} = Ax_k + Bu_k + Ew_k.
%              For polytopic uncertainty in A and B, stack vertices 
%              of uncertainty sets for A and B on top of each other.
%     X:       Polyhedron to be checked in augmented form.
%     W:       Disturbance set in augmented form, i.e. w_k \in W.
%     lambda:  Optional - default set to 1.
%              Contraction factor 0 < lambda <= 1.
%
%   Outputs:
%     fval:  1 if X is robust control invariant (lambda contractive).
%            0 if X is robust control invariant.
%
%   See also AUG2STD, STD2AUG, ISCTRLINV, ISROBPOSINV, ISPOSINV, ISPOSINVCL
%
% Invariant Set Toolbox
% Version 0.10, Date: 23/3/2001
% Copyright (c) by Eric Kerrigan

if nargin >= 7
  if isempty(lambda)
        lambda = 1;
  end
else
  lambda = 1;
end

Q = k1set(A,B,X,U,X,0,lambda,E,W);
fval = issubset(X,Q);


