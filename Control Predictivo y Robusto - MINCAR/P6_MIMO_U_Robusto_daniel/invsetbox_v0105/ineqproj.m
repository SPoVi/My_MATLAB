function P = ineqproj(Z,n)
% INEQPROJ Projects a multi-dimensional polyhedron onto a subspace 
%             using Fourier-Motzkin elimination
% 
% Usage: 
%   P = ineqproj(Z,n)
%
% Inputs:
%   X: Polyhedron Z = {z \in \Real^{n+m}: Az <= b} in augmented form [A b],
%        which is set up such that Gx + Hu <= b, with x \in \Real^n
%        u \in \Real^m, A = [G H] and z = [x; u].
%   n: Dimension of the subspace onto which the polyhedron is being projected.
%
% Output:
%   P: Projection of Z onto an n-dimensional subspace, in augmented, i.e.
%         P = {x \in \Real^n: \exists u \in \Real^m such that A * [x' u']' <= b}.
%
% See also STD2AUG, AUG2STD, REMRED
%
% Invariant Set Toolbox
% Version 0.10, Date: 23/3/2001
% Copyright (c) by Eric Kerrigan

% This routine uses a modified version of the Fourier-Motzkin elimination
% method: Reference: S.S. Keerthi and E.G. Gilbert, "Computation of
% minimum-time feedback control laws for discrete-time systems with
% state-control constraints", IEEE Transactions on Automatic Control,
% vol. AC-32, no.5, May 1987, pp 432-435.

[A,b] = aug2std(Z);

[s,m] = size(A);
m = m - n; % n+m: dimension of polyhedron Z
           % n  : dimension of projection subspace

P = Z;		   
% Remove u variables one by one
for i = 1:m
  disp(sprintf('Projecting onto subspace - step %d of %d. Busy...',i,m))
  P = ineqprojone(P);
%  if ~isempty(P) & isillcon(P)
%	if is0inint(P)
%	  P = normalise(P);
%	  warning('*Normalising - entries for polyhedron ill-conditioned*')
%	end
%  end
end

return % end of INEQPROJ main routine

function P = ineqprojone(Z)
% INEQPROJONE Projects an (n+1)-dimensional polyhedron onto the n-dimensional subspace
%
% Usage: 
%   P = ineqprojone(Z)
%
% Inputs:
%   X: Polyhedron Z = {z \in \Real^{n+1}: Az <= b} in augmented form 
%        [A b], which is set up such that it can be transformed into the
%        inequalities Gx + Hu + g <= 0, with x \in \Real^n, u \in \Real,
%        A = [G H] and z = [x; u]. 
%
% Output:
%   P: Projection of Z onto the n-dimensional x subspace, in augmented
%        form [Q q], where P = {x \in \Real^n: Qx <= q}.
%
% See also STD2AUG, AUG2STD, REMRED
%
% Invariant Set Toolbox
% Version 0.10, Date: 23/3/2001
% Copyright (c) by Eric Kerrigan

% This routine uses a modified version of the Fourier-Motzkin elimination
% method: Reference: S.S. Keerthi and E.G. Gilbert, "Computation of
% minimum-time feedback control laws for discrete-time systems with
% state-control constraints", IEEE Transactions on Automatic Control,
% vol. AC-32, no.5, May 1987, pp 432-435.

[A,b] = aug2std(Z);

[s,n] = size(A); % s = number of constraints
n = n - 1;       % n = dimension of projection subspace

% given Az <= b, with z \in \Real^{n+1},
% transform to Gx + Hu + g <= 0, with x \in \Real^n, u \in \Real.

% A = [G H]
[G,H] = aug2std(A);
g = -b;

% Step 1

I0 = [];     % set of indices to elements of H which are zero
Iplus = [];  % set of indices to elements of H which are positive
Iminus = []; % set of indices to elements of H which are negative

for i = 1:s
  if H(i) == 0
    I0 = [I0;i];
  elseif H(i) > 0
    Iplus = [Iplus;i];
  elseif H(i) < 0
    Iminus = [Iminus;i];
  end
end

s0 = length(I0);        % cardinality of I0
splus = length(Iplus);   % cardinality of Iplus
sminus = length(Iminus); % cardinality of Iminus

% Step 2

% r = s0 + splus * sminus is the number of inequalities in the projection

C = [G g];
D = []; % D = [Q -q]

for i = 1:s0
  D = [D; C(I0(i),:)];
end

for i = 1:splus
  for j = 1:sminus
    D = [D; H(Iplus(i))*C(Iminus(j),:) - H(Iminus(j))*C(Iplus(i),:)];
  end
end

% returns Qx <= q

Q  = D(:,1:end-1);
q  = -D(:,end);

% Step 3
disp('Done with projection.')
[Q,q] = remred(Q,q); % remove redundant inequalities

P = std2aug(Q,q);

return % end of INEQPROJONE