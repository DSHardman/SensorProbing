function sensorheat(fhandle, dataNN, positions)
    n = 5000;

    errors = zeros(n,1);

    for i = 1:n
        [pred, ~, ~] = fhandle(dataNN(i, :));
        errors(i) = sqrt((pred(1)-positions(i,1))^2 + ...
            (pred(2)-positions(i,2))^2);
    end

    interpolant = scatteredInterpolant(positions(:,1),...
        positions(:,2),errors);
    [xx,yy] = meshgrid(linspace(0,33.5,100));
    error_interp = interpolant(xx,yy);

    contourf(xx,yy,error_interp);
    caxis([0 11.5]);
    colorbar
    axis square
    axis off
    %title('Error (mm) in x/y plane')
end