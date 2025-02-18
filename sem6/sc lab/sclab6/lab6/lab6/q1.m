format long;
disp(polyval(newtonforward(1,0.5,[2.7183,4.4817,7.3819,12.1825]),2.25));
disp("exact value:")
disp(exp(2.25))
disp(newtonbackward(1,0.5,2.25,[2.7183,4.4817,7.3819,12.1825]));
disp("exact value:")
disp(exp(2.25))
% newtonforward(45,5,52,[0.7071,0.7660,0.8192,0.8660])
% newtonbackward(1891,10,1925,[46,66,81,93,101])
% temp=nchoosek(10/5,1)