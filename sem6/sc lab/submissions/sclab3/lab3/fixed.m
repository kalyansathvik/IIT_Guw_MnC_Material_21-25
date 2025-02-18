function root=fixed(x0,tol,f,actf,a,b)
    listsol=[x0];
    while(true)
        listsol(end+1)=f(listsol(end));
        if(abs(listsol(end)-listsol(end-1))<tol)
            break;
        end
    end
    root=listsol(end);
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
        y(end+1)=actf(ax(i));
    end
    plot(ax,y,'b-','LineWidth',2);
    title('function plot');
    iterates=listsol.';
    index=linspace(1,length(listsol),length(listsol)).';
    T=table(index,iterates,differences);
    disp(T(max(end-14,1):end,:));
    %disp(listsol);
end
