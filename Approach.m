classdef Approach
    properties
        xythree
        xyfive
        xyseven
        dpthree
        dpfive
        dpseven
    end

    methods
        function obj = Approach(xythree, xyfive, xyseven, dpthree, dpfive, dpseven)
            %Constructor
            obj.xythree = xythree;
            obj.xyfive = xyfive;
            obj.xyseven = xyseven;
            obj.dpthree = dpthree;
            obj.dpfive = dpfive;
            obj.dpseven = dpseven;
        end
    end
end