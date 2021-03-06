colors = [0 0.447 0.741;...
            0.85 0.325 0.98;...
            0.929 0.694 0.125;...
            0.494 0.184 0.556;...
            0.466 0.674 0.188;...
            0.301 0.745 0.933;...
            0.635 0.078 0.184;
            0 0 0];

figure();
for i = 1:8
    plot(0.001:0.001:30, response1(:,i), 'LineWidth', 2, 'Color', colors(i,:));
    hold on
end
set(gca, 'LineWidth', 2, 'FontSize', 15);
box off
ylim([0 5.25]);
xlabel('Time (s)');
ylabel('Sensor Response (V)');
set(gcf, 'Position', [489.0000  586.6000  582.4000  272.4000]);

figure()
for i = 1:8
    plot(0.001:0.001:30, response2(1:30000,i), 'LineWidth', 2, 'Color', colors(i,:));
    hold on
end
set(gca, 'LineWidth', 2, 'FontSize', 15);
box off
ylim([0 5.25]);
xlabel('Time (s)');
ylabel('Sensor Response (V)');
set(gcf, 'Position', [489.0000  586.6000  582.4000  272.4000]);

figure()
for i = 1:8
    plot(0.001:0.001:30, response4(1:30000,i), 'LineWidth', 2, 'Color', colors(i,:));
    hold on
end
set(gca, 'LineWidth', 2, 'FontSize', 15);
box off
ylim([0 5.25]);
xlabel('Time (s)');
ylabel('Sensor Response (V)');
set(gcf, 'Position', [489.0000  586.6000  582.4000  272.4000]);


%% Animate

%figure()
tic
for i = 1:100:30000
    for j = 1:8
        plot(0.001:0.001:0.001*i, response4(1:i,j), 'LineWidth', 2, 'Color', colors(j,:));
        hold on
    end
    if i == 1
        set(gca, 'LineWidth', 2, 'FontSize', 15);
        box off
        ylim([0 5.25]);
        xlim([0 30])
        xlabel('Time (s)');
        ylabel('Sensor Response (V)');
        set(gcf, 'Position', [489.0000  554.6000  660.0000  304.4000],...
            'Color', 'w');
    else
        children = get(gca, 'children');
        delete(children(9:end));
        legend({'1';'2';'3';'4';'5';'6';'7';'8'},...
            'Orientation', 'horizontal', 'Location', 's');
        legend boxoff
    end
    pause(0.02);
end