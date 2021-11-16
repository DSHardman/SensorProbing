subplot(1,2,1);

% these pseudo-plots make it easier to add a legend later
plot(nan, nan, 'color', 'k', 'LineWidth', 2);
hold on
plot(nan, nan, 'color', 'r', 'LineWidth', 2);
plot(nan, nan, 'color', 'b', 'LineWidth', 2);

subplot(1,2,2);
plot(nan, nan, 'color', 'k', 'LineWidth', 2);
hold on
plot(nan, nan, 'color', 'r', 'LineWidth', 2);
plot(nan, nan, 'color', 'b', 'LineWidth', 2);


for i = 1:100
    % 100 repetitions of each probe for sensor in 3 states
    
    % plot sensor 2 response
    subplot(1,2,1);
    plot(0:0.05:9.95, 120./((5./Original.repeated.rawresponses(i,:,3))- 1), 'color', 'k');
    plot(0:0.05:9.95, 120./((5./Damaged1.repeated.rawresponses(i,:,3))- 1), 'color', 'r');
    plot(0:0.05:9.95, 120./((5./Healed1.repeated.rawresponses(i,:,3))- 1), 'color', 'b');
    hold on
    
    % plot sensor 6 response
    subplot(1,2,2);
    plot(0:0.05:9.95, 120./((5./Original.repeated.rawresponses(i,:,7))- 1), 'color', 'k');
    plot(0:0.05:9.95, 120./((5./Damaged1.repeated.rawresponses(i,:,7))- 1), 'color', 'r');
    plot(0:0.05:9.95, 120./((5./Healed1.repeated.rawresponses(i,:,7))- 1), 'color', 'b');
    hold on
end

% customise sensor 2 axes
subplot(1,2,1);
legend({'Original';'Damaged';'Healed'},...
    'Orientation', 'Horizontal', 'Location', 's');
legend boxoff
set(gca, 'LineWidth', 2, 'FontSize', 15);
box off
title('Sensor 2');
xlabel('Time (s)');
ylabel ('Resistance (k\Omega)');
ylim([0 130]);


% customise sensor 6 axes
subplot(1,2,2);
legend({'Original';'Damaged';'Healed'},...
    'Orientation', 'Horizontal', 'Location', 's');
legend boxoff
set(gca, 'LineWidth', 2, 'FontSize', 15);
box off
title('Sensor 6');
xlabel('Time (s)');
ylabel ('Resistance (k\Omega)');
ylim([0 130]);

% move entire figure to desired position
set(gcf, 'Position', 1000*[0.1186    0.3994    1.1944    0.4200]);
