function K = eval_k_monte(D, t, dt, dx, dy, nx, ny, x, y, nt, ...
                s1, s2, mean_a1, mean_a2)

    % get the u row
    G = @(i,j) i + (j-1)*ny; 
    u_idx = G(41,41);

    % sample
    W = wblrnd303(2,2);
    theta = rand() * (2*pi);
    a1 = exprnd(mean_a1);
    a2 = exprnd(mean_a2);
    
    %% Initial condition
    u0 = a1*exp(-s1*bsxfun(@plus, (x-0.25).^2, (y'-0.25).^2)) + ...
        a2*exp(-s2*bsxfun(@plus, (x-0.65).^2, (y'-0.4).^2));
    u(:,1) = u0(:); % flatten
    
    % integrate
    
    A = createA(D, W, theta, nx, ny, dx, dy, dt);
    u = beuler(sparse(A), nt, u);
    Y = u(u_idx, :);
    X = t;
    
    K = trapz(X,Y);
    
end