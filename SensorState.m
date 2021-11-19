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
            obj.random = SingleTest(randomletter, randomn, 0);
            obj.repeated = SingleTest(repeatedletter, repeatedn, 0);
            
            if nargin == 6
                obj.line = SingleTest(lineletter, linen, 1);
            elseif nargin == 4
                obj.line = NaN;
            else
                error('Check Number of Inputs');
            end
        end
    end
end

