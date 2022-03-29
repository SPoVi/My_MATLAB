function W = pdiff(U,V,E,remove)
% PDIFF Calculates the Pontryagin difference between polyhedra U and V
% 
%   Usage: 
%     W = pdiff(U,V,E,remove)
%
%   Inputs:
%     U,V:    Polyhdral descriptions of sets in augmented form
%     E:      (optional) If W = pdiff(U,EV) is desired.
%     remove: (optional) 1 to remove redundant constraints in W (default).
%             0 not to remove redundant constraints in W.
%
%   Outputs:
%     W: Pontryagin difference between U and V in augmented form, 
%          i.e. W = {u \in U: u+v \in U, \forall v \in V}.
%
%   See also AUG2STD, STD2AUG, SUPPORT, POLYSUM, REMRED
%
% Invariant Set Toolbox
% Version 0.10, Date: 23/3/2001
% Version 0.10.5, Date: 19/4/2005
% Copyright (c) by Eric Kerrigan

% Reference: I. Kolmanovsky and E.G. Gilbert, "Theory and computation of
% disturbance invariant sets for discrete-time linear systems",
% Mathematical Problems in Engineering: Theory, Methods and
% Applications, Gordon and Breach Publishers, 1998.

[S,r] = aug2std(U); % S = [s1; s2; s3; ...; sN];
[N,m] = size(S);

if nargin >= 3
  if isempty(E)
	E = eye(m);
  end
else
  E = eye(m);
end

if nargin >= 4
  if isempty(remove)
	remove = 1;
  end
else
  remove = 1;
end

if isempty(U)
    error('Input U is empty in PDIFF')
end

if isempty(V)
    error('Input V is empty in PDIFF')
end


w = zeros(N,1);
for i = 1:N
  %disp(sprintf('PDIFF: Step %d of %d',i,N))
  w(i) = r(i) - support(V,E'*S(i,:)');
end

if remove == 1
   [S,w] = remred(S,w);
end

W = std2aug(S,w);

if isemptyset(W)
    W = [];
    warning('Pontryagin difference is empty')
end