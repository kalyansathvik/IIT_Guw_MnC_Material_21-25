x=[0.5,0.6,0.7];
fvalues=[0.4794,0.5646,0.6442];
forwarddiff(x,fvalues,@f2a_);
backwarddiff(x,fvalues,@f2a_);

x=[1,1.2,1.4];
fvalues=[1,1.2625,1.6595];
forwarddiff(x,fvalues,@f2b_);
backwarddiff(x,fvalues,@f2b_);
