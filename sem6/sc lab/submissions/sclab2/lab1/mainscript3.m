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

