for h = [0.2,0.1,0.05]
    disp(["h:",h]);
    expeuler(@f5,h,0,1,5,@y5);
end