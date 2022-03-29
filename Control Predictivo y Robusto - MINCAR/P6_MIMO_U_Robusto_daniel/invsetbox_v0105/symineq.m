function X = symineq(ub)
% SYMINEQ Converts bounds on variables to symmetric upper and lower bounds 
% 
%   Usage: 
%     X = symineq(bounds)
%
%   Inputs:
%     bounds: Bounds on x, where -bounds <= x <= bounds.
%
%   Output:
%     X: Equivalent polyhedron in augmented form.
%
%   See also STD2AUG, AUG2STD, DEFINEQ
%
% Invariant Set Toolbox
% Version 0.10, Date: 23/3/2001
% Copyright (c) by Eric Kerrigan

X = defineq(-abs(ub),abs(ub));