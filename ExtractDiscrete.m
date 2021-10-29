n = 5000;

discretepoints = zeros(n,8,3);


for i = 1:n
    y = readNPY(strcat('C/rawdata/response',string(i-1), '.npy'));
    x = zeros(size(y));
    for j = 1:8
        [x(:,j), ~] = pwc_tvdrobust(y(:,j), 15, 0);
        discretepoints(i,j,:) = [x(40,j) x(80,j) x(180,j)];
    end
    %fprintf('%d/%d Complete\n', i, n);
end

%%
positions = zeros(n, 3);
for i = 1:n
    position = readNPY(strcat('C/rawdata/xy',string(i-1), '.npy'));
    position = position*1000;
    positions(i, :) = position;
end

%%

discreteNN = zeros(n, 24);

for i = 1:n
    for j = 1:24
        discreteNN(i, j) = discretepoints(i, rem(j-1,8)+1, floor((j-1)/8)+1);
    end
end