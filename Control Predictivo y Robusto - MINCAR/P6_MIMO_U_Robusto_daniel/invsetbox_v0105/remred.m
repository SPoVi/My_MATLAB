function [Anew, bnew, removed] = remred(A,b)
% REMRED Remove redundant inequalities
% 
%   Usage: 
%     [C,d,removed] = remred(A,b)
%
%   Inputs:
%     A,b: The matrix A and vector b of the (possibly) redundant 
%            inequalities Ax <= b.
%
%   Outputs:
%     C,d:     The matrix C and vector d of the non-redundant 
%                inequalities Cx <= d such that {x: Cx <= d} = {x: Ax <= b}.
%     removed: 1 if Ax <= b has redundant inequalities.
%              0 if Ax <= b does not have redundant inequalities.
%
%   See also ISREDUNDANT
%
% Invariant Set Toolbox
% Version 0.10, Date: 23/3/2001
% Copyright (c) by Eric Kerrigan


n = length(b);

Anew = [];
bnew = [];

h = waitbar(0,'Removing redundant constraints...');
i = 1;
while i <= length(b)
  waitbar(i/length(b),h)
  %disp(sprintf('Removing redundant constraints: constraint %d of %d',i,length(b)))
  if ~isredundant(A,b,i) % if not redundant then add to output
    Anew = [Anew; A(i,:)];
    bnew = [bnew; b(i)];
    i = i+1;
  else % if redundant remove redundant row from A and b
    A = [A(1:i-1,:); A(i+1:end,:)];
    b = [b(1:i-1); b(i+1:end)];
  end 
end
close(h)

if length(bnew) == n
  removed = 0;
else
  removed = 1;
end

m = length(bnew);

%disp(sprintf('Removed redundant inequalities.\nBefore = %d, After = %d, Removed = %d\n',n,m,n-m))
