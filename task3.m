%%memorylessness
sampleSize = 100000;
lambda = 0.2;
maxLength = 10000;
maxShift = maxLength ./ 2;
step = 5;
n = 1:maxLength;
expVec = exponrnd(lambda, sampleSize);
figure();
[fBase, n] = ecdf(expVec);
plot(n, fBase, 'Color', 'red', 'LineWidth', 5.0);
hold on;
for (m = 1:step:maxShift)
    shiftedVec = expVec(expVec >= m);
    if ~isempty(shiftedVec)
        [fNew, n] = ecdf(shiftedVec - m);
        plot(n, fNew, 'b', 'LineWidth', 0.5);
    end
end
grid on;

%% vectors (check wiki for proof that min{x1..xn} is exponentially distributed with l = sum(l_i)
sampleSize = 1e4;
n = 1e2;
lambdaVec = 10 .* rand(n, 1);
expVec = zeros(sampleSize, n);
for i = 1:n
    expVec(:, i) = exponrnd(lambdaVec(i), sampleSize);
end
Y = min(expVec, [], 2)';
[fEmp, x] = ecdf(Y);
plot(x, cdf('Exponential', x, 1./sum(lambdaVec)), 'Color', 'blue', 'LineWidth', 5.0);
hold on;
plot(x, fEmp, 'Color', 'red', 'LineWidth', 2);

%% Pois Exp
sampleSize = 1e2;
lambda = 4;
poisVec = poisexprnd(lambda, sampleSize);
[empF, x] = ecdf(poisVec);
expF = cdf('Poisson', x, lambda);

figure();
plot(x, expF, 'Color', 'red', 'LineWidth', 5.0);
hold on;
plot(x, empF, 'Color', 'blue', 'LineWidth', 2.0);
grid on;
grid minor;
%% PoisBin Pearson
sampleSize = 1e4;
testNumber = 10;
lambda = 4;
moe = 1e-2;
alphaVal = .05;

% 
% clear pValue;
% chi squared
% for i = 1:testNumber
%     poisVec = poisbinrnd(lambda, moe, sampleSize);
%     [empF, x] = ecdf(poisVec);
%     expF = cdf('Poisson', x, lambda);
%     chiSquare = sampleSize*sum((empF(3:end) - empF(2:end-1) - expF(3:end) + expF(2:end-1)).^2 ...
%         ./ (expF(3:end) - expF(2:end-1)));
%     pValue(i) = 1 - cdf('chi2', chiSquare, length(x) - 2);
% end;
% meanP = mean(pValue)

% chi squared
poisVec = poisbinrnd(lambda, moe, sampleSize);
% poisVec = rand(sampleSize, 1);
[empF, x] = ecdf(poisVec);
expF = cdf('Poisson', x, lambda);
chiSquare = sampleSize*sum((empF(3:end) - empF(2:end-1) - expF(3:end) + expF(2:end-1)).^2 ...
        ./ (expF(3:end) - expF(2:end-1)));
if pearsonCheck( sampleSize, 2, empF, expF, alphaVal )
    disp('Passed Pearson test');
else
    disp('Falied Pearson test');
end
    
% figure();
% plot(x, expF, 'Color', 'red', 'LineWidth', 5.0);
% hold on;
% plot(x, empF, 'Color', 'blue', 'LineWidth', 2.0);
% grid on;
% grid minor;
%% Norm Polar
sampleSize = 1e5;
clear ksi1 ksi2;
[ksi1, ksi2] = normPolar(sampleSize);
% ksi1 = normrnd(1, 10.1, sampleSize, 1);
% ksi2 = normrnd(.75, 10, sampleSize, 1);
alphaVal = .05;
% normplot(ksi1);
% normplot(ksi2);
if (studentNormCheck(ksi1, ksi2, alphaVal))
    disp('Passed t-Student test');
else
    disp('Failed t-Student test');
end
if (fisherNormCheck(ksi1, ksi2, alphaVal))
    disp('Passed Fisher test');
else
    disp('Failed Fisher test');
end