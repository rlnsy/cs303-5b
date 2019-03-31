function u = beuler(A, nt, u)
    for i = 2:nt
            u(:,i) = A \ u(:, i-1);
    end
end