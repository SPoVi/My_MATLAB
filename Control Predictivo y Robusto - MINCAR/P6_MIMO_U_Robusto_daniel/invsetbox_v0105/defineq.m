function X = defineq(lb,ub)
% DEFINEQ Converts lower and upper bounds on variables to augmented form
% 
%   Usage: 
%     X = defineq(lb,ub)
%
%   Inputs:
%     lb,ub: Lower and upper bounds on x, where lb <= x <= ub.
%
%   Output:
%     X: Equivalent polyhedron in augmented form.
%
%   See also STD2AUG, AUG2STD, SYMINEQ
%
% Invariant Set Toolbox
% Version 0.10, Date: 23/3/2001
% Copyright (c) by Eric Kerrigan

n = length(lb); % number of variables

X = [eye(n)   ub(:)
     -eye(n) -lb(:)];



