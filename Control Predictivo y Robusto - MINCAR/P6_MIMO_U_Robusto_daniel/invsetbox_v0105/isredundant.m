function fval = isredundant(A,b,index)
% ISREDUNDANT True if a linear inequality is redundant
%
%   Usage: 
%     fval = isredundant(A,b,i)
%
%   Inputs:
%     A,b: Matrix A and vector b in the inequalities Ax <= b.
%     i:   Index referring to the row in A and b which needs to be
%            checked for redundancy. 
%
%   Outputs:
%     fval: 1 if A_i*x <= b_i is redundant in Ax <= b.
%           0 if A_i*x <= b_i is not redundant in Ax <= b.
%
%   See also REMRED
%
% Invariant Set Toolbox
% Version 0.10, Date: 23/3/2001
% Copyright (c) by Eric Kerrigan


tolerance = 0e-9; % A non-negative number makes it more likely to keep
				  % non-redundant constraints

Arest = [A(1:index-1,:); A(index+1:end,:)];
brest = [b(1:index-1); b(index+1:end)];

f = A(index,:);
n = length(f);

if ~isequal(zeros(1,n),f)

  % calculate the negative of the maximum, i.e. - max f'x = min -f'x
  [x,J] = lpsolver(-f,Arest,(1+tolerance)*brest);
  %[x,J] = lpsolver(-f,Arest,brest);  % Alternative
  J = -J; % negate to get maximum
  
  if J <= b(index) 
  %if J <= b(index) - tolerance       % Alternative
	fval = 1; % redundant
  else
    fval = 0; % not redundant
  end

else

  fval = 1;  % 0 <= b_i is redundant (assuming b_i is positive)

end