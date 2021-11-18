classdef SingleTest < handle
    properties
        n
        positions
        rawresponses
        extracted3
        extracted10
        poses
        times
    end
    
    methods
        
        % Constructor
        function obj = SingleTest(letter,n)
            
            % initialise properties
            obj.n = n;
            obj.rawresponses = zeros(n,200,8);
            obj.positions = zeros(n, 3);
            obj.extracted3 = zeros(n, 24);
            obj.extracted10 = zeros(n, 80);
            obj.poses = zeros(n,200,6);
            obj.times = zeros(n,200);
            
            
            for i = 1:n
                % set positions
                obj.positions(i, :) = 1000*readNPY(strcat(letter,'/rawdata/xy',string(i-1), '.npy'));
                % set times
                obj.times(i,:) = readNPY(strcat(letter,'/rawdata/times',string(i-1), '.npy')).';
                % set poses
                obj.poses(i,:,:) = readNPY(strcat(letter,'/rawdata/poses',string(i-1), '.npy'));
                
                % set responses
                discretepoints = zeros(n,8,3);
                touchpoints = zeros(n,8,10);
                y = readNPY(strcat(letter,'/rawdata/response',string(i-1), '.npy'));
                obj.rawresponses(i,:,:) = y;
                x = zeros(size(y));
                for j = 1:8
                    [x(:,j), ~] = pwc_tvdrobust(y(:,j), 15, 0);
                    discretepoints(i,j,:) = [x(40,j) x(80,j) x(180,j)];
                    touchpoints(i,j,:) = [y(45:5:65,j).' y(150:5:170,j).'];
                end
                
                for j = 1:24
                    obj.extracted3(i, j) = discretepoints(i, rem(j-1,8)+1, floor((j-1)/8)+1);
                end
                for j = 1:80
                    obj.extracted10(i, j) = touchpoints(i, rem(j-1,8)+1, floor((j-1)/8)+1);
                end
                
            end
        end
        
        % plot raw sensor responses
        function plotresponse(obj, iteration, sensor)
            if nargin == 3
                plot(obj.rawresponses(iteration,:,sensor));
            else
                for i = 1:8
                    plot(obj.rawresponses(iteration,:,i));
                    hold on
                end
            end
        end
        
    end
end

