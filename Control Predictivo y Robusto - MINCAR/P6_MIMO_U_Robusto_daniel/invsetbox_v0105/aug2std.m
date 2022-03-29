function [A,b] = aug2std(X)
% AUG2STD Converts polyhedron in augmented form to standard form
%           
%   Usage: 
%     [A,b] = aug2std(X)
%
%   Inputs:
%     X:    Description of polyhedron in augmented form [A b],
%           where X = {x: Ax <= b}.
%
%   Outputs:
%     A,b:  Matrix A and vector b.
%   
%   See also STD2AUG
%
% Invariant Set Toolbox
% Version 0.10, Date: 23/3/2001
% Copyright (c) by Eric Kerrigan

A = X(:,1:end-1);
b = X(:,end);