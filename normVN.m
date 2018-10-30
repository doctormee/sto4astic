function [ res ] = normVN( n )
    if (nargin < 1)
        n = 1; % sample size
    end
    if n == 0
        res = [];
        return;
    end;
    m = 2*n; 
    res = [];
    while (length(res) < n)
        tmp = cauchrnd(m, 0, 1);
        for i = 1:m
            tmp(i, 2) = bernrnd(sqrt(exp(1)) ./ 2 .* exp(-tmp(i, 1).^2 ./ 2).*(tmp(i, 1).^2 + 1), 1);
        end
        res = tmp(tmp(:, 2) == 1);
    end
    res = res(1:n);
end

