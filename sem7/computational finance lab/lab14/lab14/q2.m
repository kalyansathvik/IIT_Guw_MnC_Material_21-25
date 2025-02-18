clc,clear;
ux1 = @(x) x-x;
ux2 = @(x) 200*x;
uy1 = @(y) y-y;
uy2 = @(y) 200*y;
g = @(x,y) x-x + y-y;
[x,y,U] = Gauss_Seidel(0.5,0.5,0.1,0.1,ux1,ux2,uy1,uy2,'a',g);

figure;
surface_plot(x,y,U);
figure;
contour_plot(x,y,U);

ux1 = @(x) exp(x);
ux2 = @(x) exp(x)*cos(1);
uy1 = @(y) cos(y);
uy = @(y) exp(1)*cos(y);
g = @(x,y) exp(x)*(2*cos(y)-sin(y));
[x,y,U] = Gauss_Seidel(1,1,0.2,0.2,ux1,ux2,uy1,uy2,'b',g);

figure;
surface_plot(x,y,U);
figure;
contour_plot(x,y,U);