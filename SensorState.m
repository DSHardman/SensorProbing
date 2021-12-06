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
            pause(0.1);
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
        
        function animaterepeats(obj)
            
            obj.repeated.plotresponse(1);
            pause(0.05);
            for i = 2:obj.repeated.n
                
                obj.repeated.plotresponse(i);
                
                subplot(1,2,1);
                children = get(gca, 'Children');
                delete(children(end-8:end));
                
                subplot(1,2,2);
                children = get(gca, 'Children');
                delete(children(end-7:end));
                legend('Orientation', 'Horizontal', 'Location', 's');
                legend boxoff
                
                pause(0.05);
            end
        end
        
        function lineplot(obj, sensor)
            
            colors = [0 0.447 0.741;...
                        0.85 0.325 0.98;...
                        0.929 0.694 0.125;...
                        0.494 0.184 0.556;...
                        0.466 0.674 0.188;...
                        0.301 0.745 0.933;...
                        0.635 0.078 0.184;
                        0 0 0];
            lineresponse = zeros(obj.line.n, 1);
            for i = 1:obj.line.n
                lineresponse(i) = max(obj.line.rawresponses(i,:,sensor))...
                    - min(obj.line.rawresponses(i, :, sensor));
            end
            
            if obj.line.positions(end,1) == obj.line.positions(1,1)
                plot(obj.line.positions(:,2), lineresponse, 'Color',...
                    colors(sensor,:), 'LineWidth', 2);
                xlabel('y Position (mm)');
            else
                plot(obj.line.positions(:,1), lineresponse, 'Color',...
                    colors(sensor,:), 'LineWidth', 2);
                xlabel('x Position (mm)');
            end
            
            set(gca, 'LineWidth', 2, 'Fontsize', 15);
            ylabel('\Delta Response (V)');
            box off
            xlim([0 34.5]);
            ylim([0 2.5])
            set(gcf, 'Position', [462.6000  391.4000  596.0000  280.8000]);
        end
    end
end

