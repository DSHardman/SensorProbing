% Load InputNumber.mat or RedundantResponse.mat

xyvalues = zeros(size(xyerrors,1)/3, 3);
depthvalues = zeros(size(depthcorrect,1)/3, 3);

for i = 1:size(xyerrors,1)/3
    xyvalues(i, 1) = mean(xyerrors((i-1)*3+1:(i*3)));
    xyvalues(i,2) = min(xyerrors((i-1)*3+1:(i*3))) - xyvalues(i, 1);
    xyvalues(i,3) = max(xyerrors((i-1)*3+1:(i*3))) - xyvalues(i, 1);

    depthvalues(i, 1) = mean(depthcorrect((i-1)*3+1:(i*3)));
    depthvalues(i,2) = min(depthcorrect((i-1)*3+1:(i*3))) - depthvalues(i, 1);
    depthvalues(i,3) = max(depthcorrect((i-1)*3+1:(i*3))) - depthvalues(i, 1);
end

figure()
yyaxis left
errorbar(1:size(depthvalues,1),xyvalues(:,1),xyvalues(:,2),xyvalues(:,3), 'LineWidth', 2);
set(gca, 'Fontsize', 15, 'LineWidth', 2);
ylabel('xy error (mm)');
box off
ylim([0 14]);

yyaxis right
errorbar(1:size(depthvalues,1),depthvalues(:,1),depthvalues(:,2),depthvalues(:,3), 'LineWidth', 2);
set(gca, 'Fontsize', 15, 'LineWidth', 2);
xlabel('Sensor Removed');
ylabel('Correct Depths (%)');
box off
ylim([30 100]);

set(gcf, 'Position', 1000*[0.0378    0.4380    1.4072    0.4200]);