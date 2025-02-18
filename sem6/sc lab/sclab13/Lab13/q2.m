fprintf("\n\n######(a)######\n\n")
Difference(@y_2_a, 1, 2, 0.5, log(2), 1, 0, 0, 10, @y_a);
Difference(@y_2_a, 1, 2, 0.5, log(2), 1, 0, 1, 10, @y_a);
Difference(@y_2_a, 1, 2, 0.5, log(2), 1, 0, -1, 10, @y_a);

fprintf("\n\n######(b)######\n\n")
Difference(@y_2_b, 0, 2, 0, -4, 1, 0, 0, 10, @y_b);
Difference(@y_2_b, 0, 2, 0, -4, 1, 0, 1, 10, @y_b);
Difference(@y_2_b, 0, 2, 0, -4, 1, 0, -1, 10, @y_b);

fprintf("\n\n######(c)######\n\n")
Difference(@y_2_c, 0, pi/2, -0.1, 0.3, 0, 1, 0, 10, @y_c);
Difference(@y_2_c, 0, pi/2, -0.1, 0.3, 0, 1, 1, 10, @y_c);
Difference(@y_2_c, 0, pi/2, -0.1, 0.3, 0, 1, -1, 10, @y_c);

fprintf("\n\n######(d)######\n\n")
Difference(@y_2_d, -1, 0, -2, 1, 0, 1, 0, 10, @y_d);
Difference(@y_2_d, -1, 0, -2, 1, 0, 1, 1, 10, @y_d);
Difference(@y_2_d, -1, 0, -2, 1, 0, 1, -1, 10, @y_d);

fprintf("\n\n######(e)######\n\n")
Difference(@y_2_e, 0, 1, exp(1)-3, 1-2*exp(-1), 1, 1, 0, 10, @y_e);
Difference(@y_2_e, 0, 1, exp(1)-3, 1-2*exp(-1), 1, 1, 1, 10, @y_e);
Difference(@y_2_e, 0, 1, exp(1)-3, 1-2*exp(-1), 1, 1, -1, 10, @y_e);

fprintf("\n\n######(f)######\n\n")
Difference(@y_2_f, 0, pi/4, sqrt(2), 2-sqrt(2), 1, 1, 0, 10, @y_f);
Difference(@y_2_f, 0, pi/4, sqrt(2), 2-sqrt(2), 1, 1, 1, 10, @y_f);
Difference(@y_2_f, 0, pi/4, sqrt(2), 2-sqrt(2), 1, 1, -1, 10, @y_f);

% ---- functions ---------------------------
function ret = y_2_a(x, y, y_1)
  ret = (-4./x).*y_1 + (-2./x.^2).*y + (2.*log(x))./(x.^2);
end

function ret = y_a(x)
  ret = 4./x - 2./(x.^2) + log(x) - 3./2;
end

function ret = y_2_b(x, y, y_1)
  ret = 2.*y_1 - y + x.*exp(x) - x;
end 

function ret = y_b(x)
  ret = (1./6).*(x.^3).*exp(x) - (5./3).*x.*exp(x) + 2.*exp(x) - x - 2;
end

function ret = y_2_c(x, y, y_1)
  ret = y_1 + 2.*y + cos(x);
end 

function ret = y_c(x)
  ret = (-1./10).*(sin(x) + 3.*cos(x));
end 

function ret = y_2_d(x, y, y_1)
  ret = -x.*y_1 + 2.*y + 2 + (2 + x.^2).*exp(x);
end

function ret = y_d(x)
  ret = x.^2 + x.*exp(x);
end

function ret = y_2_e(x, y, y_1)
  ret = -2.*y_1 - y + x;
end

function ret = y_e(x)
  ret = 2.*exp(-x) + (exp(1)-2).*x.*exp(-x) + x - 2;
end

function ret = y_2_f(x, y, y_1)
  ret = cos(x).*y_1 + y + ((sqrt(2) - 1) .* cos(x) .* cos(x) - sin(2.*x) ./ 2);
end

function ret = y_f(x)
  ret = cos(x) + (sqrt(2) - 1) .* sin(x);
end
