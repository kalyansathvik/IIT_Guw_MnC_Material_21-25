function result=lagrange(x,y)
    n=length(x);
    ans=[0];
    for j=1:n
        poly=[1];
        for m=1:n
            if(m~=j)
                a=x(j)-x(m);
                poly=conv(poly,[1/a,-x(m)/a]);
            end
        end
        ans=polyadd(ans,y(j)*poly);
    end
    result=ans;
end