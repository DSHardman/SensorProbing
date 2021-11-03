%load('A/A60net.mat');

A2F60net = A60net;

adaptedmetric = zeros(5001,1);

errors = zeros(5000,1);
pred = A2F60net(discreteNNF.');
for j = 1:5000
    errors(j) = sqrt((pred(1,j)-positionsF(j,1))^2 + ...
        (pred(2,j)-positionsF(j,2))^2);
end
adaptedmetric(1) = mean(errors);

randomorder = randsample(5000,5000);

for i = 1:5000
    load('A60net.mat');
    %adapt network one random sample at a time
    A2F60net = adapt(A60net, discreteNNF(randomorder(1:i),:).',...
        positionsF(randomorder(1:i),:).');
    
    %calculate error metric for adapted network
    errors = zeros(5000,1);
    pred = A2F60net(discreteNNF.');
    for j = 1:5000
        errors(j) = sqrt((pred(1,j)-positionsF(j,1))^2 + ...
            (pred(2,j)-positionsF(j,2))^2);
    end
    adaptedmetric(i+1) = mean(errors);
    if rem(i,100) == 0
        i
    end
end

