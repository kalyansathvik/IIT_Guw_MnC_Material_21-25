function result=forwarddiff(x,fvalues,f_)
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
    result=mesh;
    acterr=zeros(1,n);
    for i=1:n-1
        acterr(i)=abs(f_(x(i))-mesh(2,i));
    end
    t=table(x.',fvalues.',mesh(2,:).',acterr.','VariableNames',{'x','f',' f_ from forward differences','actual error'})

end
      