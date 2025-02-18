function result=muller(f,x0,x1,x2,tol,a,b)
    listsol=[x0,x1,x2];
    disp("initial estimates: "+x0+" "+x1+" "+x2);
    while(true)
        a0=listsol(end-2);
        a1=listsol(end-1);
        a2=listsol(end);
        w=two(f,a2,a1)+two(f,a2,a0)-two(f,a1,a0);
        if(isnan(w))
            break;
        end
        temp=(w^2-4*f(a2)*three(f,a2,a1,a0))^(0.5);
        if(isnan(temp))
            break;
        end
        if(abs(w+temp)<abs(w-temp))
            den=w-temp;
        else
            den=w+temp;
        end
        if(isnan(den))
            break;
        end
        a3=a2-2*f(a2)/den;
        listsol(end+1)=a3;
        if(abs(a3-a2)<tol)
            break;
        end
    end
    result=listsol(end);
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


function result=three(f,x1,x2,x3)
    a=two(f,x2,x3)-two(f,x1,x2);
    result=a/(x3-x1);
end

function result=two(f,x1,x2)
    a=f(x2)-f(x1);
    result=a/(x2-x1);
end