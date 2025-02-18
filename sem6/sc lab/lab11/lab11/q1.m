a4=[0,0,0,0;1/2,0,0,0;0,1/2,0,0;0,0,1,0];
b4=[1/6,1/3,1/3,1/6];
a2=[0,0;1/2,0];
b2=[0,1];

% ##### (a) #####
% fprintf('\n#### (a) ####\n');
% fa = @(t, y) 1 + y./t + (y./t).^2;
% act_a = @(t) t .* tan(log(t));
%
% ImplicitEuler(fa, 1, 3, 0, 0.2, act_a, 1);
% Plotter(fa, 1, 3, 0, act_a, 1);
%
% RK(a2, b2, fa, 1, 3, 0, 0.2, act_a, 1);
% Plotter(fa, 1, 3, 0, act_a, 2);
%
% RK(a4, b4, fa, 1, 3, 0, 0.2, act_a, 1);
% Plotter(fa, 1, 3, 0, act_a, 3);

% ##### (b) #####
fprintf('\n#### (b) ####\n');

fb = @(t, y) -t.*y + 4.*t.*(1./y);
act_b = @(t) sqrt(4-3.*exp(-1.*t.^2));

ImplicitEuler(fb, 0, 1, 1, 0.1, act_b, 1);
Plotter(fb, 0, 1, 1, act_b, 1);

RK(a2, b2, fb, 0, 1, 1, 0.1, act_b, 1);
Plotter(fb, 0, 1, 1, act_b, 2);

RK(a4, b4, fb, 0, 1, 1, 0.1, act_b, 1);
Plotter(fb, 0, 1, 1, act_b, 3);

clear;
