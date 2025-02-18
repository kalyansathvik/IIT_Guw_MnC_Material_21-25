nfy=[];
nby=[];
lagrangea=[];
for i=1:10
    x=-5:10/i:5;
    acty=arrayfun(@f3,x);
    nfy=[nfy,polyval(newtonforward(-5,10/i,acty),1+10^0.5)];
    nby=[nby,newtonbackward(-5,10/i,1+10^0.5,acty)];
    lagrangea=[lagrangea,polyval(lagrange(x,acty),1+10^0.5)];
end

format short;
disp("f(1+10^0.5)=");
disp(f3(1+10^0.5));
disp(nfy);
disp(nby);
disp(lagrangea);