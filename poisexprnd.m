function [ res ] = poisexprnd( lambda, varargin )
    if nargin < 1
        lambda = 1; % lambda
    end;
    n = 100; %number of trials (for a start)
    expMat = cumsum(exponrnd(lambda, n, varargin{:}));
    while (sum(any(expMat >= 1, 1)) == 0)
        n = n * 10; %need more trials
        expMat = cumsum(exponrnd(lambda, n, varargin{:}));
    end
    [~, res] = max( expMat >= 1 ~=0, [], 1 );
    res = res - 1;
    sz = [varargin{:}];
    if nargin < 3
        sz = [sz, 1]; %not enough dimensions 
    end
    res = reshape(res, sz);
end

