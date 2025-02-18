function contour_plot(x,y,z)
[c,h] = contourf(x,y,z,25);
clabel(c,h);
end