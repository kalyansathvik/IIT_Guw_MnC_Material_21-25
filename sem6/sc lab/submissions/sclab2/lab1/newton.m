function result=newton(x0,tol,f,f_)
    format long;
    disp("initial guess:"+x0);
    listsol=[];
    nextx=x0;
    while(true && ~isnan(nextx))
        x=nextx;
        listsol(end+1)=x;
        nextx=(x-f(x)/f_(x));
        if(abs(nextx-x)<tol)
            break;
        end
    end
    result=nextx;
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
end

