function [x,fval,exitflag,output,lambda] = lpsolver(f,A,b,x0)
% LPSOLVER Uses your favourite LP solver
%
%   Usage:
%     [x,fval,exitflag,output,lambda] = lpsolver(f,A,b,x0)


if nargin <= 3
  x0 = [];
end

%[x,fval,exitflag,output,lambda] = linprog(f,A,b,[],[],[],[],x0);
%[x,fval,exitflag,output,lambda] = linprog(f,A,b,[],[],[],[],x0,optimset('Display','off'));
%lambda = lambda.ineqlin;
warning('off','all')
[x,fval,exitflag]=quadprog([],f,A,b,[],[],[],[],x0,optimset('Display','off'));
warning('on','all')

%if exitflag == 0 
%  warning('LPSOLVER reached maximum number of iterations.')
%end

%if exitflag < 0
%  warning('The LP is infeasible.')
%end
