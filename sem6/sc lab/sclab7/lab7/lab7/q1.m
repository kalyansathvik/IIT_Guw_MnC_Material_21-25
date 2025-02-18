fvalues=[[0.86199480,0.95802009,1.0986123,1.2943767];[0.15536240,0.23269654,0.33333333,0.45186776]];
x=[-1,-0.5,0,0.5];

% x=[-1,0,1];
% fvalues=[[2,1,2];[-8,0,8];[56,0,56]];
% disp(hermite(x,fvalues));

format long;
answ=polyval(hermite(x,fvalues),0.25);
disp("f(0.25) from hermite:")
disp(answ)
disp("absolute error:")
disp(abs(answ-log(exp(0.25+2))));
% 

