function result=newtonforwardunequal(x,fvalues,x0)
    n=length(fvalues);
    mesh=zeros(n,n);
    for i=1:n
        mesh(1,i)=fvalues(i);
    end
    for i=2:n
        for j=1:(n-i+1)
            temp=(x(i+j-1)-x(j));
            mesh(i,j)=(mesh(i-1,j+1)-mesh(i-1,j))/(x(i+j-1)-x(j));
        end
    end
    disp(mesh);
    result=0;
    for i=1:n
        temp=1;
        for j=1:i-1
            temp=temp*(x0-x(j));
        end
        result=result+temp*mesh(i,1);
    end
end