function V = translate(a,U)
% TRANSLATE Performs a linear translation of a polyhedron
%
%   Usage:
%     V = translate(a,U)
%   
%   Inputs:
%     a:      Offset vector.
%     U:      Polyhedron in augmented form.
%
%   Outputs:
%     V: Translated polyhedron:
%            V = {a} + U
%
%   See also STD2AUG, AUG2STD, POLYMAP, SCALESET, SUMPOLY
%
% Invariant Set Toolbox
% Version 0.10, Date: 23/3/2001
% Copyright (c) by Eric Kerrigan

[G,h]=aug2std(U);

% V = {v: G*(v-a) <= h} =  {v: Gv <= h+G*a}

V = std2aug(G,h+G*a);