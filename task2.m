%% cantor p-value
sampleSize = 1e4;
moe = 1e-10;
testNumber = 5;
pValue = zeros(testNumber, 1);
for i = 1:testNumber
    cant = cantrnd(sampleSize, moe);
    [fEmp, x] = ecdf(cant);
    fCant = devil(x, 1, 0, 1);
    dKolm = max(abs(fEmp - fCant));
    pValue(i) = 1 - kolmcdf(dKolm .* sqrt(sampleSize));
end
plot(x, fEmp);
meanP = mean(pValue)
%% symmetry
sampleSize = 1e5;
moe = 1e-10;
testNumber = 10;
pValue = zeros(testNumber, 1);
for i = 1:testNumber
    cant = cantrnd(sampleSize, moe);
    [f1, x1] = ecdf(cant);
    [f2, x2] = ecdf(1 - cant);
    dSmirnov = max(abs(f1 - f2));
    pValue(i) = 1 - kolmcdf(dSmirnov * sqrt(sampleSize / 2));
end
meanP = mean(pValue)
%% scaling
moe = 1e-10;
sampleSize = 1e5;
testNumber = 10;
pValue = zeros(testNumber, 1);
for i = 1:testNumber
    cant = cantrnd(sampleSize, moe);
    [f1, x1] = ecdf(cant(cant <= 1./3));
    [f2, x2] = ecdf(cant ./ 3);
    x1 = x1(2:end);
    x2 = x2(2:end);
    f1 = f1(2:end);
    f2 = f2(2:end);
    % [f2, ~] = ecdf(cant(cant <= 1./3));
    n = size(f1);
    n = n(1);
    m = size(f2);
    m = m(1);
    dSmirnov = max(abs([interp1(x1, f1, x2) - f2; interp1(x2, f2, x1) - f1]));
    pValue(i) = 1 - kolmcdf(dSmirnov * sqrt(sampleSize / 2));
end
meanP = mean(pValue)
%% moments
sampleSize = 1e4;
moe = 1e-6;
testNumber = 10;
eExp = 0.5;
varExp = 1./8;
cantVec = cantrnd(sampleSize, moe);
sN = cumsum(cantVec);
nVec = (1:sampleSize)';
eEmp = sN ./ nVec;
varEmp = cumsum(cantVec.^2) ./ nVec - eEmp .^2;
figure();
plot(nVec, eEmp);
hold on;
plot(nVec, repmat(eExp, sampleSize, 1), '--');
set(gca,'Xscale','log');
grid on;
grid minor;

figure();
plot(nVec, varEmp);
hold on;
plot(nVec, repmat(varExp, sampleSize, 1), '--');
set(gca,'Xscale','log');
grid on;
grid minor;
% ePlot = zeros(testNumber, 1);
% varPlot = zeros(testNumber, 1);
% x = 1:testNumber;
% for i = 1:testNumber
%     cant = cantrnd(sampleSize * 2.^i, moe);
%     eEmp = mean(cant);
%     varEmp = mean(cant.^2) - eEmp.^2;
%     ePlot(i) = abs(eEmp - eExp);
%     varPlot(i) = abs(varEmp - varExp);
% end
% figure();
% plot(x, ePlot);
% grid on;
% figure();
% plot(x, varPlot);
% grid on;
