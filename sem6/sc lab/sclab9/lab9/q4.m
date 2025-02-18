format long;
f4a=@(x) exp(-x^2);

disp('4a:')
vals=[]
for n=2:2:6
    temp=gaussleg(f4a,n,0,1)
    disp(['for n=',num2str(n),':',num2str(temp)]);
    vals(end+1)=temp;
end
table((2:2:6).',vals.','VariableNames',{'n','Integral values'})


f4b=@(x) 1/(1+x^2);
disp('4b:')
vals=[]
for n=2:2:6
    temp=gaussleg(f4b,n,-4,4);
    disp(['for n=',num2str(n),':',num2str(temp)]);
    vals(end+1)=temp;
end
table((2:2:6).',vals.','VariableNames',{'n','Integral values'})