function [ ksi1, ksi2 ] = normPolar( n )
    if (nargin < 1)
        n = 1; % sample size
    end
    if n == 0
        res = [];
        return;
    end;
    alpha1 = rand(n, 1);
    alpha2 = rand(n, 1);
    ksi1 = sqrt(-2*log(alpha1)).*cos(2*pi*alpha2);
    ksi2 = sqrt(-2*log(alpha1)).*sin(2*pi*alpha2);
end

