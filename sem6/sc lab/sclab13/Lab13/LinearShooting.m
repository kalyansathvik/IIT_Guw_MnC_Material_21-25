function LinearShooting(y_2, a, b, ya, yb, act_y, h)
  N = (b-a)/h;

  u1 = zeros(1, N+1);
  u2 = zeros(1, N+1);
  v1 = zeros(1, N+1);
  v2 = zeros(1, N+1);
  u1(1) = ya;
  v2(1) = 1;

  p = @(x) y_2(x, 0, 1) - y_2(x, 0, 0);
  q = @(x) y_2(x, 1, 0) - y_2(x, 0, 0);
  r = @(x) y_2(x, 0, 0);
  r_1 = @(x) 0;

  for i = (1:N)
    xi = a + (i-1) * h;
    [u1(i+1), u2(i+1)]=iterator(xi, h, u1, u2, p, q, r, i);
    [v1(i+1), v2(i+1)]=iterator(xi, h, v2, v2, p, q, r_1, i);
  end
  k = (yb-u1(end))/v1(end);
  y_approx = u1 + k*v1;
  t = a:h:b;
  y_exact = act_y(t);
  errors = round(abs(y_exact-y_approx), 4);
  fprintf('\n\nUsing Linear Shooting method with h: %.4f\n\n', h);
  disp(table(t', y_approx', y_exact', errors', 'VariableNames', {'t', 'approx', 'exact', 'error'}));

  figure;
  plot(t, y_approx, 'r-', t, y_exact, 'k--', 'LineWidth', 1.5);
  legend('Approximation', 'Exact');
  xlabel('x');
  ylabel('y(x)');
  title('Numerical solution and Exact solution');
end

function [u1next, u2next] = iterator(xi, h, u1, u2, p, q, r, ind)
  k_1_1 = h * u2(ind);
  k_1_2 = h * (p(xi)*u2(ind) + q(xi)*u1(ind) + r(xi));
  k_2_1 = h * (u2(ind) + 0.5*k_1_2);
  k_2_2 = h * (p(xi+h/2)*(u2(ind)+0.5*k_1_2) + q(xi+h/2)*(u1(ind)+0.5*k_1_1) + r(xi+h/2));
  k_3_1 = h * (u2(ind) + 0.5*k_2_2);
  k_3_2 = h * (p(xi + h/2) * (u2(ind) + 0.5 * k_2_2) + q(xi + h/2) * (u1(ind) + 0.5 * k_2_1) + r(xi + h/2));
  k_4_1 = h * (u2(ind) + k_3_2);
  k_4_2 = h * (p(xi + h) * (u2(ind) + k_3_2) + q(xi + h) * (u1(ind) + k_3_1) + r(xi + h));

  u1next = u1(ind) + (k_1_1 + 2*k_2_1 + 2*k_3_1 + k_4_1) / 6;
  u2next = u2(ind) + (k_1_2 + 2*k_2_2 + 2*k_3_2 + k_4_2) / 6;
end
