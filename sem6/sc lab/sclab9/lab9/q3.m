format long;
f3a=@(x) exp(x)*sin(x);

disp('3a:')
for n=2:2:4
    disp(['for n=',num2str(n),':',num2str(gaussleg(f3a,n,-1,1))]);
end

f3b=@(x) exp(x)*cos(x);
disp('3b:')
for n=2:2:4
    disp(['for n=',num2str(n),':',num2str(gaussleg(f3b,n,-1,1))]);
end