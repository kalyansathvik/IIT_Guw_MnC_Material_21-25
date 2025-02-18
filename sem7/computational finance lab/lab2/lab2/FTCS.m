function [U, S, t] = FTCS(N, M, x, t, lamb, K, T, sig, q, q_del, g1, g2, phi) 
    if lamb > 0.5
        error('Scheme is unstable - lambda > 0.5');
    end
    
    U = zeros(M + 1, N + 1);
    U(1, :) = phi(x);
    U(:, 1) = g1(x(1), t);
    U(:, end) = g2(x(end), t);
    
    b = zeros(N - 1, 1);

    L = tridiag(N - 1, 1 - 2*lamb, lamb, lamb);
    
    for j = 2 : M + 1
        b(1) = lamb * g1(x(1), t(j - 1)); 
        b(end) = lamb * g2(x(end), t(j - 1));
        u = L * (U(j - 1, 2 : end - 1)') + b;
        U(j, 2 : end - 1) = u;
    end
    
    [U, S, t] = Transform(U, x, t, K, T, sig, q, q_del);
end

function A = tridiag(N, a, b, c)
     A = diag(a * ones(1, N)) + diag(b * ones(1, N - 1), 1) + diag(c * ones(1, N - 1), -1);
end
