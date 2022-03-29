function C = intsect(A,B,remove)
% INTSECT Calculates the intersection of two polyhedra
%
%   Usage:
%     C = intsect(A,B,remove)
%
%   Inputs:
%     A,B:    Polyhedron in augmented form.
%     remove: (optional) 1 to remove redundant inequalities (default).
%             0 not to remove redundnant inequalities.
%
%   Outputs:
%     C: Polyhedron C = A \cap B in augmented form.
%           C = [] if the intersection is empty.
%
%   See also AUG2STD, STD2AUG, REMRED
%
% Invariant Set Toolbox
% Version 0.11, Date: 21/4/2001
% Copyright (c) by Eric Kerrigan

if nargin >= 3
  if isempty(remove)
	remove = 1;
  end
else
  remove = 1;
end

if isemptyset([A; B])
    C = [];
else
    [C,d] = aug2std([A; B]);
    
    if remove == 1
        [C,d] = remred(C,d);
    end
    
    C = std2aug(C,d);
end