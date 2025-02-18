function [U, x, t] = MOHL_Runge_Kutta(a,c,b,d,dx,dt,f1,g1,g2)
    x = a:dx:b;
    t = c:dt:d;
    
    N = length(x);
    M = length(t);

    U = zeros(M, N);
    
    U(1:end, 1) = g1(t);
    U(1:end, end) = g2(t);
    U(1, 1:end) = f1(x);
    
    A = diag(ones(1,M-2),1) + diag(-1*ones(1,M-2), -1);
    beta = zeros(M-1,1);
    z = zeros(M-1,1);

    for j=1:N-2
        beta(1,1) = f1(x(j));
        K11 = dx * z;
        K12 = (dx/dt) * (A*U(2:M,j) - beta);

        beta(1,1) = f1(x(j) + dx);
        K21 = dx*(z + K12);
        K22 = (dx/dt) * (A * (U(2:M,j) + K11) - beta);
        
        z = z + K12/2 + K22/2;
        U(2:M, j+1) = U(2:M, j) + K11/2 + K21/2;
    end
end