function [res] = cauchrnd(n, x0, gamma)
    if nargin < 1
        n = 1; % size of set 
    end
    if nargin < 2
        x0 = 0; % shift
    end
    if nargin < 3
        gamma = 1; % scale
    end
    res = repmat(x0, n, 1) + gamma * tan(pi*double((rand(n, 1) - 1./2)));
end