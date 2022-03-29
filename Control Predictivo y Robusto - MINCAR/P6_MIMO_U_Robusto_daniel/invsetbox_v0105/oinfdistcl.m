function [Oinf,tstar,fd] = oinfdistcl(A,B,E,C,F,W,Y,K,U,tmax)
% OINFDISTCL  Given a state feedback controller, calculates the maximal
%               robust positively invariant set for a discrete-time LTI
%               system with constraints on the input and output, subject
%               to disturbances on the states and outputs
% 
%   Usage:
%     [Oinf,tstar,fd] = oinfdistcl(A,B,E,C,F,W,Y,K,U,tmax)
%
%   Inputs:
%     A,B,E,C,F:  State space matrices of the discrete-time LTI system
%                 x_{k+1} = Ax_k + Bu_k + Ew_k
%                     y_k = Cx_k + Fw_k
%     W:          Disturbance set in augmented form, i.e. w_k \in W.
%     Y:          Output constraints in augmented form, i.e. y_k \in Y.
%     K:          Control feedback matrix, i.e. u_k = K*x_k.
%     U:          Control constraints in augmented form, i.e. u_k \in U
%     tmax:       Maximum number of iterations.
%
%   Outputs:
%     Oinf:  Maximal robust positively invariant set contained in the
%              input-output admissible set.
%     tstar: Determinedness index
%     fd:    1 if Oinf is finitely determined (tstar <= tmax).
%            0 if tstar > tmax.
%
%   See also AUG2STD, STD2AUG, OINFDIST, OINFSET, OINFSETCL, OMIN, KINFSET
%
% Invariant Set Toolbox
% Version 0.10.3, Date: 25/7/2001
% Copyright (c) by Eric Kerrigan

[D,d] = aug2std(U);
[Yl,yr] = aug2std(Y);
	
A = A+B*K;

Y = [Yl                         zeros(size(Yl,1),size(D,2)) yr;
	 zeros(size(D,1),size(Yl,2)) D                          d];

C = [C; 
	 K];

F = [F;
	 zeros(size(K,1),size(F,2))];

[Oinf,tstar,fd] = oinfdist(A,E,C,F,W,Y,tmax);
