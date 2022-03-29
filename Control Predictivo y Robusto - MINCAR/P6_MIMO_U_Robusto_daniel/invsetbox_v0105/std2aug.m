function X = std2aug(A,b)
% STD2AUG Converts polyhedron description in standard form to augmented form
%           
%   Usage: 
%     X = std2aug(A,b)
%
%   Inputs:
%     A,b:  Matrix A and vector b of the linear inequalities which define
%             the polyhedron X, where X = {x: Ax <= b}.
%
%   Outputs:
%     X:    Description of polyhedron in augmented form [A b].
%
%   See also AUG2STD
%
% Invariant Set Toolbox
% Version 0.10, Date: 23/3/2001
% Copyright (c) by Eric Kerrigan

X = [A b];