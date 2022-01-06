classdef Attempt
    properties
        results
        savename
        transferns
    end

    methods
        function obj = Attempt(results,savename)
            %Constructor
            obj.results = results;
            obj.savename = savename;
            obj.transferns = [49, 100, 196, 289, 484, 4900];
        end

        function heat(obj, transindex, n)
            stringimage = strcat('Images/', obj.savename, '_',...
                string(obj.transferns(transindex)), '_', string(n), '.png');
            imshow(stringimage);
        end

        function plot(obj)
            for i = 1:length(obj.transferns)
                for j = 1:size(obj.results, 1)
                    scatter(obj.transferns(i), obj.results(j, i));
                    hold on
                end
            end
        end
    end
end