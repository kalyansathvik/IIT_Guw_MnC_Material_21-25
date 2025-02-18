
fprintf("\n\n############ (1) ############\n");

NewtonsMethod([1;1;1], 6, false, 1e-6, @F, @J, 3);

clear;

function [y] = F(x)
  y = [
    x(1)*x(2) - x(3)^2 - 1;
    x(1)*x(2)*x(3) + x(2)^2 - x(1)^2 - 2;
    exp(x(1)) + x(3) - exp(x(2)) - 3
  ];
end

function [y] = J(x)
  y = [
    x(2), x(1), -2*x(3);
    x(2)*x(3) - 2*x(1), x(1)*x(3) + 2*x(2), x(1)*x(2);
    exp(x(1)), -exp(x(2)), 1
  ];
end


