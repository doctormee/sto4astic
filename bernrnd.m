function [ res ] = bernrnd( p, varargin )
    if (~isfloat(p) || (p > 1) || (p < 0))
        disp('Error! Probability p must be in [0, 1]');
        return
    end
    sz = [varargin{:}];
    if nargin < 3
        sz = [sz, 1];
    end
    res = double(rand(sz) < p);
end

