f2a=@(x)(exp(3*x)*sin(2*x));
disp('2a:')
disp('from newton-cote:')
vals=[]
for n=2:1:5
    disp(['for n=',num2str(n),':'])
    temp=newcot(f2a,0,pi/4,n)
    vals=[vals,temp];
    disp(temp)
end

table((2:1:5).',vals.','VariableNames',{'n','Integral values'})

f2b=@(x)(2*x/(x^2-4));
disp('2b:')
disp('from newton-cote:')
vals=[]
for n=2:1:5
    disp(['for n=',num2str(n),':'])
    temp=newcot(f2b,1,1.6,n)
    vals=[vals,temp];
    disp(temp)
end

table((2:1:5).',vals.','VariableNames',{'n','Integral values'})
