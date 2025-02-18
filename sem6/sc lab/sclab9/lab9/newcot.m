function result=newcot(f,a,b,n)
    n=n+1;
    syms x;
    f=sym(f);
    xv=linspace(a,b,n);
    c=[];
    for i=1:n
        temp=1;
        temp=sym(temp);
        for j=1:n
            if(j~=i)
                temp=temp*(x-xv(j))/(xv(i)-xv(j));
            end
        end
        temp=int(temp,x);
        temp=subs(temp,x,b)-subs(temp,x,a);
        c=[c,temp];
    end
    y=subs(f,x,xv);
    result=eval(sum(c.*y));
end