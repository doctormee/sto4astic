function [ res ] = binornd( n, p, varargin )
    if nargin < 3
        n = 1; %length of the vector
    end
    res = sum(bernrnd(p, [n, varargin{:}]));
    sz = [varargin{:}];
    if nargin < 4
        sz = [sz, 1]; %not enough dimensions 
    end
    res = reshape(res, sz);
end

