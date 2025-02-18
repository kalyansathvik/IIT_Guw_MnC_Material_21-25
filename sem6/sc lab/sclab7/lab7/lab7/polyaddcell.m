function result=polyaddcell(x,y)
    x=cell2mat(x);
    y=cell2mat(y);
    n=length(x);
    m=length(y);
    miny=min(m,n);
    padl=abs(m-n);

    if(m==miny)
        y=[zeros(1,padl),y];
    else
        x=[zeros(1,padl),x];
    end
       
    for i=1:length(x)
        y(i)=y(i)+x(i);
    end
    result=y;
    mat2cell(result,1,length(result));
end