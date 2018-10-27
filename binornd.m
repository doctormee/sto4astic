function [ res ] = binornd( n, p, varargin )
    if nargin < 3
        num = 1; %length of the vector
    end
    res = sum(bernrnd(p, [n, varargin{:}]));
end

