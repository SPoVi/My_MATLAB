function R = reach(A,B,E,X,U,W)
% REACH Calculates the reach set of an LTI system
%
%   Usage:
%     R = reach(A,B,E,X,U,W)
%    
%    Inputs:
%      A,B,E:  State space matrices of the discrete-time 
%              LTI system x_{k+1} = Ax_k + Bu_k + Ew_k.
%      X:      Polytope in augmented form.
%      U:      Control constraints in augmented form.
%      W:      (optional) Disturbance set in augmented form, i.e.
%                w_k \in W.
% 
%    Outputs: 
%      R:   Reach set, i.e.
%               x_{k+1} \in A*X + B*U + E*W.
% 
%    See also STD2AUG, AUG2STD, POLYMAP, POLYSUM
% 
% Invariant Set Toolbox
% Version 0.10, Date: 23/3/2001
% Copyright (c) by Eric Kerrigan


if nargin < 6
  W = [];
end

[m,n]=size(B);

%if isinvertible(A)

  R1 = polymap(A,X);
  R2 = polymap(B,U); 
  if isempty(W) | isempty(E)
	 R = polysum(R1,R2);
  else
	 R3 = polymap(E,W);
	 R4 = polysum(R1,R2);
	 R = polysum(R4,R3);
  end
  
%else
  

%[n,q] = size(E);

%[X1,x2]=aug2std(X);
%rX = length(x2);
%[U1,u2]=aug2std(U);
%rU = length(u2);
%[W1,w2]=aug2std(W);
%rW = length(w2);

%G = [eye(n) -A -B -E;
%	 -eye(n) A B E;
%	 zeros(rX,n) X1 zeros(rX,m+q);
%	 zeros(rU,2*n) U1 zeros(rU,q);
%	 zeros(rW,2*n+m) W1];

%h = [zeros(2*n,1);
%	 x2;
%	 d2;
%	 w2];

%R = ineqproj([G h],n);

%end
