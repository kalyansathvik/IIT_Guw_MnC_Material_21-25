function result=gaussleg(f,n,a,b)
    Syms x
    f=sym(f)
    temp=legendreP(n,x)
    xval=roots(temp)
    c=subs(2/((1-x^2)*(diff(temp))),x,xval)
    y=subs(f,((b-a)*xval+(b+a))/2)
end