n = 5000;

touchpoints = zeros(n,8,10);

for i = 1:n
    y = readNPY(strcat('H/rawdata/response',string(i-1), '.npy'));
    for j = 1:8
        touchpoints(i,j,:) = [y(45:5:65,j).' y(150:5:170,j).'];
    end
end

touchNN = zeros(n, 80);

for i = 1:n
    for j = 1:80
        touchNN(i, j) = touchpoints(i, rem(j-1,8)+1, floor((j-1)/8)+1);
    end
end