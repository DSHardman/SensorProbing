n = 4000;

discretepoints = zeros(n,8,3);


for i = 1:n
    y = readNPY(strcat('presses/response',string(i-1), '.npy'));
    x = zeros(size(y));
    for j = 1:8
        [x(:,j), ~] = pwc_tvdrobust(y(:,j), 15, 0);
        discretepoints(i,j,:) = [x(40,j) x(80,j) x(180,j)];
    end
    fprintf('%d/%d Complete\n', i, n);
end

%%
positions = zeros(n, 2);
for i = 1:n
    position = readNPY(strcat('presses/xy',string(i-1), '.npy'));
    position = position*1000;
    positions(i, :) = position;
end

%%

learnfrom3 = zeros(n, 24);
learnfrom2 = zeros(n, 16);

for i = 1:n
    for j = 1:24
        learnfrom3(i, j) = discretepoints(i, rem(j-1,8)+1, floor((j-1)/8)+1);
    end
    
    learnfrom2(i, :) = learnfrom3(i, 1:16);
end