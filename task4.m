sampleSize = 1e5; 
x0 = 0;
gamma = 2;
memoryConst = 1e5;
cauchVec = [];
drawScale = 20;
times = floor(sampleSize ./ memoryConst);
for i = 1:times        
    cauchVec = [cauchVec; cauchrnd(memoryConst, x0, gamma)];
end
cauchVec = [cauchVec; cauchrnd(mod(sampleSize, memoryConst), x0, gamma)];

ecdf(cauchVec);
xlim([-drawScale, drawScale]);
ylim([0, 1]);
%% 
sampleSize = 1e5; 
x0 = 0;
gamma = 1;
memoryConst = 1e3;
normVec = [];
times = floor(sampleSize ./ memoryConst);
for i = 1:times        
    normVec = [normVec; normVN(memoryConst)];
end
normVec = [normVec; normVN(mod(sampleSize, memoryConst))];
figure();
normplot(normVec);
%% 
maxSize = 1e3;
times = 1e2;
samplingTimes = 10;
lsp = linspace(1, maxSize, times)';
deltaVN = zeros(times, 1);
deltaP = zeros(times, 1);
for sampleSize = 1:times
    curSize = (sampleSize - 1) * (maxSize / times) + max(mod(sampleSize, maxSize), 1);
    for i = 1:samplingTimes
        [fVN, x] = ecdf(normVN(curSize));
        deltaVN(sampleSize) = deltaVN(sampleSize) + mean(abs(fVN(2:end) - normcdf(x(2:end), 0, 1)));
        [fP, x] = ecdf(normPolar(curSize));
        deltaP(sampleSize) = deltaP(sampleSize) + mean(abs(fP(2:end) - normcdf(x(2:end), 0, 1)));
    end
    deltaVN(sampleSize) = deltaVN(sampleSize) ./ samplingTimes;
    deltaP(sampleSize) = deltaP(sampleSize) ./ samplingTimes;
    
end
figure();
plot(lsp, deltaVN, 'r');
hold on;
plot(lsp, deltaP, 'Color', 'blue');
grid on;
grid minor;
set(gca,'Xscale','log');





