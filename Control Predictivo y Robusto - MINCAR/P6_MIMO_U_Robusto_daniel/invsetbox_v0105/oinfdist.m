function [Oinf,tstar,fd] = oinfdist(A,E,C,F,W,Y,tmax)
% OINFDIST  Calculates the maximal robust positively invariant set for a
%             discrete-time LTI system with constraints on the output,
%             subject to disturbances on the states and outputs
% 
%   Usage:
%     [Oinf,tstar,fd] = oinfdist(A,E,C,F,W,Y,tmax)
%
%   Inputs:
%     A,E,C,F:  State space matrices of the discrete-time LTI system
%                 x_{k+1} = Ax_k + Ew_k
%                     y_k = Cx_k + Fw_k
%     W:        Disturbance set in augmented form, i.e. w_k \in W.
%     Y:        Output constraints in augmented form, i.e. y_k \in Y.
%     tmax:     Maximum number of iterations.
%
%   Outputs:
%   Oinf: Maximal robust positively invariant set.
%   tstar: Determinedness index
%   fd:    1 if Oinf is finitely determined (tstar <= tmax).
%          0 if tstar > tmax.
%
%   See also AUG2STD, STD2AUG, OINFDISTCL, OINFSET, OINFSETCL, OMIN
% 
% Invariant Set Toolbox
% Version 0.10, Date: 23/3/2001
% Copyright (c) by Eric Kerrigan

% Reference: I. Kolmanovsky and E.G. Gilbert, "Theory and computation of
% disturbance invariant sets for discrete-time linear systems",
% Mathematical Problems in Engineering: Theory, Methods and
% Applications, Gordon and Breach Publishers, 1998.
%
% Based on Algorithm 6.2

[S,r] = aug2std(Y);
M = length(r);

stop = 0;
fd = 0;

% Step 1

t = 0;
disp(sprintf('\nCalculating O_%d, tmax = %d\n',t,tmax))
r0 = zeros(M,1);
r1 = r0;
i = 1;
while i <= M & stop == 0
  r0(i) = r(i) - support(W,F'*S(i,:)');
  if r0(i) < 0
	stop = 1;
	Oinf = [];
	tstar = 0;	
	fd = 1;
  end
  i = i + 1;
end

H0 = S*C;
g0 = r0;

% Step 2

while t <= tmax & stop == 0

  disp(sprintf('\nCalculating O_%d, tmax = %d\n',t+1,tmax))
  i = 1;
  while i <= M & stop == 0
	r1(i) = r0(i) - support(W,(C*A^t*E)'*S(i,:)');
	if r1(i) < 0
	  stop = 1;
	  Oinf = [];
	  tstar = t+1;	
	  fd = 1;
	end
	i = i + 1;
  end
  
  % Step 3
  
  H = S*C*A^(t+1);
  g = r1;
  
  H1 = H0;
  g1 = g0;
  
  i = 1;
  stop = 1;
  while i <= M & fd == 0
	if ~isredundant([H0;H],[g0;g],length(g0)+i)
	H1 = [H1; H(i,:)];
	g1 = [g1; g(i)];
	stop = 0;
	end
	i = i + 1;
  end
  
  % Step 4


  if (stop == 1 & fd == 0)
	[H0, g0] = remred(H0,g0);
	Oinf = std2aug(H0,g0);
	tstar = t;
	fd = 1;
  end
  
  % Step 5
  
  t = t + 1;
  
  if t > tmax & stop == 0
	[H0, g0] = remred(H0,g0);
	Oinf = std2aug(H0,g0);
	tstar = t-1;
	fd = 0;
  end
  
  r0 = r1;
  H0 = H1;
  g0 = g1;
  
end
