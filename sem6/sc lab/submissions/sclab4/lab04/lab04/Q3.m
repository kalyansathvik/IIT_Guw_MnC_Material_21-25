
fprintf("\n\n############ (3) ############\n");

NewtonsMethod([0;0;0], 1000, true, 1e-6, @f, @j, 3);

function [y] = f(x)
  y = [
    6*x(1) - 2*cos(x(2)*x(3)) - 1;
    9*x(2) + sqrt(x(1)^2 + sin(x(3)) + 1.06) + 0.9;
    60*x(3) + 3*exp(-1*x(1)*x(2)) + 10*pi - 3
  ];
end

function [y] = j(x)
  y = [
    6, 2*x(3)*sin(x(2)*x(3)), 2*x(2)*sin(x(2)*x(3));
    (1/(2*sqrt(x(1)^2 + sin(x(3))+1.06))) * 2*x(1), 9,  (1/(2*sqrt(x(1)^2 + sin(x(3))+1.06))) * cos(x(3));
    3*exp(-1*x(1)*x(2)) * -x(2), 3*exp(-1*x(1)*x(2))* -x(1), 60
  ];
end
