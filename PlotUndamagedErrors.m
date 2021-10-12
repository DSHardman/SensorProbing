n = 4000;

errors = zeros(n,1);
for i = 1:n
    [pred, ~, ~] = fitted_3_40(learnfrom3(i, :));
    errors(i) = sqrt((pred(1)-positions(i,1))^2 + ...
        (pred(2)-positions(i,2))^2);
end

interpolant = scatteredInterpolant(positions(:,1),...
    positions(:,2),errors);
[xx,yy] = meshgrid(linspace(10,35,100));
error_interp = interpolant(xx,yy);

figure();
contourf(xx,yy,error_interp);
caxis([0 11.5]);
axis square
axis off

mean(errors)