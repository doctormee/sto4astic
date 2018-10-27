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
sampleSize = 1e4; 
x0 = 0;
gamma = 1;
memoryConst = 1e5;
normVec = [];
drawScale = 5;
procentile = .9999;
times = floor(sampleSize ./ memoryConst);
for i = 1:times        
    normVec = [normVec; normVN(memoryConst)];
end
normVec = [normVec; normVN(mod(sampleSize, memoryConst))];
figure();
normplot(normVec);