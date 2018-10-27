function [res] = cantrnd(n, moe)
    if nargin < 1
        n = 1; % size of set 
    end
    if nargin < 2
        moe = 1e-10; % margin of error
    end
    m = round(-log(moe)/log(3));
    bern = bernrnd(0.5,n,m);
    deg = -(1:m)';
    res = 2 * bern * 3.^deg;
end