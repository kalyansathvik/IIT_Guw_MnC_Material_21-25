x=[0,0.5];
y1=arrayfun(@f3a,x);
y2=arrayfun(@f3b,x);

fun1=naturalspline(x,y1)
disp("3a:")
disp("f(0.43):")
disp(polyval(fun1{1},0.43))
disp("f'(0.43):")
disp(polyval(polyder(fun1{1}),0.43));

disp("3b:")
disp("f(0.25):")
fun2=naturalspline(x,y2)
disp(polyval(fun2{1},0.25))
disp("f'(0.25):")
disp(polyval(polyder(fun2{1}),0.25))


% x=[0,1,2,3];
% y=[1,exp(1),exp(2),exp(3)];
% naturalspline(x,y)
% temp1=[2.71828,2.22285,0.75685,1.69107];
% temp2=[7.38906,8.80977,5.83007,-1.94336];

