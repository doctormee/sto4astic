function [ res ] = pearsonCheck( n, p, empF, expF, alphaVal )
    % p is a reduction of degrees of freedom parameter
    chiSquare = n*sum((empF(3:end) - empF(2:end-1) - expF(3:end) + expF(2:end-1)).^2 ...
            ./ (expF(3:end) - expF(2:end-1)));
    if chiSquare > chi2inv(1 - alphaVal, n - p)
        res = false;
    else
        res = true;
    end

end

