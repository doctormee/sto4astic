function [ res ] = fisherNormCheck( ksi1, ksi2, alphaVal )
    nKsi1 = length(ksi1);
    nKsi2 = length(ksi2);
    expE1 = mean(ksi1);
    expE2 = mean(ksi2);
    s1 = sum((ksi1 - expE1).^2)/(nKsi1 - 1);
    s2 = sum((ksi2 - expE2).^2)/(nKsi2 - 1);
    f = s1 ./ s2;
    fBoundRight = finv(1 - alphaVal ./ 2, nKsi1 - 1, nKsi2 - 1);
    fBoundLeft = finv(alphaVal ./ 2, nKsi1 - 1, nKsi2 - 1);
    if (f > fBoundRight) || ( f < fBoundLeft)
        res = false;
    else
        res = true;
    end
end

