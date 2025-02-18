syms x;
n = 6;  % Degree of the Legendre polynomial

% Define the Legendre polynomial using legendreP
p = legendreP(n, x);

% Find the roots using solve
roots = solve(p == 0);

% Display the symbolic roots (might involve radicals)
disp(['Roots of Legendre polynomial of degree ', num2str(n), ':']);
disp(roots);