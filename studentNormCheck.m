function [ res ] = studentNormCheck( ksi1, ksi2, alphaVal )
    sampleSize = length(ksi1);
    if (length(ksi2) ~= sampleSize)
        disp('Not equal samples!');
        res = false;
        return;
    end
    expE1 = mean(ksi1);
    expE2 = mean(ksi2);
    s1 = sum((ksi1 - expE1).^2)/(sampleSize - 1);
    s2 = sum((ksi2 - expE2).^2)/(sampleSize - 1);
    s = sqrt((s1 + s2) ./ sampleSize);
    t = (expE1 - expE2) ./ s;
    degOfFreedom = 2*sampleSize - 2;
    tBound = tinv(1 - alphaVal./2, degOfFreedom);
    if (abs(t) > tBound)
        res = false;
    else
        res = true;
    end
end

