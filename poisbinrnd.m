function [ res ] = poisbinrnd( lambda, moe, varargin )
    if nargin < 1
        lambda = 1;
    end
    if nargin < 2
        moe = 1e-5;
    end
    nTrials = floor(1./ moe);
    memoryConst = 1e4;
    step = floor(nTrials / memoryConst);
    res = [];
    for i = 1:step
        res = [res; binornd(memoryConst, double(lambda * moe), [varargin{:}])];
    end;
    modula = mod(nTrials, memoryConst);
    if (modula ~= 0);
    res = [res; binornd(modula, double(lambda * moe), [varargin{:}])];

end

