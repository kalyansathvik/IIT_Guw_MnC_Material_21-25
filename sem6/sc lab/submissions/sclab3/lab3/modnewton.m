function result=modnewton(x0,tol,f,f_,p,a,b)
    format long;
    disp("initial guess:"+x0);
    listsol=[];
    nextx=x0;
    while(true && ~isnan(nextx))
        x=nextx;
        listsol(end+1)=x;
        nextx=(x-p*f(x)/f_(x));
        if(abs(nextx-x)<tol)
            break;
        end
    end
    result=nextx;
    differences=[0,abs(listsol(2:length(listsol))-listsol(1:length(listsol)-1))].';
    order=[0,log(listsol(2:length(differences)))/log(listsol(1:length(differences)-1))];
    figure;
    %disp(listsol);
    scatter(linspace(1,length(listsol)-1,length(listsol)-1),listsol(2:length(listsol))-listsol(1:length(listsol)-1),'o','filled');
    title('differences');
    figure;
    ax=linspace(a,b,100);
    y=[];
    for i=1:length(ax)
        y(end+1)=f(ax(i));
    end
    plot(ax,y,'b-','LineWidth',2);
    title('function plot');
    iterates=listsol.';
    index=linspace(1,length(listsol),length(listsol)).';
    T=table(index,iterates,differences);
    disp(T(max(end-14,1):end,:));
end

