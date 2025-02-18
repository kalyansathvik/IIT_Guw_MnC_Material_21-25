t=[0,3,5,8,13];
s=[[0,225,383,623,993];[75,77,80,74,72]];

herm=hermite(t,s);
fdherm=polyder(herm);
sdherm=polyder(fdherm);


disp("2a:")
disp("position(in feet):")
disp(polyval(herm,10));
disp("speed(in feet per second)")
disp(polyval(fdherm,10))

disp("\n2b:")
lim=fdherm;
lim(end)=lim(end)-55*5280/3600;
allroots=roots(lim);
realroots=allroots(imag(allroots)==0);
positiveroots=realroots(realroots>0);
disp(min(positiveroots));

disp("\n2c:")
allroots=roots(sdherm);
realroots=allroots(imag(allroots)==0);
positiveroots=realroots(realroots>0);
disp(max(polyval(fdherm,positiveroots)));




