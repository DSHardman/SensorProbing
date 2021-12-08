plot(0.001:0.001:30, response1(:,7), 'LineWidth', 2, 'Color', 1/255*[162 20 47]);
set(gca, 'LineWidth', 2, 'FontSize', 15);
box off
ylim([0 5.25]);
xlabel('Time (s)');
ylabel('Sensor Response (V)');
set(gcf, 'Position', [489.0000  586.6000  582.4000  272.4000]);

figure()
plot(0.001:0.001:30, response2(1:30000,1), 'LineWidth', 2, 'Color', 1/255*[77 190 238]);
set(gca, 'LineWidth', 2, 'FontSize', 15);
box off
ylim([0 5.25]);
xlabel('Time (s)');
ylabel('Sensor Response (V)');
set(gcf, 'Position', [489.0000  586.6000  582.4000  272.4000]);

figure()
plot(0.001:0.001:30, response4(1:30000,7), 'LineWidth', 2, 'Color', 1/255*[162 20 47]);
set(gca, 'LineWidth', 2, 'FontSize', 15);
box off
ylim([0 5.25]);
xlabel('Time (s)');
ylabel('Sensor Response (V)');
set(gcf, 'Position', [489.0000  586.6000  582.4000  272.4000]);

figure()
plot(0.001:0.001:30, response2_5(1:30000,3), 'LineWidth', 2, 'Color', 1/255*[237 177 32]);
set(gca, 'LineWidth', 2, 'FontSize', 15);
box off
ylim([0 5.25]);
xlabel('Time (s)');
ylabel('Sensor Response (V)');
set(gcf, 'Position', [489.0000  586.6000  582.4000  272.4000]);