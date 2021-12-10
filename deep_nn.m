% define input and output from existing variables
inp=Healed1.random.extracted10;
out=Healed1.random.positions;

% normalise inputs & choose 4500 random samples for training
mu=mean(inp);
sig=std(inp);

P=randperm(length(inp));
XTrain=(inp(P(1:4500),:)-mu)./sig; % 10 percent used for validation
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

heatscat(net, Healed5, mu, sig);

% % Calcute and plot 3D error over input data
% figure();
% subplot(1,3,1); heatscat(net, Healed2, mu, sig);
% 
% % Calculate and plot error for other datasets without retraining
% subplot(1,3,2); heatscat(net, Damaged4, mu, sig);
% subplot(1,3,3); heatscat(net, Healed5, mu, sig);

%% Transfer
%transfer(net, Healed5, 49, 5, "weighted", 7, mu, sig);

% Large scale transfers & save:
transferns = [49, 100, 196, 289, 484, 4900];

errors = zeros(3,6,3);
for i = 1:3
    for j = 1:length(transferns)
        for k = 3:2:7
            %transfer(net, Healed5, transferns(j), k, "random", 7, mu, sig, sprintf("h25_random_%d_%d_%d", k, transferns(j), i));
            %transfer(net, Healed5, transferns(j), k, "grid", 7, mu, sig, sprintf("h25_grid_%d_%d_%d", k, transferns(j), i));
            %transfer(net, Healed5, transferns(j), k, "weighted", 7, mu, sig, sprintf("h25_weighted_%d_%d_%d", k, transferns(j), i));
            errors(i,j,(k-1)/2) = transfer(net, Healed2, transferns(j), k, "2d", [17.25 23], mu, sig, sprintf("h25_2d_%d_%d_%d", k, transferns(j), i));
            fprintf("H25: %d/3, %d/6, %d Frozen\n", i, j, k);
        end
    end
end

%%

function errorout = transfer(net, newstate, pts, frozen, method, damagedsensor, mu, sig, savename)
    % transfer learning: copy network but zero first few layer learning rates
    layers=net.Layers;
    layers(1:frozen) = freezeWeights(layers(1:frozen));

    % new inputs, outputs, normalised training/validation sets for healed
    inp=newstate.random.extracted10;
    out=newstate.random.positions;

    % Sampling method: random, grid, or weighted
    if method == "random" % locations are randomly sampled
        P=randperm(length(inp));
        XTrain=(inp(P(1:round(0.9*pts)),:)-mu)./sig; % 10 percent used for validation
        YTrain=out(P(1:round(0.9*pts)),:);

        XVal=(inp(P(round(0.9*pts)+1:pts),:)-mu)./sig;
        YVal=out(P(round(0.9*pts)+1:pts),:);
    elseif method == "grid" % locations are arranged in a grid
        side = floor(sqrt(pts));
        locations = 0:34.5/((side-1)):34.5;
        x = zeros(side^2, 1);
        y = zeros(side^2, 1);
        for i = 1:side
            for j = 1:side
                x((i-1)*side+j) = locations(j);
                y((j-1)*side+i) = locations(j);
            end
        end
        
        indices = newstate.findclosest(x, y);
        P = indices(randperm(length(indices)));
        XTrain=(inp(P(1:round(0.9*length(P))),:)-mu)./sig;
        YTrain=out(P(1:round(0.9*length(P))),:);
        
        XVal=(inp(P(round(0.9*length(P))+1:length(P)),:)-mu)./sig;
        YVal=out(P(round(0.9*length(P))+1:length(P)),:);
    elseif method == "weighted" % locations are weighted in 1D with a Gaussian
        if damagedsensor <= 4
            truncated = truncate(makedist('Normal',(4-damagedsensor)*11.5,15),0,34.5);
            x = random(truncated,pts,1);
            y = 34.5*rand(pts, 1);
        else
            truncated = truncate(makedist('Normal',(8-damagedsensor)*11.5,15),0,34.5);
            y = random(truncated,pts,1);
            x = 34.5*rand(pts, 1);
        end
        
        indices = newstate.findclosest(x, y);
        P = indices(randperm(length(indices)));
        XTrain=(inp(P(1:round(0.9*length(P))),:)-mu)./sig;
        YTrain=out(P(1:round(0.9*length(P))),:);
        
        XVal=(inp(P(round(0.9*length(P))+1:length(P)),:)-mu)./sig;
        YVal=out(P(round(0.9*length(P))+1:length(P)),:);
    elseif method == "2d"
        samples = zeros(pts, 2);
        num = 0;
        while num < pts
            sample = mvnrnd(damagedsensor, [20 20], 1);
            if sample(1) <= 34.5 && sample(1) >= 0
                if sample(2) <= 34.5 && sample(2) >= 0
                    num = num + 1;
                    samples(num, :) = sample;
                end
            end
        end
        
        indices = newstate.findclosest(samples(:,1), samples(:,2));
        P = indices(randperm(length(indices)));
        XTrain=(inp(P(1:round(0.9*length(P))),:)-mu)./sig;
        YTrain=out(P(1:round(0.9*length(P))),:);
        
        XVal=(inp(P(round(0.9*length(P))+1:length(P)),:)-mu)./sig;
        YVal=out(P(round(0.9*length(P))+1:length(P)),:);
    else
        error('Invalid Sampling Method');
    end

    % Transfer Training
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
        'Verbose',0, ...
        'Plots','none', 'ExecutionEnvironment', 'gpu');

    [net2,~] = trainNetwork(XTrain,YTrain,layers,opts);

    % Calcute and plot 3D error
    figure();
    if nargin == 9 % save if input savename is given
        errorout = heatscat(net2, newstate, mu, sig, savename);
        exportgraphics(gcf, strcat('Images/',savename,'.png'));
        close();
    else
        errorout = heatscat(net2, newstate, mu, sig);
    end
end

function errorout = heatscat(net, state, mu, sig, savename)

    x = state.random.positions(:,1);
    y = state.random.positions(:,2);

    ypred = predict(net, (state.random.extracted10-mu)./sig);
    z=rssq((ypred-state.random.positions)');
    
    if nargin == 5
        fid = fopen('Errors.txt', 'a+');
        fprintf(fid, savename + ": %.2f\n", mean(z));
        fclose(fid);
    else
        mean(z)
    end
    
    errorout = mean(z);
   
    z = min(z, 48.8);
    
    % use interpolated contour maps
    interpolant = scatteredInterpolant(x,y,double(z).');
    [xx,yy] = meshgrid(linspace(0,34.5,100));
    error_interp = interpolant(xx,yy);
    contourf(xx,yy,error_interp, 'LineColor', 'none');
    %text(8, 11, string(mean(z)), 'color', 'w', 'fontsize', 10);
    
    axis('equal')
    colormap('hot')
    %caxis([0 48.8])
    caxis([0 30])
    set(gca, 'Visible', 'off');
end
