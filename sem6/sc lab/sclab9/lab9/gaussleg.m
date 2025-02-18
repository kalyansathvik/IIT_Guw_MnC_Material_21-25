function result=gaussleg(f,n,a,b)
    syms x;
    f=sym(f);
    temp=legendreP(n,x);
    if(n==6)
        xval=[-0.932470,-0.661209,-0.238619];
        xval=[xval,-flip(xval)];
    else
        xval=solve(temp==0);
    end
    c=eval(subs(2/((1-x^2)*(diff(temp)^2)),x,xval));
    y=eval(subs(f,x,((b-a)*xval+(b+a))/2));
    result=(sum(c.*y));
    result=result*((b-a)/2);
end