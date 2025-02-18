function que1()
    % given values
    T = 1; K = 10; r = 0.06; sigma = 0.3; delta = 0;
    
    % taking x_min, x_max and defining tau_min, tau_max
    x_min = -2; x_max = 3;
    tau_min = 0; tau_max = sigma^2/2;
    dt = 5e-4; dx = sqrt(2*dt);
    
    q_delta = 2 * (r - delta)/sigma^2;
    
    % defining initial and boundary conditions
    init_cond = @(x) max(exp(x * (q_delta + 1) / 2) - exp(x * (q_delta - 1) / 2), 0);
    lbc = @(tau) 0;
    rbc = @(tau) exp((q_delta + 1) * x_max/2 + (q_delta + 1)^2 * tau/4);
    
    % BTCS
    [U, x, tau] = BTCS(x_min, tau_min, x_max, tau_max, dx, dt, 1, init_cond, lbc, rbc);

    [v, S, t] = transform(x, tau, U, T, K, r, sigma, delta);

    plots(v, S, t, ' BTCS');

    % MOHL Runge-Kutta
    [U, x, tau] = MOHL_Runge_Kutta(x_min, tau_min, x_max, tau_max, dx, dt, init_cond, lbc, rbc);

    [v, S, t] = transform(x, tau, U, T, K, r, sigma, delta);

    plots(v, S, t, ' MOHL Runge Kutta');

    dx_array = 3e-3:5e-4:2.5e-2;
    dt_array = 5e-4*ones(1,length(dx_array));

    calculate_errors(dx_array, dt_array, 'BTCS', x_min, tau_min, x_max, tau_max, init_cond, lbc, rbc, delta);
    calculate_errors(dx_array, dt_array, 'Runge-Kutta', x_min, tau_min, x_max, tau_max, init_cond, lbc, rbc, delta);
end