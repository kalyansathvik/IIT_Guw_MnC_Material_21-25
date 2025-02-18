%inputs
h = 0.05;
k = h^2 / 2;
a = -4;
b = 2;
T = 1;
    
r = 0.06;
sig = 0.3;
del = 0;
K = 10;
    
q = 2 * r / (sig ^ 2);
q_del = 2 * (r - del) / (sig ^ 2);
    
g1 = @(x, t) zeros(size(t));
g2 = @(x, t) exp(0.5 * x * (q_del + 1) + 0.25 * t * (q_del + 1) ^ 2);
    
phi_func = @(x) exp(0.5 * x * (q_del + 1)) - exp(0.5 * x * (q_del - 1)); 
phi = @(x) phi_func(x) .* (phi_func(x) >= 0);

N = (b-a)/h;
M = ceil(T * (sig ^ 2) / 2*k);
x = linspace(a, b, N + 1);
tau = linspace(0, T * (sig ^ 2) / 2, M + 1);
lamb = k / (h ^ 2);

%compute
[U1, S1, t1] = BTCS(N, M, x, tau, lamb, K, T, sig, q, q_del, g1, g2, phi);
[U2, S2, t2] = FTCS(N, M, x, tau, lamb, K, T, sig, q, q_del, g1, g2, phi);
[U3, S3, t3] = CrankNicolson(N, M, x, tau, lamb, K, T, sig, q, q_del, g1, g2, phi);

%Numerical Solution plot
figure;
hold on;
plot(S1, U1(end, :), 'b--', 'DisplayName', 'BTCS Solution', 'LineWidth', 1.5);
plot(S2, U2(end, :), 'g--', 'DisplayName', 'FTCS Solution', 'LineWidth', 1.5);
plot(S3, U3(end, :), 'r--', 'DisplayName', 'Crank-Nicolson Solution', 'LineWidth', 1.5);
xlabel('S');
ylabel('u(S, T)');
title('Solutions of BTCS, FTCS, and Crank-Nicolson Schemes');
legend show;
hold off;

%surface plots
PlotSurface(S1,t1,U1,'Surface plot for BTCS');
PlotSurface(S2,t2,U2,'Surface plot for FTCS');
PlotSurface(S3,t3,U3,'Surface plot for Crank-Nicolson');
