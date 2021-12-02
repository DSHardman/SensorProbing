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
        
         function animateline(obj)
             
             obj.line.plotresponse(1);
             for i = 2:obj.line.n
                obj.line.plotresponse(i);
                
                subplot(1,2,1);
                children = get(gca, 'Children');
                delete(children(end-8:end));
                
                subplot(1,2,2);
                children = get(gca, 'Children');
                delete(children(end-7:end));
                legend('Orientation', 'Horizontal', 'Location', 's');
                legend boxoff
                
                pause(0.1);
             end
         end
    end
end

