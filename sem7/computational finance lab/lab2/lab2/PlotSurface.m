function PlotSurface(S,t,U,title_name)
    figure();
    surf(S, t, U);
    title(title_name);
    xlabel('S');
    ylabel('t');
    zlabel('u(S, t)');
    colorbar;
end

