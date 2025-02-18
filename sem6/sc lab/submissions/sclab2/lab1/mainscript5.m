result=newton(-0.5,0.000001,@f5,@f5_);
disp("5:newton");
format long;
disp(result);

result=newton(0.5,0.000001,@f5,@f5_);
disp("5:newton");
format long;
disp(result);

result=bisection(@f5,-1,0,0.000001,1000000);
disp("5:bisection");
format long;
disp(result);

result=bisection(@f5,0,1,0.000001,1000000);
disp("5:bisection");
format long;
disp(result);



