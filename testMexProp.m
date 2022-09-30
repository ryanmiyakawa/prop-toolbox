obj = [zeros(1, 1500), ones(1, 500), zeros(1, 1500)];

xIdx = linspace(-1, 1, length(obj));
z = 1000; 

lambda = 0.0135;

% observation plane coordinates:
xOut = linspace(-300, 300, 2048);
yIdx = [];


% MATLAB prop:
tStart = tic;
propImg = HFPropC(obj, xIdx, [], [],  xOut, [], z, lambda);
fprintf('MATLAB prop took %0.2f s\n', toc(tStart));

% Mex prop:
tStart = tic;
propImgM = MHFPropC(obj, xIdx, [], [],  xOut, [], z, lambda);
fprintf('Mex prop took %0.2f s\n', toc(tStart));


subplot(2,1,1)
plot(abs(propImg));
title('MATLAB Prop');
subplot(2,1,2)
plot(abs(propImgM));
title('Mex Prop');
