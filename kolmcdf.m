function [ res ] = kolmcdf(x, moe)
    if nargin < 2
        moe = 1e-8;
    end
    maxK = floor(-log(moe));
    if maxK < 1
        maxK = 1;
    end
    k = (1:maxK)';
    [xGrid, kGrid] = meshgrid(x, k);
    res = (1 + 2 * sum((-1).^kGrid .* exp(-2 * kGrid.^2 .* xGrid .^2), 1))';
end

