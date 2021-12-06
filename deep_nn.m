% From Thomas, 12/11/21
 %Original.random.extracted10=Original.random.extracted10(:,:)-Original.random.extracted10(1,:);
 %Damaged4.random.extracted10=Damaged4.random.extracted10(:,:)-Damaged4.random.extracted10(1,:);
 %Damaged2.random.extracted10=Damaged2.random.extracted10(:,:)-Damaged2.random.extracted10(1,:);
 %Healed4.random.extracted10=Healed4.random.extracted10(:,:)-Healed4.random.extracted10(1,:);
 %Healed2.random.extracted10=Healed2.random.extracted10(:,:)-Healed2.random.extracted10(1,:);




pts=500;

% define input and output from existing variables
%inp=Original.random.extracted3;
inp=Healed1.random.extracted3;
out=Healed1.random.positions;

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
    fullyConnectedLayer(20,"Name","fc_1")
     tanhLayer("Name","relu2")
    fullyConnectedLayer(10,"Name","fc_2")
    tanhLayer("Name","reluw")
        fullyConnectedLayer(10,"Name","fc_5")
    reluLayer("Name","relu3e")
    fullyConnectedLayer(3,"Name","fc_6")
    regressionLayer("Name","regressionoutput")];

opts = trainingOptions('adam', ...
    'MaxEpochs',2000, ... % number of training iterations.
    'MiniBatchSize', 512*7,... %%%512
     'ValidationData',{XVal,YVal}, ...
    'ValidationFrequency',30, ...
    'GradientThreshold',1, ...
    'ValidationPatience',10,...
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
ypred2=predict(net,(Damaged2.random.extracted3-mu)./sig);
ypred3=predict(net,(Healed2.random.extracted3-mu)./sig);
ypred4=predict(net,(Damaged2.random.extracted3-mu)./sig);
ypred5=predict(net,(Healed2.random.extracted3-mu)./sig);
err2=rssq((ypred2-Damaged2.random.positions)');
err3=rssq((ypred3-Healed2.random.positions)');
err4=rssq((ypred4-Damaged2.random.positions)');
err5=rssq((ypred5-Healed2.random.positions)');

figure();
heatscat(Healed1.random.positions(:,1),Healed1.random.positions(:,2),err, 1);
mean(err)
figure();
heatscat(Damaged2.random.positions(:,1),Damaged2.random.positions(:,2),err2, 1);
mean(err2)
figure();
heatscat(Healed2.random.positions(:,1),Healed2.random.positions(:,2),err3, 1);
mean(err3)

%% section
mean(err5) % average error for healed data

% plot these errors
figure;
heatscat(Original.random.positions(:,1),Original.random.positions(:,2),err, 1); title('Original');
heatscat(Damaged1.random.positions(:,1),Damaged1.random.positions(:,2),err2,2); title('Damaged 1');
heatscat(Healed1.random.positions(:,1),Healed1.random.positions(:,2),err3,3); title('Healed 1');
heatscat(Damaged2.random.positions(:,1),Damaged2.random.positions(:,2),err4,4); title('Damaged 2');
heatscat(Healed2.random.positions(:,1),Healed2.random.positions(:,2),err5,5); title('Healed 2');
sgtitle('Undamaged Training: 24 input');



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% transfer learning: copy network but zero first 5 layer learning rates
layers2=net.Layers;
layers2(1:5) = freezeWeights(layers2(1:5));

% new inputs, outputs, normalised training/validation sets for healed
inp=Healed4.random.extracted10;
out=Healed4.random.positions;
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
    'ValidationPatience',10,...
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
ypred2=predict(net,(Damaged4.random.extracted10-mu)./sig);
ypred3=predict(net,(Healed4.random.extracted10-mu)./sig);
ypred4=predict(net,(Damaged2.random.extracted10-mu)./sig);
ypred5=predict(net,(Healed2.random.extracted10-mu)./sig);
err=rssq((ypred-Original.random.positions)');
err2=rssq((ypred2-Damaged4.random.positions)');
err3=rssq((ypred3-Healed4.random.positions)');
err4=rssq((ypred4-Damaged2.random.positions)');
err5=rssq((ypred5-Healed2.random.positions)');

mean(err3) % average error for healed data

% plot results
figure;
heatscat(Original.random.positions(:,1),Original.random.positions(:,2),err, 1); title('Original');
heatscat(Damaged4.random.positions(:,1),Damaged4.random.positions(:,2),err2,2); title('Damaged 4');
heatscat(Healed4.random.positions(:,1),Healed4.random.positions(:,2),err3,3); title('Healed 4');
heatscat(Damaged2.random.positions(:,1),Damaged2.random.positions(:,2),err4,4); title('Damaged 2');
heatscat(Healed2.random.positions(:,1),Healed2.random.positions(:,2),err5,5); title('Healed 2');
sgtitle('Healed 4 Transfer: 24 input');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
    'ValidationPatience',10,...
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
ypred2=predict(net,(Damaged4.random.extracted10-mu)./sig);
ypred3=predict(net,(Healed4.random.extracted10-mu)./sig);
ypred4=predict(net,(Damaged2.random.extracted10-mu)./sig);
ypred5=predict(net,(Healed2.random.extracted10-mu)./sig);
err=rssq((ypred-Original.random.positions)');
err2=rssq((ypred2-Damaged4.random.positions)');
err3=rssq((ypred3-Healed4.random.positions)');
err4=rssq((ypred4-Damaged2.random.positions)');
err5=rssq((ypred5-Healed2.random.positions)');

mean(err5) % average error for healed data

% plot results
figure;
heatscat(Original.random.positions(:,1),Original.random.positions(:,2),err, 1); title('Original');
heatscat(Damaged4.random.positions(:,1),Damaged4.random.positions(:,2),err2,2); title('Damaged 4');
heatscat(Healed4.random.positions(:,1),Healed4.random.positions(:,2),err3,3); title('Healed 4');
heatscat(Damaged2.random.positions(:,1),Damaged2.random.positions(:,2),err4,4); title('Damaged 2');
heatscat(Healed2.random.positions(:,1),Healed2.random.positions(:,2),err5,5); title('Healed 2');
sgtitle('Healed 2 Transfer: 24 input');


function heatscat(x, y, z, plot)
    %subplot(2,3,plot)
    %scatter(x, y, 50, z,'filled')
    
    z = min(z, 48.8);
    
    % use interpolated contour maps instead
    interpolant = scatteredInterpolant(x,y,double(z).');
    [xx,yy] = meshgrid(linspace(0,34.5,100));
    error_interp = interpolant(xx,yy);
    contourf(xx,yy,error_interp, 'LineColor', 'none');
    %text(8, 11, string(mean(z)), 'color', 'w', 'fontsize', 10);
    
    axis('equal')
    colormap('hot')
    caxis([0 48.8])
    set(gca, 'Visible', 'off');
end
