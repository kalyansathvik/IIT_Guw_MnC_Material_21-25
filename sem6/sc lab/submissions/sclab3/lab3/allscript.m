result=fixed(2,10^(-4),@f1,@actf1,1,2);

result=modnewton(1,10^(-5),@f2a,@f2a_,1,1,2);
result=modnewton(-1,10^(-5),@f2b,@f2b_,3,-1,0);

result=muller(@f3a,-0.5,0,0.5,10^(-5),-5,5);
result=muller(@f3b,0.1,1,2,10^(-5),-5,5);

result=fixed(31,10^(-4),@f4,@f4,4,6);
