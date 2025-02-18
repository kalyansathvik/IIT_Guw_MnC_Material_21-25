function result=newtonforward(a,h,fvalues)
    disp("forward")
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
    temp=[1];
    result=[0];
    for i=1:n
        result=polyadd(result,temp*mesh(i,1));
        temp=conv(temp,[1/(h*i),-a/(h*i)-1+1/i]);
    end
    plotx=a-n*h:h/100:a+n*h;
    ploty=polyval(result,plotx);
    figure;
    xlabel('x values');
    ylabel('P(x) values');
    plot(plotx,ploty,'b-');
    
end