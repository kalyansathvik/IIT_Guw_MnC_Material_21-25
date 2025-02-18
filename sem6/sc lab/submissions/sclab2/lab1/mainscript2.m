
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




