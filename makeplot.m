function out = makeplot(t, dt, ny, nx, nt, x, y, u)
    uplot = reshape(u, [ny, nx, nt]);
    num_contours = 50;
    figure;
    contour(x, y, uplot(:,:,t), num_contours);
    colorbar;
    title(sprintf('Pollution at t=%f', (t - 1)*dt));
    xlabel('x');
    ylabel('y');
    out = 1;
end