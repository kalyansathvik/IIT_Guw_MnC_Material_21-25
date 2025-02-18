f1h=@f1;
result=bisection(f1h,0,1,0.01,100);
disp("1:"+result);

f2ah=@f2a;
result=bisection(f2ah,0.5,1.5,0.00001,100000);
disp("2a:");
format long;
disp(result);

f2bh=@f2b;
result=bisection(f2bh,0,4,0.00001,100000);
disp("2b:")
format long;
disp(result);

f2ch=@f2c;
result=bisection(f2ch,3,4,0.00001,100000);
disp("2c:")
format long;
disp(result);

f3ah=@f3a;
f3a_h=@f3a_;
result=newton(2,0.00001,f3ah,f3a_h);
disp("3a:");
format long;
disp(result);

f3bh=@f3b;
f3b_h=@f3b_;
result=newton(1,0.00001,f3bh,f3b_h);
disp("3b:");
format long;
disp(result);


f3ch=@f3c;
f3c_h=@f3c_;
result=newton(2,0.00001,f3ch,f3c_h);
disp("3c:");
format long;
disp(result);

f3dh=@f3d;
f3d_h=@f3d_;
result=newton(6,0.00001,f3dh,f3d_h);
disp("3d:");
format long;
disp(result);

f4_h=@f4_;
format long;
result=newton(0.0001,0.00005,@f4,f4_h);

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

result=newton(0.1,0.000001,@f6,@f6_);
disp("6:");
format long;
disp(result);

result=newton(2,0.000001,@f7,@f7_);
disp("7:");
format long;
disp(result);




