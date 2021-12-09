figure();
subplot(3,3,1); ploterrors(H12grid_3, 5); title('3 Frozen'); ylabel('Grid');
subplot(3,3,2); ploterrors(H12grid_5, 5); title('5 Frozen');
subplot(3,3,3); ploterrors(H12grid_7, 5); title('7 Frozen');
subplot(3,3,4); ploterrors(H12rand_3, 5); ylabel('Random');
subplot(3,3,5); ploterrors(H12rand_5, 5);
subplot(3,3,6); ploterrors(H12rand_7, 5);
subplot(3,3,7); ploterrors(H12weight_3, 5); ylabel('Weighted');
subplot(3,3,8); ploterrors(H12weight_5, 5);
subplot(3,3,9); ploterrors(H12weight_7, 5);
sgtitle('Healed1 to Healed2');

figure();
subplot(3,3,1); ploterrors(H25grid_3, 11); title('3 Frozen'); ylabel('Grid');
subplot(3,3,2); ploterrors(H25grid_5, 11); title('5 Frozen');
subplot(3,3,3); ploterrors(H25grid_7, 11); title('7 Frozen');
subplot(3,3,4); ploterrors(H25rand_3, 11); ylabel('Random');
subplot(3,3,5); ploterrors(H25rand_5, 11);
subplot(3,3,6); ploterrors(H25rand_7, 11);
subplot(3,3,7); ploterrors(H25weight_3, 11); ylabel('Weighted');
subplot(3,3,8); ploterrors(H25weight_5, 11);
subplot(3,3,9); ploterrors(H25weight_7, 11);
sgtitle('Healed2 to Healed5');

function ploterrors(errors, ylimit)
    neg = zeros(5,1);
    pos = zeros(5,1);
    means = zeros(5,1);
    for i = 1:5
        means(i) = mean(errors(i,:));
        neg(i) = means(i) - min(errors(i,:));
        pos(i) = max(errors(i,:)) - means(i);
    end
    
    errorbar([49 100 196 289 484], means, neg, pos, 'LineWidth', 2, 'Color', 'k');
    set(gca, 'LineWidth', 2, 'FontSize', 15);
    box off
    xlabel('Number of Inputs');
    ylabel('Average Error (mm)');
    %ylim([0 11]);
    ylim([0 ylimit]);
    %xlim([0 5000]);
    set(gcf, 'Position', 1000*[0.0074    0.3402    1.5152    0.5188]);
end