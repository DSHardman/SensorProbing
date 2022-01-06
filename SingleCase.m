classdef SingleCase
    properties
        xymean
        depthpercentage
        savename
    end

    methods
        function obj = SingleCase(xymean, depthpercentage, savename)
            %Constructor
            obj.xymean = xymean;
            obj.depthpercentage = depthpercentage;
            obj.savename = savename;
        end

        function heat(obj)
            stringimage = strcat('Images/', obj.savename, '.png');
            imshow(stringimage);
        end
    end
end