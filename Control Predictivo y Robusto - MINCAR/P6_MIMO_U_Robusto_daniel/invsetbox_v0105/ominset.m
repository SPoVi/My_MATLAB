function [Omin,K] = ominset(A,B,W,X)
% OMINSET   Computes a minimal robustly invariant set.
%   
%   Usage:
%      [Omin,K] = ominset(A,B,W,X)
%
%   Inputs:
%      A,B:  The A and B matrices of the LTI system x_{k+1} = Ax_k + Bu_k + w_k.
%      W:    Polytope of disturbances, i.e. w_k \in W in augmented form.
%      X:    Polytope in which one would like to compute Omin.
%
%   Outputs:
%      Omin: Minimal robustly positively invariant set for the closed-loop system 
%               x_{k+1} = (A+B*K)x_k + w_k
%            contained inside X, where K is a minimm-time control law.
%      K:    Minimum-time control law, i.e. (A+B*K)^n = 0
%
%   See also OINFDIST, OINFDISTCL, OINFSET, OINFSETCL
%
% Invariant Set Toolbox
% Version 0.10.4, Date: 25/09/2002
% Copyright (c) by Eric Kerrigan

[n,m] = size(B);
Wc = ctrb(A,B);
if rank(Wc) == n
  if rank(B) == n
	K = -place(A,B,zeros(n,1)); % minimum-time control law
  else
	K = -[zeros(m,n-1) 1]*inv(Wc)*A^n;
  end
  AK = A+B*K;
  if norm(AK^n,inf) > 1e-9
	error('K is not a minimum-time control law.')
  end
  Omin = W;
  for i = 1:n-1
	Omin = polysum(polymap(AK^i,W),Omin);
  end
  if ~issubset(Omin,X)
	warning('Omin is empty.')
	Omin=[];
  end
else
  error('(A,B) is not reachable.')
end
