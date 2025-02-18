function [y_ie, error] = ImplicitEuler(f, t0, tf, y0, h, act_f, printSet)
    t = t0:h:tf;
    y_ie = zeros(size(t));
    y_ie(1) = y0;

    for i = 2:length(t)
        y_ie(i) = iterator(y_ie(i-1), t(i), f, h, 1000);
    end

    y_act = act_f(t);
    errors = abs(y_act-y_ie);
    error = max(errors);
    if(printSet == 1)
        fprintf('Implicit Euler Method:\n');
        disp(table(t.', y_ie.', y_act.', errors.', 'VariableNames',{'t', 'approximation', 'actual', 'error'}))

        figure;
        hold on;
        plot(t, y_ie, 'b-', 'LineWidth', 1.5);
        plot(t, y_act, 'r--', 'LineWidth', 1.5);
        xlabel('x');
        ylabel('approximation');
        legend('Appromate Solution', 'Actual Solution', 'Location', 'best');
        title('x vs Approximation and Actual Solution');
        hold off;

        figure;
        plot(t, errors, 'k-', 'LineWidth', 1.5);
        xlabel('x');
        ylabel('Error');
        title('x vs Error');
    end
 
end

function y_new = iterator(y_old, t_i, f, h, maxIter)
    y_new = y_old;
    for iter = 1:maxIter
        y_new = y_old + h * f(t_i, y_new);
    end
end
