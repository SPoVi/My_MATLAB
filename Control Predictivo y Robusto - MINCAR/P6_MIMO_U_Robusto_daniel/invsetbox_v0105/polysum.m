function Z = polysum(X,Y)
% POLYSUM Minkowski (vector) sum of two polyhedra
%
%   Usage:
%     Z = polysum(X,Y)
%  
%   Inputs:
%     X,Y:    Two polyhedra in augmented form.
%
%   Outputs:
%     Z: Sum of polyhedra in augmented form:
%           Z = {z| \exists x \in X, y \in Y: z = x + y}
%
%   See also STD2AUG, AUG2STD, PDIFF, INEQPROJ
%
% WARNING: Uses a highly experimental fast method for 2D polyhedra! 
%          Slower, Fourier elimination-based method used for higher dimensions.
%
% Invariant Set Toolbox
% Version 0.10, Date: 23/3/2001
% Copyright (c) by Eric Kerrigan

[nrows,ncols] = size(X);

if ncols == 3 % If polyhedra are in 2D - then use a faster method. Disable
              % this feature if desired. This method is based on the
              % conjecture that the normals of the faces of the Minkowski
              % sum Z is a subset of the normals of the faces of X and Y. So
              % far no counterexample has been found by the author.
			  
% if 0        % Replace previous if statement with this line to disable.

%disp(['CAUTION: Fast code for 2D polyhedra in POLYSUM is highly experimental'])

remove = 1;

[X1,x2]=aug2std(X);
rX = length(x2);
[Y1,y2]=aug2std(Y);
rY = length(y2);

G = [X1; Y1];
h = [x2; y2];

for i = 1:rX
  h(i) = h(i) + support(Y,G(i,:));
end

for i = rX+1:rX+rY
  h(i) = h(i) + support(X,G(i,:));
end

if remove == 1
  [G,h] = remred(G,h);
end

Z = std2aug(G,h);

else % Guaranteed to work for all dimensions
  
  [H,h] = aug2std(X);
  [G,g] = aug2std(Y);
  
  [rH,cH] = size(H);
  [rG,cG] = size(G);
  
  D = [H            -H;
	   zeros(rG,cH)  G  ];
  d = [h;
	   g];
  
  % The Minkowski sum is the projection of 
  % {(z,x,y) : z = x + y, x \in X, y \in Y} onto the first coordinate. By
  % rearranging x = z - y and substituting it back in, it can be seen that this
  % is equivalent to projecting V = {(z,y) : z - y \in X, y \in Y} onto the
  % first coordinate.
  
  V = std2aug(D,d); 
  
  Z = ineqproj(V,cH);
  
end