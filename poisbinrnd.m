function [ res ] = poisbinrnd( lambda, moe, varargin )
    if nargin < 1
        lambda = 1;
    end
    if nargin < 2
        moe = 1e-5;
    end
    nTrials = floor(1./ moe);
    res = binornd(nTrials, double(lambda * moe), varargin{:});
end

