function NewtonsMethod(initialGuess, maxIterations, noLimit, tolerance, f, j, n)
    x = initialGuess;
    history = zeros(0, n);
    errors = [];

    history(end+1, :) = x;
    iters = 0;
    while(iters<maxIterations+1 || noLimit)
        iters = iters+1;
        delta_x = -j(x)\f(x);
  
        x = x + delta_x;
        history(end+1, :) = x;
        errors = [errors, abs(norm(delta_x))];

        if(iters == maxIterations+1 && ~noLimit)
          res = x-delta_x;
        end

        if abs(norm(delta_x)) < tolerance
            disp(['Converged in ', num2str(iters), ' iterations.']);
            res = x - delta_x;
            break;
        end
    end
    
    vectorPrinter(res, n, "Final Solution");
    disp(['Residue: ', num2str(abs(norm(f(res')')))]);
    vectorPrinter(x, n, "Exact Solution");
    disp(['Error: ', num2str(abs(norm(x-res)'))])
    fprintf("\nIteration Table:\n");
    fprintf("\nIteration\t|Iterate\t|Error\n")
    for i = (1:iters)
      fprintf("%d\t| [", i-1);
      for j = (1:n)  
        if(j<n)
          fprintf("%f,", history(i, j));
        else
          fprintf("%f", history(i, j));
        end
      end
      fprintf("]\t|");
      fprintf("%f\t\n", errors(i));
    end
    figure;
    for i = (1:n)
      subplot(n, 1, i);
      loglog(1:(iters+1), abs(history(:, i) - x(i)), '-o');
      title(['Component', num2str(i)]);
      xlabel('Iteration');
      ylabel('Absolute Error');
    end
    sgtitle('Convergence of Solution Components');
  
    figure;
    orders = log(errors(3:end)./errors(2:end-1))./log(errors(2:end-1)./errors(1:end-2));
    loglog(orders, errors(3:end), '-o');
    xlabel('Convergence Order');
    ylabel('Error');
    title('Log-Log Plot: Error vs Iteration Order');
    
    if(n==2)
      xs = linspace(initialGuess(1)-2, initialGuess(1)+2, 100);
      ys = linspace(initialGuess(2)-2, initialGuess(2)+2, 100);
      zs1 = zeros(100, 100);
      zs2 = zeros(100, 100);
      for i = (1:100)
        for j = (1:100)
          z = f([xs(i); ys(j)]);
          zs1(i, j) = z(1);
          zs2(i, j) = z(2);
        end
      end
      figure;
      subplot(2, 1, 1);
      plot3(xs, ys, zs1);
      grid on;
      xlabel('x');
      ylabel('y');
      zlabel('f(x, y)');
      title('Function plot for first component');
      subplot(2, 1, 2);
      plot3(xs, ys, zs2);
      grid on;
      xlabel('x');
      ylabel('y');
      zlabel('f(x, y)');
      title('Function plot for second component');
    end

end

