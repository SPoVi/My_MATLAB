function Q = onestepaut(A,X)
% ONESTEPAUT One-step set of an autonomous system
%
%   Usage:
%     Q = onestepaut(A,X)
%
%   Inputs:
%     A: The A matrix of the autonomous discrete time 
%          LTI system x_{k+1} = Ax_k. 
%     X: Target polyhedron in augmented form.
%
%   Outputs:
%     Q: Set of states which evolve to X, 
%          i.e. Q = {x \in \Real^n: Ax \in X}.
%
%   See also AUG2STD, STD2AUG, K1SET
%
% Invariant Set Toolbox
% Version 0.10, Date: 23/3/2001
% Copyright (c) by Eric Kerrigan

[H,h] = aug2std(X);

Q = [H*A h];

