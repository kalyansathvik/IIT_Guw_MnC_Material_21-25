function E = calculate_errors(dx_array, dt_array, method, a, c, b, d, f1, g1, g2, delta)
    T = 1; K = 10; r = 0.06; sigma = 0.3;
    % Initialize error array
    E = zeros(1, length(dx_array));

    % Exact solution function
    fun = @(x,tau) (1 / (2 * sqrt(pi * tau))) * integral(@(s) f1(s) .* exp(-(x-s).^2 / (4*tau)), -12, 12, 'ArrayValued', true);

    for i = 1:length(dx_array)
        dx = dx_array(i);
        dt = dt_array(i);

        % Choose the method based on input
        switch method
            case 'BTCS'
                [approximations, x, tau] = BTCS(a, c, b, d, dx, dt, 1, f1, g1, g2);
            case 'Runge-Kutta'
                [approximations, x, tau] = MOHL_Runge_Kutta(a, c, b, d, dx, dt, f1, g1, g2);
            otherwise
                error('Invalid method selected');
        end

        % Calculate the exact solution
        actual = zeros(length(tau), length(x));
        for j = 1:length(x)
            for k = 1:length(tau)
                actual(k, j) = fun(x(j), tau(k));
            end
        end

        % Uncomment the following if you need to apply any transformation
        % [approximations, ~, ~] = transform(x, tau, approximations, T, K, r, sigma, delta);
        % [actual, ~, ~] = transform(x, tau, actual, T, K, r, sigma, delta);

        % Compute the maximum absolute error
        E(1,i) = max(max(abs(approximations - actual)));
    end

    % Plot the errors in a log-log scale
    figure;
    loglog(dx_array, E, 'LineWidth', 1);
    xlabel('Δx');
    ylabel('Max Abs Error');
    title(strcat(method, ' Method: Convergence Analysis'));
    hold off;
end
