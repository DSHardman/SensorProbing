% From Thomas, 12/11/21

pts=500;

% define input and output from existing variables
inp=Original.random.extracted10;
out=Original.random.positions;

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
ypred2=predict(net,(Damaged1.random.extracted10-mu)./sig);
ypred3=predict(net,(Healed1.random.extracted10-mu)./sig);
ypred4=predict(net,(Damaged4.random.extracted10-mu)./sig);
ypred5=predict(net,(Healed2.random.extracted10-mu)./sig);
err2=rssq((ypred2-Damaged1.random.positions)');
err3=rssq((ypred3-Healed1.random.positions)');
err4=rssq((ypred4-Damaged4.random.positions)');
err5=rssq((ypred5-Healed2.random.positions)');

mean(err5) % average error for healed data

% plot these errors
figure;
heatscat(Original.random.positions(:,1),Original.random.positions(:,2),err, 1); title('Original');
heatscat(Damaged1.random.positions(:,1),Damaged1.random.positions(:,2),err2,2); title('Damaged 1');
heatscat(Healed1.random.positions(:,1),Healed1.random.positions(:,2),err3,3); title('Healed 1');
heatscat(Damaged4.random.positions(:,1),Damaged4.random.positions(:,2),err4,4); title('Damaged 2');
heatscat(Healed2.random.positions(:,1),Healed2.random.positions(:,2),err5,5); title('Healed 2');
sgtitle('Undamaged Training: 24 input');

% transfer learning: copy network but zero first 5 layer learning rates
layers2=net.Layers;
layers2(1:5) = freezeWeights(layers2(1:5));

% new inputs, outputs, normalised training/validation sets for healed
inp=Healed2.random.extracted10;
out=Healed2.random.positions;
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
ypred=predict(net,(Original.random.extracted10-mu)./sig);
ypred2=predict(net,(Damaged1.random.extracted10-mu)./sig);
ypred3=predict(net,(Healed1.random.extracted10-mu)./sig);
ypred4=predict(net,(Damaged4.random.extracted10-mu)./sig);
ypred5=predict(net,(Healed2.random.extracted10-mu)./sig);
err=rssq((ypred-Original.random.positions)');
err2=rssq((ypred2-Damaged1.random.positions)');
err3=rssq((ypred3-Healed1.random.positions)');
err4=rssq((ypred4-Damaged4.random.positions)');
err5=rssq((ypred5-Healed2.random.positions)');

mean(err5) % average error for healed data

% plot results
figure;
heatscat(Original.random.positions(:,1),Original.random.positions(:,2),err, 1); title('Original');
heatscat(Damaged1.random.positions(:,1),Damaged1.random.positions(:,2),err2,2); title('Damaged 1');
heatscat(Healed1.random.positions(:,1),Healed1.random.positions(:,2),err3,3); title('Healed 1');
heatscat(Damaged4.random.positions(:,1),Damaged4.random.positions(:,2),err4,4); title('Damaged 2');
heatscat(Healed2.random.positions(:,1),Healed2.random.positions(:,2),err5,5); title('Healed 2');
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
