% From Thomas, 12/11/21

pts=500;

% define input and output from existing variables
inp=touchNNA;
out=positionsA;

% normalise inputs & choose 4500 random samples for training
mu=mean(inp);
sig=std(inp);
P=randperm(length(inp));
XTrain=(inp(P(1:4500),:)-mu)./sig;
YTrain=out(P(1:4500),:);

% final 500 used as normalised validation set
XVal=(inp(P(4500:end),:)-mu)./sig;
YVal=out(P(4500:end),:);

len=size(XTrain,2);

% define network and training options
layers = [
    featureInputLayer(len,"Name","featureinput")
    fullyConnectedLayer(100,"Name","fc_1")
     reluLayer("Name","relu2")
    fullyConnectedLayer(24,"Name","fc_2")
    reluLayer("Name","relu")
        fullyConnectedLayer(8,"Name","fc_33")
    reluLayer("Name","relu3")
    fullyConnectedLayer(3,"Name","fc_3")
    regressionLayer("Name","regressionoutput")];

opts = trainingOptions('adam', ...
    'MaxEpochs',2000, ... % number of training iterations.
    'MiniBatchSize', 512*7,... %%%512
     'ValidationData',{XVal,YVal}, ...
    'ValidationFrequency',30, ...
    'GradientThreshold',10, ...
    'InitialLearnRate',0.005*10, ...
    'LearnRateSchedule','piecewise', ...
    'LearnRateDropPeriod',125*10, ...%%changed
    'LearnRateDropFactor',0.2/1, ...%%
    'Verbose',1, ...
    'Plots','training-progress', 'ExecutionEnvironment', 'gpu');

% Training
[net, ~] = trainNetwork(XTrain,YTrain,layers,opts);

% Calcute 3D error over input data
ypred=predict(net,(inp-mu)./sig);
err=rssq((ypred-out)');

% Calculate error for other datasets without retraining
ypred2=predict(net,(touchNNC-mu)./sig);
ypred3=predict(net,(touchNNF-mu)./sig);
ypred4=predict(net,(touchNNH-mu)./sig);
ypred5=predict(net,(touchNNM-mu)./sig);
err2=rssq((ypred2-positionsC)');
err3=rssq((ypred3-positionsF)');
err4=rssq((ypred4-positionsH)');
err5=rssq((ypred5-positionsM)');

mean(err5) % average error for healed data

% plot these errors
figure;
heatscat(positionsA(:,1),positionsA(:,2),err, 1); title('Original');
heatscat(positionsC(:,1),positionsC(:,2),err2,2); title('Damaged 1');
heatscat(positionsF(:,1),positionsF(:,2),err3,3); title('Healed 1');
heatscat(positionsH(:,1),positionsH(:,2),err4,4); title('Damaged 2');
heatscat(positionsM(:,1),positionsM(:,2),err5,5); title('Healed 2');
sgtitle('Undamaged Training: 24 input');

% transfer learning: copy network but zero first 5 layer learning rates
layers2=net.Layers;
layers2(1:5) = freezeWeights(layers2(1:5));

% new inputs, outputs, normalised training/validation sets for healed
inp=touchNNM;
%inp=touchNNM;
out=positionsM;
P=randperm(length(inp));
XTrain=(inp(P(1:pts),:)-mu)./sig;
YTrain=out(P(1:pts),:);
XVal=(inp(P(4500:end),:)-mu)./sig;
YVal=out(P(4500:end),:);

% train
opts = trainingOptions('adam', ...
    'MaxEpochs',2000, ... % number of training iterations.
    'MiniBatchSize', 512*7,... %%%512
     'ValidationData',{XVal,YVal}, ...
    'ValidationFrequency',30, ...
    'GradientThreshold',10, ...
    'InitialLearnRate',0.005*10, ...
    'LearnRateSchedule','piecewise', ...
    'LearnRateDropPeriod',125*10, ...%%changed
    'LearnRateDropFactor',0.2/1, ...%%
    'Verbose',1, ...
    'Plots','training-progress', 'ExecutionEnvironment', 'gpu');

[net,info] = trainNetwork(XTrain,YTrain,layers2,opts);

% errors when transferred with healed network
ypred=predict(net,(touchNNA-mu)./sig);
ypred2=predict(net,(touchNNC-mu)./sig);
ypred3=predict(net,(touchNNF-mu)./sig);
ypred4=predict(net,(touchNNH-mu)./sig);
ypred5=predict(net,(touchNNM-mu)./sig);
err=rssq((ypred-positionsA)');
err2=rssq((ypred2-positionsC)');
err3=rssq((ypred3-positionsF)');
err4=rssq((ypred4-positionsH)');
err5=rssq((ypred5-positionsM)');

mean(err5) % average error for healed data

% plot results
figure;
heatscat(positionsA(:,1),positionsA(:,2),err, 1); title('Original');
heatscat(positionsC(:,1),positionsC(:,2),err2,2); title('Damaged 1');
heatscat(positionsF(:,1),positionsF(:,2),err3,3); title('Healed 1');
heatscat(positionsH(:,1),positionsH(:,2),err4,4); title('Damaged 2');
heatscat(positionsM(:,1),positionsM(:,2),err5,5); title('Healed 2');
sgtitle('Healed 2 Transfer: 24 input');

function heatscat(x, y, z, plot)
    subplot(2,3,plot)
    %scatter(x, y, 50, z,'filled')
    
    z = min(z, 34.5);
    
    % use interpolated contour maps instead
    interpolant = scatteredInterpolant(x,y,double(z).');
    [xx,yy] = meshgrid(linspace(0,34.5,100));
    error_interp = interpolant(xx,yy);
    contourf(xx,yy,error_interp, 'LineColor', 'none');
    text(8, 11, string(mean(z)), 'color', 'w', 'fontsize', 10);
    
    axis('equal')
    colormap('hot')
    caxis([0 34.5])
end
