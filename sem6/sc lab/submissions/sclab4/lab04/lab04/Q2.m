
fprintf("\n\n############ (2) ############\n");

%######## (A) ############

fprintf("\n\n----------(A)----------\n");
NewtonsMethod([0; 1], 2, false, 1e-4, @f_A, @j_A, 2);

%######## (B) ############

fprintf("\n\n----------(B)----------\n");
NewtonsMethod([-1; 4], 5, false, 1e-4, @f_B, @j_B, 2);

function [y] = f_A(x)
  y = [
    4*x(1)^2-x(2)^2;
    4*x(1)*x(2)^2 - x(1) - 1;
  ];
end

function [y] = j_A(x)
  y = [
    8*x(1), -2*x(2);
    4*x(2)^2 - 1, 8*x(1)*x(2)
  ];
end

function [y] = f_B(x)
  y = [
    1+x(1)^2 - x(2)^2 + exp(x(1))*cos(x(2));
    2*x(1)*x(2) + exp(x(1)) * sin(x(2))
  ];
end

function [y] = j_B(x)
  y = [
    2*x(1) + exp(x(1))*cos(x(2)), -2*x(2) - sin(x(2))*exp(x(1));
    2*x(2) + exp(x(1))*sin(x(2)), 2*x(1) + exp(x(1))*cos(x(2));
  ];
end 
