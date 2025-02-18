function Plotter(f_prime, a, b, y0, sol, type)
    a4=[0,0,0,0;1/2,0,0,0;0,1/2,0,0;0,0,1,0];
    b4=[1/6,1/3,1/3,1/6];
    a2=[0,0;1/2,0];
    b2=[0,1];

    errors = zeros(1, 11);
    N = 2.^(2:12);
    for i = 1:11
        if(type == 1)
            [~, e] = ImplicitEuler(f_prime, a, b, y0, (b-a)/N(i), sol, 0);
        elseif(type == 2)
            [~, e] = RK(a2, b2, f_prime, a, b, y0, (b-a)/N(i), sol, 0);
        else
            [~, e] = RK(a4, b4, f_prime, a, b, y0, (b-a)/N(i), sol, 0);
        end
        errors(i) = e;
    end
    
    figure;
    orderOfConvergence = log2(errors(1:end-1)./errors(2:end));
    plot(N(1:end-1), orderOfConvergence, '-o', 'LineWidth', 1.5);
    title('N vs order of convergence');
    
    figure;
    loglog(N, errors, '-o', 'LineWidth', 1.5);
    title('N vs error(loglog plot)');
end
