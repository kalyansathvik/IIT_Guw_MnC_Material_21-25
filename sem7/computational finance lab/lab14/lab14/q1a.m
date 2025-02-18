clc,clear;
N=2:60;
var=2;
maxerror = zeros(1, length(N));
z = 1;
for n = N
    m = n;
    a1 = 0; b1 = 0.5;
    a2 = 0; b2 = 0.5;
    f11 = @(x) 0; f12 = @(x) 200*x;
    f21 = @(y) 0; f22 = @(y) 200*y;

    h = (b1 - a1)/n; k = (b2 - a2)/m;
    lamda = (h/k)^2;

    A = zeros(n+1,m+1);
    Err = zeros(n+1,m+1);
    for i = 1:n+1
        A(i, 1) = f21(a1 + (i-1)*h);
        A(n-i+2, n+1) = f22(a1 + (i-1)*h);
        A(1, i) = f12(a2 + (i-1)*k);
        A(n+1, i) = f11(a2 + (i-1)*k);
    end

    B = zeros((n-1)*(m-1), (n-1)*(m-1));
    b = zeros((n-1)*(m-1),1);

    for p = 1:(n-1)*(m-1)
        B(p,p) = 2*(lamda^2+1);

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
                B(p, (i-1)*(n-2) + j - (n - i)) = -1;
            end
            if i < (n-1)
                B(p, (i+1)*(n-2) + j - (n - i - 2)) = -1;
            end
            if j > 1
                B(p, i*(n-2) + j - 1 - (n - i - 1)) = -lamda^2;
            end
            if j < (m-1)
                B(p, i*(n-2) + j + 1 - (n - i - 1)) = -lamda^2;
            end
        end

        % filling RHS matrix
        if i == 1
            b(p) = b(p) + A(1, j+1);
        elseif i == n-1
            b(p) = b(p) + A(n+1, j+1);
        end
        if n == 2
            b(p) = b(p) + A(n+1, j+1);
        end
        if j == 1
            b(p) = b(p) + A(i+1, 1);
        elseif j == n-1
            b(p) = b(p) + A(i+1, n+1);
        end
        if n == 2
            b(p) = b(p) + A(i+1, n+1);
        end
    end

    % disp(B);
    % disp(b);

    W = B \ b;
    p = 1;
    for i = 2:n
        for j = 2:n
            A(i, j) = W(p);
            x = a1 + (j-1)*h;
            y = b2 - (i-1)*k;
            Err(i, j) = abs(A(i, j) - 400*x*y);
            p = p+1;
        end
    end

    if var == n
        x = a1 : h : b1;
        y = b2 : -k : a2;
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
    
        x = a1 : 0.005 : b1;
        y = b2 : -0.005 : a2;
    
        [X,Y] = meshgrid(x,y);
        M = 400*X.*Y;
    
        figure
        mesh(X,Y,M,'FaceColor','interp', 'FaceAlpha',0.6, 'EdgeColor','black');
        hold on;
        contour(X,Y,M,'FaceColor','auto', 'FaceAlpha',0.6, 'EdgeColor','black');
        hold off;
    end
    maxerror(z) = max(max(Err));
    z = z+1;
end

delx = (b1 - a1)./N;

figure
loglog(delx, maxerror, 'LineWidth', 2);
hold off;
