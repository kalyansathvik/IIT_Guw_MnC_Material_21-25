function [x,y,U] = Gauss_Seidel(X,Y,dx,dy,ux1,ux2,uy1,uy2,qsn,g)
N = X/dx + 1;
M = Y/dy + 1;
x=zeros(N,1);
y=zeros(M,1);
for i=1:N
    x(i) = 0 + (i-1)*dx;
end
for i=1:M
    y(i) = 0 + (i-1)*dy;
end

U = zeros(M,N);
U(1,1:N) = ux1(x(1:N));
U(M,1:N) = ux2(x(1:N));
U(1:M,1) = uy1(y(1:M));
U(1:M,N) = uy2(y(1:M));

max_iter = 50;

if qsn=='a'
    for k=1:max_iter
        for i=2:M-1
            for j=2:N-1
                U(i,j) = (U(i-1,j) + U(i+1,j) + U(i,j+1) + U(i,j-1))/4;
            end
        end
    end
else
    h=dx;
    for k=1:max_iter
        for i=2:M-1
            for j=2:N-1
                U(i,j) = (-1/(h*(h+2)-4))*((1-h)*U(i-1,j) + U(i+1,j) + U(i,j+1) + (1-h)*U(i,j-1) - (h^2)*g(i*h,j*h));
            end
        end
    end
end
end