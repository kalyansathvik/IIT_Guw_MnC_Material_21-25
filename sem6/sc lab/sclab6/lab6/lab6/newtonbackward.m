function result=newtonbackward(a,h,x,fvalues)
    %a is the start value here
    disp("backward")
    n=length(fvalues);
    mesh=zeros(n,n);
    for i=1:n
        mesh(1,i)=fvalues(i);
    end
    for i=2:n
        for j=1:(n-i+1)
            mesh(i,j)=mesh(i-1,j+1)-mesh(i-1,j);
        end
    end
    u=(x-(a+(n-1)*h))/h;
    temp=1;
    result=0;
    for i=1:n
        result=result+temp*mesh(i,n-i+1);
        temp=temp*(u+i-1)/i;
    end
end