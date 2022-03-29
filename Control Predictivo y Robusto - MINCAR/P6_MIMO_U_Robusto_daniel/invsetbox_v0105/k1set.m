function K1 = k1set(A,B,X,U,T,cap,lambda,E,W)
% K1SET Calculates the intersection between the robust one-step set
%          and the state constraints to form the robust one-step
%          controllable set.
%
%   Usage: 
%     K1 = k1set(A,B,X,U,T,cap,lambda,E,W)
%   
%   Inputs:
%     A,B,E:  State space matrices of the discrete-time 
%             LTI system x_{k+1} = A*x_k + B*u_k + E*w_k.
%             For polytopic uncertainty, stack vertices 
%             of uncertainty sets for A and B on top of each other.
%             The inclusion of E is optional.
%     X:      State constraints in augmented form.
%     U:      Control constraints in augmented form.
%     T:      Target set in augmented form.
%     cap:    Optional - Intersects one-step set with X.
%             1 if desired that the output be
%               K1 = {x \in X | \exists u \in U: Ax+Bu \in T} (default).
%             0 if desired that the output be
%               K1 = {x \in \Real^n | \exists u \in U: Ax+Bu \in T}.
%     lambda: Optional - default set to 1.
%             Contraction factor 0 < lambda <= 1.
%     W:      Optional - State disturbance set in augmented form
%
%   Outputs: 
%     K1:   Robust one-step controllable set to lambda*T if cap=1.
%           Robust one-step set to lambda*T if cap = 0.
%           
%   See also STD2AUG, AUG2STD, KINFSET, ONESTEPAUT
%
% Invariant Set Toolbox
% Version 0.10.2, Date: 20/7/2001
% Copyright (c) by Eric Kerrigan

% n: number of states
% m: number of inputs
[rA,n]=size(A);
[rB,m]=size(B);

% M: number of models
M = rA/n; % should also be equal to rB/n

if nargin >= 6
  if isempty(cap)
	cap = 1;
  end
else
  cap = 1;
end

if nargin >= 7
  if isempty(lambda)
    lambda = 1;
  end
else
  lambda = 1;
end

if lambda < 1
  T = scaleset(lambda,T);
end

if nargin >= 9
  if ~isempty(W) 
    T = pdiff(T,W,E);
  end
end

if (rA==n) % If [A,B] certain then this method could be faster than
           % projection.
% if 0 % Replace previous if with this statement to disable this method 

  % Q = inv(A) * [T + (-B * U)]
  if m == n & isequal(B,eye(n))
	Q = polysum(T,scaleset(-1,U));
	[Q1,q2] = aug2std(Q);
	Q = std2aug(Q1*A,q2);
  else
	Q = polysum(T,polymap(-B,U));% MOD 20/7/2001 - polymap(inv(A),...) was
                                 % applied here - not necessary - is
                                 % actually also done two lines later!
	[Q1,q2] = aug2std(Q);
	Q = std2aug(Q1*A,q2);
  end
  % Intersect with X
  if cap == 1
	Q = [Q;X];	
  end
  [Q1,q2] = aug2std(Q);
  [Q1,q2] = remred(Q1,q2); % Remove redundant inequalities
  K1 = std2aug(Q1,q2);
  
else % if (A,B) uncertain
  
  [H,h] = aug2std(X);
  rH = length(h);
  
  [D,d] = aug2std(U);
  rD = length(d);

  [S,s] = aug2std(T);

  V = [];
  v = [];

  % Target set constraints for each model in A and B
  for j = 0:M-1
    V = [V; S*A(1+j*n:n+j*n,:) S*B(1+j*n:n+j*n,:)];
	v = [v; s];
  end

  % Add constraints on the control
  V = [V; zeros(rD,n) D ];
  v = [v; d];

  % Intersect with X
  if cap == 1
    V = [V; H  zeros(rH,m)];
    v = [v; h];
  end

  P = std2aug(V,v);

  K1 = ineqproj(P,n); % Projects onto the x subspace by solving
                      % the linear inequalities using the
                      % Fourier-Motzkin elimination method

end




