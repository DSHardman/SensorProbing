for i = 1:162
    if strcmp(cell2mat(table2cell(tab(i,2))),'random')
        ind = find(inputs==cell2mat(table2cell(tab(i,4))));
        if cell2mat(table2cell(tab(i,3))) == 3
            H12rand_3(ind, repeat(i)) = error(i);
        elseif cell2mat(table2cell(tab(i,3))) == 5
            H12rand_5(ind, repeat(i)) = error(i);
        elseif cell2mat(table2cell(tab(i,3))) == 7
            H12rand_7(ind, repeat(i)) = error(i);
        end
    elseif strcmp(cell2mat(table2cell(tab(i,2))),'weighted')
        if cell2mat(table2cell(tab(i,3))) == 3
            H12weight_3(ind, repeat(i)) = error(i);
        elseif cell2mat(table2cell(tab(i,3))) == 5
            H12weight_5(ind, repeat(i)) = error(i);
        elseif cell2mat(table2cell(tab(i,3))) == 7
            H12weight_7(ind, repeat(i)) = error(i);
        end
    elseif strcmp(cell2mat(table2cell(tab(i,2))),'grid')
        if cell2mat(table2cell(tab(i,3))) == 3
            H12grid_3(ind, repeat(i)) = error(i);
        elseif cell2mat(table2cell(tab(i,3))) == 5
            H12grid_5(ind, repeat(i)) = error(i);
        elseif cell2mat(table2cell(tab(i,3))) == 7
            H12grid_7(ind, repeat(i)) = error(i);
        end
    end
end