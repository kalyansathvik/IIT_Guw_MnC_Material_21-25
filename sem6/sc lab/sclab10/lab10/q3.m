x=[1,1.01,1.02,1.03,1.04];
fvalues=[3.1,3.12,3.14,3.18,3.24];

L=0.98;
R=0.142;

n=length(fvalues);
mesh=zeros(2,n);
for i=1:n
    mesh(1,i)=fvalues(i);
end
for i=2:2
    for j=n:-1:2
        temp=(x(i+j-2)-x(j-1));
        mesh(i,j)=(mesh(i-1,j)-mesh(i-1,j-1))/(x(i+j-2)-x(j-1));
    end
end

disp("backward differences:")
E=(L*mesh(2,:)+i*R);
E(1)=0;
t=table(x.',E.','VariableNames',{'time(t)','E(t)'})

n=length(fvalues);
mesh=zeros(2,n);
for i=1:n
    mesh(1,i)=fvalues(i);
end
for i=2:2
    for j=1:(n-i+1)
        temp=(x(i+j-1)-x(j));
        mesh(i,j)=(mesh(i-1,j+1)-mesh(i-1,j))/(x(i+j-1)-x(j));
    end
end

E=(L*mesh(2,:)+i*R);
E(end)=0;
disp("from forward differences:")
t=table(x.',E.','VariableNames',{'time(t)','E(t)'})
