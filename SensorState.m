classdef SensorState < handle
    properties
        random %SingleTest object
        repeated %SingleTest object
        line %SingleTest object, optional
    end
    
    methods
        %Constructor
        function obj = SensorState(randomletter, randomn, repeatedletter,...
                repeatedn, lineletter, linen)
            obj.random = SingleTest(randomletter, randomn);
            obj.repeated = SingleTest(repeatedletter, repeatedn);
            
            if nargin == 6
                obj.line = SingleTest(lineletter, linen);
            elseif nargin == 4
                obj.line = NaN;
            else
                error('Check Number of Inputs');
            end
        end
    end
end

