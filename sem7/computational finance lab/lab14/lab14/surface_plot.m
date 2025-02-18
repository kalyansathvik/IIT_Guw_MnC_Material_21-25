function surface_plot(x,y,z)
surf(x,y,z);
shading interp;
xlabel('X');
ylabel('Y');
zlabel('Z');
title('Surface Plot');
end