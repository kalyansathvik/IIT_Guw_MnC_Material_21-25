function result=backwarddiff(x,fvalues,f_)
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
    result=mesh;
    for i=2:n
        acterr(i)=abs(f_(x(i))-mesh(2,i));
    end
    t=table(x.',fvalues.',mesh(2,:).',acterr.','VariableNames',{'x','f',' f_ from backward differences','actual error'})
end