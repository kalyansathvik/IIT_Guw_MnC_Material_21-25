function [U, x, t] = BTCS(a,c,b,d,dx,dt,alpha,f1,g1,g2)
    lamda = (alpha*dt)/(dx^2);

    x = a:dx:b;
    t = c:dt:d;
    
    N = length(x);
    M = length(t);

    U = zeros(M, N);
    
    U(1:end, 1) = g1(t);
    U(1:end, end) = g2(t);
    U(1, 1:end) = f1(x);
    
    for i = 2:M
        A = zeros(N, N);
        b = zeros(N, 1);
        
        A(1:N+1:end) = 1 + 2*lamda;
        A(2:N+1:end) = -lamda;
        A(N+1:N+1:end) = -lamda;
        
        A(1,1) = 1;
        A(1,2) = 0;
        A(N,N) = 1;
        A(N,N-1) = 0;
        
        b(2:N-1) = U(i-1,2:N-1);
        b(1) = U(i,1);
        b(end) = U(i,end);

        U(i,:) = (A\b)';
    end
end