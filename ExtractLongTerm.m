%tab = readtable('J/responses.csv');

responses = zeros(height(tab), 8);
for k = 1:height(tab)
    tx = cell2mat(table2cell(tab(k,1)));
    start = 2;
    n = 1;
    outputdata = zeros(1,8);

    for i = 1:length(tx)
        if tx(i) == ',' || tx(i) == ']'
            outputdata(1,n) = str2double(tx(start:i-1));
            start = i + 2;
            n = n + 1;
        end
    end
    responses(k,:) = outputdata;
end

%% read times from separate csv file

%tab = readtable('J/times.csv');

times = zeros(height(tab), 1);
for k = 1:height(tab)
    times(k) = cell2mat(table2cell(tab(k,1)));
end

