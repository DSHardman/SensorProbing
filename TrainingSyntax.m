net = feedforwardnet([50 5]); trainednet = train(net, discreteNNA.', positionsA.'); PlotUndamagedErrors

layers = [ ...
    imageInputLayer([ninputs 1 1], 'name', 'input')
    fullyConnectedLayer(60, 'name', 'fc1')
    fullyConnectedLayer(10, 'name', 'fc2')
    fullyConnectedLayer(3, 'name', 'fc3')
    reluLayer('name', 'relu')];

trainingOptions('sgdm') % defaults

%layers(3) = setLearnRateFactor(layers(4),"Alpha",2);