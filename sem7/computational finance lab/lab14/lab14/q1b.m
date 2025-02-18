clc,clear;
N=2:60;
var=5;
f = @(x,y) exp(x).*(2*cos(y) - sin(y));
actual_soln = @(x,y) exp(x).*cos(y);
maxerror = zeros(1, length(N));
z = 1;
for k = 1:length(N)
    a = 0; b = 1;
    n = N(k);
    h = (b - a)/n;

    x = a : h : b;
    y = b : -h : a;

    A = zeros(n+1,n+1);
    Err = zeros(n+1,n+1);

    A(:, 1) = actual_soln(x(1), y);
    A(:, end) = actual_soln(x(end), y);
    A(1, :) = actual_soln(x, y(1));
    A(end, :) = actual_soln(x, y(end));

    B = zeros((n-1)^2, (n-1)^2);
    b = zeros((n-1)^2,1);

    for p = 1:(n-1)^2
        B(p,p) = -4 - 2*h + h^2;

        % determining point number
        j = mod(p, n-1);
        if j == 0
            i = p / (n-1);
            j = n-1;
        else
            i = floor(p / (n-1)) + 1;
        end

        % filling the coefficient matrix
        if n > 2
            if i > 1
                B(p, (i-1)*(n-2) + j - (n - i)) = 1;
            end
            if i < (n-1)
                B(p, (i+1)*(n-2) + j - (n - i - 2)) = 1+h;
            end
            if j > 1
                B(p, i*(n-2) + j - 1 - (n - i - 1)) = 1;
            end
            if j < (n-1)
                B(p, i*(n-2) + j + 1 - (n - i - 1)) = 1+h;
            end
        end

        % filling RHS matrix
        b(p) = h^2*f(x(j+1), y(i+1));
        if i == 1
            b(p) = b(p) - A(1, j+1);
        elseif i == n-1
            b(p) = b(p) + A(n+1, j+1)*(-h-1);
        end
        if n == 2
            b(p) = b(p) - A(n+1, j+1)*(1+h);
        end
        if j == 1
            b(p) = b(p) - A(i+1, 1);
        elseif j == n-1
            b(p) = b(p) + A(i+1, n+1)*(-h-1);
        end
        if n == 2
            b(p) = b(p) - A(i+1, n+1)*(1+h);
        end
    end

    % disp(B);
    % disp(b);

    W = B \ b;
    p = 1;
    for i = 2:n
        for j = 2:n
            A(i, j) = W(p);
            Err(i, j) = abs(A(i, j) - actual_soln(x(j),y(i)));
            p = p+1;
        end
    end

    if var == n
        disp(A);

        [X,Y] = meshgrid(x,y);
        figure
        mesh(X,Y,A,'FaceColor','interp', 'FaceAlpha',0.6, 'EdgeColor','black');
        hold on;
        contour(X,Y,A,'FaceColor','auto', 'FaceAlpha',0.6, 'EdgeColor','black');
        hold off;

        figure
        mesh(X,Y,Err,'FaceColor','interp', 'FaceAlpha',0.6, 'EdgeColor','black');
        hold off;

        x = 0 : 0.005 : 1;
        y = 1 : -0.005 : 0;

        [X,Y] = meshgrid(x,y);
        M = f(X,Y);

        figure
        mesh(X,Y,M,'FaceColor','interp', 'FaceAlpha',0.6, 'EdgeColor','black');
        hold on;
        contour(X,Y,M,'FaceColor','auto', 'FaceAlpha',0.6, 'EdgeColor','black');
        hold off;
    end
    maxerror(z) = max(max(Err));
    z = z+1;
end

delx = (1 - 0)./N;

figure
loglog(delx, maxerror, 'LineWidth', 2);
hold off;
