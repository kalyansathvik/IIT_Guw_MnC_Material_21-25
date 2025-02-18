function S=naturalspline(x,y)
    n=length(x);
    n=n-1;
    a=y;
    h=x(2:n+1)-x(1:n);
    alpha=[];
    for i=1:n-1
        alpha(end+1)=(3/h(i+1))*(a(i+2)-a(i+1))-(3/h(i))*(a(i+1)-a(i));
    end
    l=[1];
    myu=[0];
    z=[0];
    for i=2:n
        l(end+1)=2*(x(i+1)-x(i-1))-h(i-1)*myu(i-1);
        myu(end+1)=h(i)/l(i);
        z(end+1)=(alpha(i-1)-h(i-1)*z(i-1))/l(i);
    end
    l(end+1)=1;
    z(end+1)=0;
    c=zeros(1,n+1);
    b=zeros(n);
    d=zeros(n);
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
    % disp("a:");
    % disp(a);
    % disp("b:");
    % disp(b);
    % disp("c:")
    % disp(c);
    % disp("d:")
    % disp(d);
end