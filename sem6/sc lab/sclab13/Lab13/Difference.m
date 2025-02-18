function Difference(y_2, a, b, ya, yb, c, d, forward, N, act_f)
  N = N-2;
  h = (b-a)/(N+2);
  x = linspace(a, b, N+2);
  A = zeros(N+2, N+2);
  B = zeros(N+2, 1);
 
  p = @(x) y_2(x, 0, 1) - y_2(x, 0, 0);
  q = @(x) y_2(x, 1, 0) - y_2(x, 0, 0);
  r = @(x) y_2(x, 0, 0);

  for i = (2:N+1)
    % central difference for y'
    if(forward == 0)
      A(i, i-1) = -1 - (h/2)*p(x(i));
      A(i, i) = 2 + (h^2)*q(x(i));
      A(i, i+1) = -1 + (h/2)*p(x(i));
    % forward difference for y'
    elseif(forward == 1)
      A(i, i-1) = -1;
      A(i, i) = 2 + (h^2)*q(x(i)) - h*p(x(i));
      A(i, i+1) = -1 + h*p(x(i));
    % backward difference for y'
    elseif(forward == -1)
      A(i, i-1) = -1 - h*p(x(i));
      A(i, i) = 2 + (h^2)*q(x(i)) + h*p(x(i));
      A(i, i+1) = -1;
    end
    B(i) = -(h^2)*r(x(i));
  end

  A(1, 1) = c - d/h;
  A(1, 2) = d/h;
  B(1) = ya;
  A(N+2, N+1) = -d/h;
  A(N+2, N+2) = c + d/h;
  B(N+2) = yb;

  y_approx = A\B;
  % y_approx = [ya y_approx']';

  y_exact = act_f(x);

  errors = round(abs(y_exact'-y_approx), 4);
  if(forward == 0)
    fprintf('\n\nUsing Central Difference method with N: %d\n\n', N+2);
  elseif(forward == 1)
    fprintf('\n\nUsing Forward Difference method with N: %d\n\n', N+2);
  elseif(forward == -1)
    fprintf('\n\nUsing Backward Difference method with N: %d\n\n', N+2);
  end 
  disp(table(x', y_approx, y_exact', errors, 'VariableNames', {'t', 'approx', 'exact', 'error'}));
  
  figure;
  plot(x, y_approx, 'r-', x, y_exact, 'k--', 'LineWidth', 1.5);
  legend('Approximate', 'Exact');
  xlabel('x');
  ylabel('y(x)');
  title('Approximate and Exact vs x');
end
