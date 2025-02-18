LinearShooting(@y_2, 0, pi/2, -0.3, -0.1, @y, pi/4);
LinearShooting(@y_2, 0, pi/2, -0.3, -0.1, @y, pi/8);


function ret = y_2(x, y, y_1)
  ret = y_1 + 2.*y + cos(x);
end

function ret = y(x)
  ret = -1.*0.1 .* (sin(x) + 3.*cos(x));
end
