format long;
y1val=[];
y2val=[];
y1=[1,1.64872,2.71828,4.48169];
y2=[-0.07181250,-0.02475000,0.33493750,1.10100000];

for i=1:3
    temp1=newtonforward(0,0.25,y1(1:i+1));
    disp(temp1);
    y1val=[y1val,polyval(temp1,0.43)];
    temp2=newtonforward(0,0.25,y2(1:i+1));
    y2val=[y2val,polyval(temp2,-1/3)];
    disp(temp2);
end

disp("a:")
disp(y1val);
disp("b:");
disp(y2val);