function [ res ] = normVN( n )
    if nargin < 1
        n = 1; % sample size
    end
    tmp = cauchrnd(n, 0, 1);
    for i = 1:n
        tmp(i, 2) = bernrnd(sqrt(exp(1)) ./ 2 .* exp(-tmp(i, 1).^2 ./ 2).*(tmp(i, 1).^2 + 1), 1);
    end
    res = tmp(tmp(:, 2) == 1);
end

