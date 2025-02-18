
function root=bisection(f,a,b,tol,maxit)
    i=1;
    listsol=[];
    diff=(a+b)/2;
    while(i<=maxit)
        p=(a+b)/2;
        listsol(end+1)=p;
        if(length(listsol)>1)
            diff=abs(listsol(end)-listsol(end-1));
        end
        if (f(p)==0 || diff<tol  || (i==maxit))
            root=p;
            break;
        end
        i=i+1;
        if (f(a)*f(p)>0)
            a=p;
        else
            b=p;
        end
    end
    figure;
    %disp(listsol);
    scatter(linspace(1,length(listsol)-1,length(listsol)-1),listsol(2:length(listsol))-listsol(1:length(listsol)-1),'o','filled');
    title('differences');
    figure;
    scatter(linspace(1,length(listsol),length(listsol)),listsol,'o','filled');
    title('iterates');
    iterates=listsol.';
    differences=[0,listsol(2:length(listsol))-listsol(1:length(listsol)-1)].';
    index=linspace(1,length(listsol),length(listsol)).';
    disp(table(index,iterates,differences));
    %disp(table(listsol,[0,listsol(2:length(listsol))-listsol(1:length(listsol)-1)]))

    %fprintf('%f',listsol,[0,listsol(2:length(listsol))-listsol(1:length(listsol)-1)]);

end