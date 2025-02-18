clc,clear;                

%part a
ic = @(x) 2*sin(2*pi.*x);      %Initial Condition
bc_1 = @(t) 0;                                  %Boundary Condition 1
bc_2 = @(t) 0;                                  %Boundary Condition 2
a_x = 0;                                        %Range x 
b_x = 1;
a_t = 0;                                        %Range t
b_t = 1;
h = 0.04;
k = h^2/4;                                 %k = h^2/4
c = 1/16;
exact_sol = @(x,t) 2*exp(-(pi*pi*t)/4).*sin(2*pi*x);
% fprintf('\t\t FTCS\n');
[num_sol x t] = ftcs(c,a_x,b_x,a_t,b_t,h,k,ic,bc_1,bc_2);
plot_end_time(exact_sol,num_sol,x,t);
surface_plot(exact_sol,num_sol,x,t);
% plot_N_Max_error('ftcs',c,a_x,b_x,a_t,b_t,ic,bc_1,bc_2,exact_sol);

% fprintf('\t\tBTCS\n');
[num_sol x t] = btcs(c,a_x,b_x,a_t,b_t,h,k,ic,bc_1,bc_2);
plot_end_time(exact_sol,num_sol,x,t);
surface_plot(exact_sol,num_sol,x,t);
% plot_N_Max_error('btcs',c,a_x,b_x,a_t,b_t,ic,bc_1,bc_2,exact_sol);

% fprintf('\t\tCrank Nicolson\n');
[num_sol x t] = Crank_Nicolson(c,a_x,b_x,a_t,b_t,h,k,ic,bc_1,bc_2);
plot_end_time(exact_sol,num_sol,x,t);
surface_plot(exact_sol,num_sol,x,t);
% plot_N_Max_error('crank nicolson',c,a_x,b_x,a_t,b_t,ic,bc_1,bc_2,exact_sol);




%part b
ic = @(x) sin(pi.*x/2) + 0.5*sin(2*pi*x);      %Initial Condition
bc_1 = @(t) 0;                                  %Boundary Condition 1
bc_2 = @(t) exp(-(pi*pi*t/4));                                  %Boundary Condition 2
a_x = 0;                                        %Range x 
b_x = 1;
a_t = 0;                                        %Range t
b_t = 1;
h = 0.04;
k = h^2/4;                                 %k = h^2/4
c = 1;
exact_sol = @(x,t) exp(-(pi*pi*t/4)).*sin(pi*x/2) + 0.5*exp(-(pi*pi*t*4)).*sin(pi*x*2) ;
% fprintf('\t\t FTCS\n');
[num_sol x t] = ftcs(c,a_x,b_x,a_t,b_t,h,k,ic,bc_1,bc_2);
plot_end_time(exact_sol,num_sol,x,t);
surface_plot(exact_sol,num_sol,x,t);
% plot_N_Max_error('ftcs',c,a_x,b_x,a_t,b_t,ic,bc_1,bc_2,exact_sol);

% fprintf('\t\tBTCS\n');
[num_sol x t] = btcs(c,a_x,b_x,a_t,b_t,h,k,ic,bc_1,bc_2);
plot_end_time(exact_sol,num_sol,x,t);
surface_plot(exact_sol,num_sol,x,t);
% plot_N_Max_error('btcs',c,a_x,b_x,a_t,b_t,ic,bc_1,bc_2,exact_sol);

% fprintf('\t\tCrank Nicolson\n');
[num_sol x t] = Crank_Nicolson(c,a_x,b_x,a_t,b_t,h,k,ic,bc_1,bc_2);
plot_end_time(exact_sol,num_sol,x,t);
surface_plot(exact_sol,num_sol,x,t);
% plot_N_Max_error('crank nicolson',c,a_x,b_x,a_t,b_t,ic,bc_1,bc_2,exact_sol);




%FUNCTIONS
function plot_end_time(exact_sol,num_sol,x,t)
figure;
[n m] = size(num_sol);
plot(x,num_sol(n,:),'g+');
hold on;
plot(x,exact_sol(x,t(n)),'b');
hold off;
legend('Numerical Solution','Exact Solution');
title('Plot of exact and Numerical Solution at Final time');


end

function surface_plot(exact_sol,num_sol,x,t)
    figure;
    subplot(1,2,1);
    mesh(x,t,num_sol);
    subplot(1,2,2);
    [X Y] = meshgrid(x,t);
    surf(X,Y,exact_sol(X,Y));
    title('Surface plot of Numerical Solution and Exact solution');
end

%scheme-ftcs,btcs,Crank Nicolson etc.
function plot_N_Max_error(scheme,c,a_x,b_x,a_t,b_t,ic,bc_1,bc_2,exact_sol) 
    i = 1;
    N = 1;
    for N = 10:20:90
        h = (b_x - a_x)/(N-1);
        k = h^2/8;
        if scheme=='ftcs'
            [U x t] = ftcs(c,a_x,b_x,a_t,b_t,h,k,ic,bc_1,bc_2);
        elseif scheme=='btcs'
            [U x t] = btcs(c,a_x,b_x,a_t,b_t,h,k,ic,bc_1,bc_2);
        elseif scheme=='crank nicolson'
            [U x t] = Crank_Nicolson(c,a_x,b_x,a_t,b_t,h,k,ic,bc_1,bc_2);
        else
            [U x t] = Richardson(c,a_x,b_x,a_t,b_t,h,k,ic,bc_1,bc_2);
        end
        error = abs(exact_sol(x',t) - U');
        Max_error(i) = max(max(error));
        i = i+1;
        
    end
    figure;
    plot([10:20:90],log(Max_error));
    xlabel('N');
    ylabel('log(Max Error)');
    title('N vs Error');    

end