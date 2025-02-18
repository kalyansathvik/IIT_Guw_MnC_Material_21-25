function [v, S, t] = transform(x, tau, U, T, K, r, sigma, delta)
    q_delta = 2 * (r - delta)/sigma^2;
    q = 2 * r / sigma^2;

    v = zeros(length(tau), length(x));

    for i = 1:length(tau)
        for j = 1:length(x)
            v(i,j) = K * exp(-(q_delta - 1) * x(j)/2 - ((q_delta - 1)^2 / 4 + q) * tau(i)) * U(i,j);
        end
    end

    S = K * exp(x);
    t = T - 2 * tau / sigma^2;
end