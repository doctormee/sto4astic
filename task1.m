%% memorylessness
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

%% memorylessness histo
sampleSize = 1e4;
prob = 0.2;
maxLength = 1e3;
stepNumber = 1e1;
drawScale = 20;
n = 1:maxLength;
geomVec = geomrnd(prob, sampleSize);
figure();
nameArray = { 'Normalization', 'BinWidth', 'EdgeColor', 'FaceAlpha', 'FaceColor'};
baseValueArray = {'probability',1, 'black', .9, 'red'};
valueArray = {'probability',.5, 'black',.45, 'cyan'};
hBase = histogram(geomVec);
set(hBase, nameArray, baseValueArray);
hold on;
for (m = linspace(1, maxLength, stepNumber))
    shiftedVec = geomVec(geomVec >= m) - m;
    if ~isempty(shiftedVec)
        hNew = histogram(shiftedVec);
        set(hNew, nameArray, valueArray);
    end
end
xlim([0, drawScale]);
%% heads or tails
size = 1000;
Y = cumsum(2*bernrnd(1./2, size) - 1);
figure();
plot(1:size, Y ./ sqrt(size));
grid on;