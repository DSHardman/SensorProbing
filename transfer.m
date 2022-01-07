classdef Transfer
    properties
        scratchdepth
        scratchxy
        scratchpath
        basecase
        zerocase
        grid
        random
        weighted
        twod
        invert
    end

    methods
        function obj = Transfer(basecase, zerocase, grid, random, weighted, twod, invert)
            % Constructor
            obj.basecase = basecase;
            obj.zerocase = zerocase;
            obj.grid = grid;
            obj.random = random;
            obj.weighted = weighted;
            obj.twod = twod;
            obj.invert = invert;
        end

        function plotxy(obj, frozen)
            line([49 4900], [obj.zerocase.xymean obj.zerocase.xymean],...
                'Color', 'k', 'LineStyle', '--', 'LineWidth', 2,  'HandleVisibility', 'Off');
            hold on
            obj.plotscratchxy()
            endstr = strcat(frozen,'.plot(obj.zerocase, ');
            eval(strcat('obj.grid.xy',endstr,"1/255*[27 158 119], 'Grid');"));
            eval(strcat('obj.random.xy',endstr,"1/255*[217 95 2], 'Random');"));
            eval(strcat('obj.weighted.xy',endstr,"1/255*[117 112 179], 'Weighted');"));
            eval(strcat('obj.twod.xy',endstr,"1/255*[231 41 138], '2D');"));
            eval(strcat('obj.invert.xy',endstr,"1/255*[102 116 30], 'Inverted');"));
            %legend('Location', 'ne');
            set(gca, 'XScale', 'log');
        end

        function plotdp(obj, frozen)
            line([49 4900], [obj.zerocase.depthpercentage obj.zerocase.depthpercentage],...
                'Color', 'k', 'LineStyle', '--', 'LineWidth', 2,  'HandleVisibility', 'Off');
            hold on
            obj.plotscratchdp()
            endstr = strcat(frozen,'.plot(obj.zerocase, ');
            eval(strcat('obj.grid.dp',endstr,"1/255*[27 158 119], 'Grid');"));
            eval(strcat('obj.random.dp',endstr,"1/255*[217 95 2], 'Random');"));
            eval(strcat('obj.weighted.dp',endstr,"1/255*[117 112 179], 'Weighted');"));
            eval(strcat('obj.twod.dp',endstr,"1/255*[231 41 138], '2D');"));
            eval(strcat('obj.invert.dp',endstr,"1/255*[102 116 30], 'Inverted');"));
            %legend('Location', 'nw');
            set(gca, 'XScale', 'log');
        end

        function scratchheat(obj, transindex, n)
            transferns = [49, 100, 196, 289, 484, 4900];
            stringimage = strcat('Images/', obj.scratchpath, '_',...
                string(transferns(transindex)), '_', string(n), '.png');
            imshow(stringimage);
        end

        function plotscratchxy(obj)
            neg = zeros(6,1);
            pos = zeros(6,1);
            means = zeros(6,1);
            for i = 1:6
                means(i) = mean(obj.scratchxy(:,i));
                neg(i) = means(i) - min(obj.scratchxy(:,i));
                pos(i) = max(obj.scratchxy(:,i)) - means(i);
            end
            errorbar([49, 100, 196, 289, 484 4900], means, neg, pos, 'LineWidth', 2,...
                'Color', [0.5 0.5 0.5], 'DisplayName', 'From Scratch', 'LineStyle', ':');
            set(gca, 'LineWidth', 2, 'FontSize', 15);
            box off
            xlabel('Number of Inputs');
            ylabel('Average Error (mm)');
        end

        function plotscratchdp(obj)
            neg = zeros(6,1);
            pos = zeros(6,1);
            means = zeros(6,1);
            for i = 1:6
                means(i) = mean(obj.scratchdepth(:,i));
                neg(i) = means(i) - min(obj.scratchdepth(:,i));
                pos(i) = max(obj.scratchdepth(:,i)) - means(i);
            end
            errorbar([49, 100, 196, 289, 484 4900], means, neg, pos, 'LineWidth', 2,...
                'Color', [0.5 0.5 0.5], 'DisplayName', 'From Scratch', 'LineStyle', ':');
            set(gca, 'LineWidth', 2, 'FontSize', 15);
            box off
            xlabel('Number of Inputs');
            ylabel('Correct Depths (%)');
        end

        function plotall(obj)
            figure();
            subplot(2,3,1); obj.plotxy('three'); title('1 Frozen');
            subplot(2,3,2); obj.plotxy('five'); title('2 Frozen');
            subplot(2,3,3); obj.plotxy('seven'); title('3 Frozen');
            subplot(2,3,4); obj.plotdp('three');
            subplot(2,3,5); obj.plotdp('five');
            legend('Location', 's', 'NumColumns', 2); legend boxoff
            subplot(2,3,6); obj.plotdp('seven');
            set(gcf, 'Position', 1000*[0.0010 0.0410 1.5360 0.8448]);
        end

    end
end