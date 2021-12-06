n = 5000;
depthincluded = 1;

errors = zeros(n,1);
if depthincluded
    deptherrors = zeros(n, 1);
end

positions = Damaged2.random.positions;
cd TrainedNets
for i = 1:n
    [pred, ~, ~] = Healed160Neurons(Damaged2.random.extracted3(i, :));
    %pred = sim(trainednet, Original.random.extracted3(i,:).');
    %errors(i) = sqrt((pred(1)-positions(i,1))^2 + ...
    %    (pred(2)-positions(i,2))^2);
    errors(i) = norm(pred - positions(i,:));
    if depthincluded
        deptherrors(i) = min([max([round(pred(3)*2)/2 0.5]) 1.5])...
            - positions(i,3);
    end
end
cd ..

errors = min(errors, 48.8);

interpolant = scatteredInterpolant(positions(:,1),...
    positions(:,2),errors);
[xx,yy] = meshgrid(linspace(0,34.5,100));
error_interp = interpolant(xx,yy);
    
figure();
contourf(xx,yy,error_interp);
caxis([0 48.8]);
colorbar
axis square
axis off
title('Error (mm) in x/y plane')

if ~depthincluded
    return
end

fprintf(strcat("Of %d samples:\nDepth predicted correctly %d times\n",...
    "Depth 0.5mm too high %d times\nDepth 0.5mm too low %d times\n",...
    "Depth 1mm too high %d times\nDepth 1mm too low %d times\n",...
    "Mean xy error %fmm\nMedian xy error %f mm\n"),...
    n, length(find(deptherrors==0)), length(find(deptherrors==0.5)),...
    length(find(deptherrors==-0.5)), length(find(deptherrors==1)),...
    length(find(deptherrors==-1)), mean(errors), median(errors));

figure();
bar([length(find(deptherrors==0)), length(find(deptherrors==0.5)),...
    length(find(deptherrors==-0.5)), length(find(deptherrors==1)),...
    length(find(deptherrors==-1))]);
set(gca,'XTickLabel',{'Correct'; '0.5mm Too High'; '0.5mm Too Low';...
    '1mm Too High'; '1mm Too Low'});
set(gcf, 'Position', [377.8 439 854.8 420]);
title('Depth Predictions')