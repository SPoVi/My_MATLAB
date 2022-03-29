function fval = isposinvcl(A,B,X,K,display)
% ISPOSINVCL True if a polyhedron is positively invariant for a given
%              discrete-time LTI system in closed-loop with a controller
%
%   Usage:
%     fval = isposinvcl(A,B,X,K,display)
%
%   Input:
%     A,B:     The A and B matrices of the LTI system x_{k+1} = Ax_k + Bu_k.
%     X:       Polyhedron in augmented form.
%     K:       State feedback matrix of controller, i.e. u_k = Kx_k.
%     display: (optional) 1 to output progress of calculation.
%              0 to suppress progress output (default).
%      
%   Output:
%     fval: 1 if X is positively invariant for the system x_{k+1} = (A+BK)x_k.
%           0 if X is not positively invariant for the system x_{k+1} = (A+BK)x_k.
%
%   See also STD2AUG, AUG2STD, ISPOSINV, ISROBPOSINV, ISCTRLINV, ISROBCTRLINV
%
% Invariant Set Toolbox
% Version 0.10, Date: 23/3/2001
% Copyright (c) by Eric Kerrigan

if nargin >= 5
  if isempty(display)
	display = 0;
  end
else
  display = 0;
end

fval = isposinv(A+B*K,X,display);

