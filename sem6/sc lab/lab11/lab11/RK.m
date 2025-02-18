function [y_rk, error] = RK(a, b, f, t0, tf, y0, h, act_f, printSet)
    t = t0:h:tf;
    n = length(t)-1;
    y_rk = zeros(1, n);
    y_rk(1) = y0;
    c = sum(a,2);
    s = length(b);
    for i = 1:n
        k = [f(t(i),y_rk(i))];
        for j = 2:s
            tempy = 0;
            for temp = 1:j-1
                tempy = tempy + a(j,temp)*k(temp);
            end
            k(j) = f(t(i) + c(j)*h,y_rk(i)+tempy*h);
        end
        y_rk(i+1) = y_rk(i) + h*sum(b.*k);
    end
    y_act = act_f(t);
    errors = abs(y_act-y_rk);
    error = max(errors);
    if(printSet==1)
        fprintf('Runge Kutta Method %d order: \n', s);
        disp(table(t.', y_rk.', y_act.', errors.', 'VariableNames',{'t', 'approximation', 'actual', 'error'}))

        figure;
        hold on;
        plot(t, y_rk, 'b-', 'LineWidth', 1.5);
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
