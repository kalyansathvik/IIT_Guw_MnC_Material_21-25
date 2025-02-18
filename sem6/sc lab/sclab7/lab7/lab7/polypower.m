function result=polypower(poly,i)
    result=[1];
    for j=1:i
        result=conv(result,poly);
    end
end