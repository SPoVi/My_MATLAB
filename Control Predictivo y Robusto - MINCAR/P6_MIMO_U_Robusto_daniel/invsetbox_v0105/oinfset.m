function [Oinf,tstar,fd] = oinfset(A,X,tmax)
% OINFSET Calculates the maximal positively invariant set for an
%           autonomous discrete-time LTI system
%
%   Usage: 
%     [Oinf,tstar,fd] = oinfset(A,X,tmax)
%
%   Inputs:
%     A: The A matrix of the discrete-time LTI system x_{k+1} = Ax_k.
%     X: State constraints in augmented form.
%     tmax: Maximum number of iterations allowed.
% 
%   Outputs:
%     Oinf:  Maximal positively invariant set contained in X, i.e.
%              Oinf = {x_0 \in X: x_k \in X for all k > 0}.
%     tstar: Determinedness index.
%     fd:    1 if Oinf is finitely determined (tstar <= tmax).
%            0 if Oinf tstar > tmax.
%
%   See also AUG2STD, STD2AUG, ONESTEPAUT, OINFSETCL, OINFDIST, KINFSET
%
%   Note: Oinf is popularly referred to as the maximal output admissible set.
%
% Invariant Set Toolbox
% Version 0.10, Date: 23/3/2001
% Copyright (c) by Eric Kerrigan

% Reference: E.G. Gilbert and K.T. Tan, "Linear systems with state and
% control constraints: The theory and application of maximal output
% admissible sets

[H,h] = aug2std(X);
s = length(h);

% 0_0
HH = H;
hh = h;
t = 0;

fd = 0;
while (fd == 0) & (t+1 <= tmax)
  disp(sprintf('\nCalculating O_%d, tmax = %d',t+1,tmax))
  fd = 1;
  t = t + 1;
  Hnew = H*(A^t);
  for i = 1:s
	if ~isredundant([HH; Hnew(i,:)],[hh; h(i)],length(hh)+1)
      fd = 0; % if new constraint not redundant then not finished yet
      HH = [HH; Hnew(i,:)]; % and add new constraint to previous constraints
      hh = [hh; h(i)];
    end
  end
end

disp(sprintf('\nFinished. Final check for and removal of redundant inequalities...\n'))
[HH,hh] = remred(HH,hh);

Oinf = std2aug(HH,hh);

if fd == 1
  tstar = t-1;
else
  tstar = t;
end