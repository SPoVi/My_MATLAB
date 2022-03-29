function [Oinf,tstar,fd] = oinfsetcl(A,B,X,U,K,tmax)
% OINFSETCL Calculates the maximal positively invariant set for a
%             non-autonomous discrete-time LTI system in closed-loop with
%             a controller and constraints on the control
% 
%   Usage: 
%     [Oinf,tstar,fd] = oinfsetcl(A,B,X,U,K,tmax)
%
%   Inputs:
%     A,B:  State space A and B matrices of the discrete-time LTI system.
%     X:    State constraints in augmented form.
%     U:    Control constraints in augmented form.
%     K:    State feedback control matrix u_k = Kx_k.
%     tmax: Maximum number of iterations.
%
%   Outputs:
%     Oinf: Maximal positively invariant set for the closed-loop system
%             x_{k+1} = (A+BK)x_k contained in the input-admissible
%             subset of X, i.e. 
%             Oinf = {x_k: x_k \in X, Kx_k \in U for all k >= 0}.
%     tstar: Determinedness index
%     fd:    1 if Oinf is finitely determined (tstar <= tmax).
%            0 if tstar > tmax.
%
%   See also AUG2STD, STD2AUG, ONESTEPAUT, OINFSET, OINFDIST, KINFSET
%
%   Note: Oinf is popularly referred to as the maximal output admissible set.
%
% Invariant Set Toolbox
% Version 0.10, Date: 23/3/2001
% Copyright (c) by Eric Kerrigan

[D,d] = aug2std(U);

[Oinf,tstar,fd] = oinfset(A+B*K,[X; D*K d],tmax);
