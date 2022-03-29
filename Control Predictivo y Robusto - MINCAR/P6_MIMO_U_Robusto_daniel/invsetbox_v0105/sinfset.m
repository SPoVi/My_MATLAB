function [Sinf,tstar,fd] = sinfset(A,B,X,U,T,tmax,lambda,tol)
% SINFSET Calculates the maximal stabilisable set for a discrete-time LTI system
%
%    Usage: 
%      [Sinf,tstar,fd] = sinfset(A,B,X,U,T,tmax,lambda,tol)
%
%   Inputs:
%      A,B:  The A and B matrices of the system x_{k+1} = Ax_k + Bu_k.
%      X:    State constraints in augmented form.
%      U:    Control constraints in augmented form.
%      T:    Control invariant target set in augmented form.
%      tmax: Maximum number of iterations.
%      lambda: Optional - default set to 1.
%              Contraction factor: 0 < lambda <= 1.
%      tol:    Tolerance for stopping criteria (default 0).
%                Uses ISEQUALSETS to check for finite-determinedness. 
%                Allowed range: tol >= 0
%
%   Outputs:
%     Sinf:  Maximal stabilisable set contained in X.
%     tstar: Determinedness index.
%     fd:    1 if Cinf finitely determined (tstar <= tmax).
%            0 if tstar > tmax
%
%   See also AUG2STD, STD2AUG, KINFSET, CINFSET, K1SET
%
%   Note: Use KINFSET to compute the maximal *robust
%         lambda-contractive stabilisable set. 
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

if nargin <= 7
  tol = [];
end

[Sinf,tstar,fd] = kinfset(A,B,[],X,U,[],T,tmax,lambda,tol);