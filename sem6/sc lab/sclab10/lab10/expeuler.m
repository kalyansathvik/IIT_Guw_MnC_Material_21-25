function result=expeuler(f,h,t0,y0,tn,fny,m)
    t=t0:h:tn;
    n=length(t);
    y=[y0];
    for i=2:n
        y(i)=y(i-1)+h*f(t(i-1),y(i-1));
    end
    error=abs(arrayfun(fny,t)-y);
    Table=table(t.',y.',error.','VariableNames',{'t','y','error'})
    figure;
    plot(t,y);
    xlabel('x');
    ylabel('solution');
    figure;
    plot(t,error);
    xlabel('x');
    ylabel('error');
    figure;
    h=(tn-t0)/(2^m);
    t=t0:h:tn;
    n=length(t);
    y=[y0];
    for i=2:n
        y(i)=y(i-1)+h*f(t(i-1),y(i-1));
    end
    p=[];
    q=[];
    error=abs(arrayfun(fny,t)-y);
    for i=2:length(error)
        error(i)=max(error(i-1),error(i));
    end
    for i=1:m
        p(end+1)=log2(error(2^i)/error(2^(i-1)));
        q(end+1)=log(error(2^(i-1)));
    end
    plot((1:m),p);
    xlabel('x');
    ylabel('order of convergence');
    figure;
    plot((1:m),q);
    xlabel('log mesh points');
    ylabel('log error');
end  
