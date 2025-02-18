function result=hermite(oldx,fvalues)
    x=[];
    shape=size(fvalues);
    n=shape(2);
    m=shape(1);
    for j=1:length(oldx)
        for i=1:m
            x(end+1)=oldx(j);
        end
    end
    mesh=zeros(n*m,n*m);
    for i=1:n
        for j=1:m
            mesh(1,(i-1)*m+j)=fvalues(1,i);
        end
    end
    for i=2:n*m
        for j=1:(n*m-i+1)
            temp2=(x(i+j-1)-x(j));
            if(temp2~=0)
                mesh(i,j)=(mesh(i-1,j+1)-mesh(i-1,j))/(x(i+j-1)-x(j));
            else 
                mesh(i,j)=fvalues(i,floor(j/m)+1)/(factorial(i-1));
            end
        end
    end
    result=[0];
    for i=1:m*n
        temp=[1];
        for j=1:i-1
            temp=conv(temp,[1,-x(j)]);
        end
        result=polyadd(result,temp*mesh(i,1));
    end
end