function S=clampspline(x,y,left,right)
    n=length(x);
    n=n-1;
    a=y;
    h=x(2:n+1)-x(1:n);
    alpha=zeros(1,n+1);
    tempy1=3*(a(2)-a(1))/h(1)-3*left;
    alpha(1)=tempy1;
    tempy2=3*right-3*(a(n+1)-a(n))/h(n);
    alpha(end)=tempy2;
    for i=1:n-1
        alpha(i+1)=(3/h(i+1))*(a(i+2)-a(i+1))-(3/h(i))*(a(i+1)-a(i));
    end
    l=[2*h(1)];
    myu=[0.5];
    z=[alpha(1)/l(1)];
    for i=2:n
        l(end+1)=2*(x(i+1)-x(i-1))-h(i-1)*myu(i-1);
        myu(end+1)=h(i)/l(i);
        z(end+1)=(alpha(i)-h(i-1)*z(i-1))/l(i);
    end
    l(end+1)=h(end)*(2-myu(end));
    z(end+1)=(alpha(end)-h(end)*z(end))/l(end);
    c=zeros(1,n+1);
    b=zeros(1,n);
    d=zeros(1,n);
    c(end)=z(end);
    for j=n:-1:1
        c(j)=z(j)-myu(j)*c(j+1);
        b(j)=((a(j+1)-a(j))/h(j))-(h(j)*(c(j+1)+2*c(j))/3);
        d(j)=(c(j+1)-c(j))/(3*h(j));
    end
    S={};
    for i=1:n
        result=[0];
        temp={};
        temp{end+1}=[a(i)];
        temp{end+1}=b(i)*polypower([1,-x(i)],1);
        temp{end+1}=c(i)*polypower([1,-x(i)],2);
        temp{end+1}=d(i)*polypower([1,-x(i)],3);
        for j=1:4
            result=polyadd(result,temp{j});
        end
        S{end+1}=result;
    end
    % disp(a);
    % disp(b);
    % disp(c);
    % disp(d);
end