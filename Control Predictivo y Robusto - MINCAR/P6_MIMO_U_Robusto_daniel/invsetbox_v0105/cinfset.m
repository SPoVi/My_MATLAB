function [Cinf,tstar,fd] = cinfset(A,B,X,U,tmax,lambda,tol)
% CINFSET Calculates the maximal lambda-contractive set for a discrete-time LTI system
%
%    Usage: 
%      [Cinf,tstar,fd] = cinfset(A,B,X,U,tmax,lambda,tol)
%
%   Inputs:
%      A,B:    The A and B matrices of the system x_{k+1} = Ax_k + Bu_k.
%      X:      State constraints in augmented form.
%      U:      Control constraints in augmented form.
%      tmax:   Maximum number of iterations.
%      lambda: Optional - default set to 1.
%              Contraction factor: 0 < lambda <= 1.
%      tol:    Tolerance for stopping criteria (Default []). 
%                Allowed range: 0 <= tol < 1-lambda.              
%                If tol >= 0, then stops when set is (lambda+tol)-contractive.
%                If tol == [], then ISEQUALSETS is used to check for
%                  finite determinedness.
%
%   Outputs:
%     Cinf:  Maximal lambda-contractive set contained in X.
%     tstar: Determinedness index.
%     fd:    1 if Cinf is finitely determined (tstar <= tmax).
%            0 if tstar > tmax
%
%   See also AUG2STD, STD2AUG, KINFSET, SINFSET, K1SET
%
%   Note: Choose T = X in KINFSET to compute the maximal *robust*
%         lambda-contractive set. 
%
% Invariant Set Toolbox
% Version 0.10, Date: 23/3/2001
% Copyright (c) by Eric Kerrigan

if nargin >= 6
  if isempty(lambda)
    lambda = 1;
  end
else
  lambda = 1;
end

if nargin <= 6
  tol = [];
end

[Cinf,tstar,fd] = kinfset(A,B,[],X,U,[],X,tmax,lambda,tol); % T = X