t=[0,3,5,8,13];
s=[0,225,383,623,993];

disp("5a:");
disp("at t=10:")
disp("position:")
fun=naturalspline(t,s);
disp(polyval(fun{3},10))
fun2=polyder(fun{3});
disp("speed:")
disp(polyval(fun2,10));

t=[0,3,5,8,13];
s=[0,225,383,623,993];

disp("5b:");
disp("at t=10:")
disp("position:")
fun=clampspline(t,s,75,72);
disp(polyval(fun{3},10))
fun2=polyder(fun{3});
disp("speed:")
disp(polyval(fun2,10));

