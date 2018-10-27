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

