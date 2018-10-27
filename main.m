%%memorylessness
sampleSize = 100000;
prob = 0.2;
maxLength = 10000;
maxShift = maxLength ./ 2;
step = 5;
n = 1:maxLength;
geomVec = geomrnd(prob, sampleSize);
figure();
[fBase, n] = ecdf(geomVec);
plot(n, fBase, 'Color', 'red', 'LineWidth', 5.0);
hold on;
for (m = 1:step:maxShift)
    shiftedVec = geomVec(geomVec >= m);
    if ~isempty(shiftedVec)
        [fNew, n] = ecdf(shiftedVec - m);
    plot(n, fNew, 'b', 'LineWidth', 0.5);
    end
end
grid on;
%% heads or tails
size = 10.^6;
Y = cumsum(2.*bernrnd(1./2, size) - 1);
figure();
plot(1:size, Y ./ sqrt(size));
grid on;