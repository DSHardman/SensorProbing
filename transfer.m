

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
    'GradientThreshold',10*0.1, ...
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
ypred4=predict(net,(Damaged2.random.extracted10-mu)./sig);
ypred5=predict(net,(Healed2.random.extracted10-mu)./sig);
err=rssq((ypred-Original.random.positions)');
err2=rssq((ypred2-Damaged1.random.positions)');
err3=rssq((ypred3-Healed1.random.positions)');
err4=rssq((ypred4-Damaged2.random.positions)');
err5=rssq((ypred5-Healed2.random.positions)');

mean(err5) % average error for healed data

% plot results
figure;
heatscat(Original.random.positions(:,1),Original.random.positions(:,2),err, 1); title('Original');
heatscat(Damaged1.random.positions(:,1),Damaged1.random.positions(:,2),err2,2); title('Damaged 1');
heatscat(Healed1.random.positions(:,1),Healed1.random.positions(:,2),err3,3); title('Healed 1');
heatscat(Damaged2.random.positions(:,1),Damaged2.random.positions(:,2),err4,4); title('Damaged 2');
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
