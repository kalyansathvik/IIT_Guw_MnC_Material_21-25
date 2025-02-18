import math
import random
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
from scipy.stats import norm

def ugen(x0):
    a=51749
    b=5
    m=24494458
    x=x0
    def gen():
        nonlocal x
        x=(a*x+b)%m
        return x/m
 
#gen1=ugen(9)
random.seed(5)

def y():
	temp=random.uniform(0,1)
	return (np.power(np.e,np.power(temp,0.5))+np.power(np.e,np.power(1-temp,0.5)))/2
	
def fun(M):
	#gen1=random.random()
	print("M:"+str(M))
	myu=np.power(np.e,np.power(random.uniform(0,1),0.5))
	S=0
	for i in range(M-1):
		delta=np.power(np.e,np.power(random.uniform(0,1),0.5))-myu
		myu=myu+(delta/(i+2))
		S=S+((i+1)/(i+2))*(delta**2)
		
	print("mean:"+str(myu))
	sn=np.power(S/(M-1),0.5)
	print("unbiased variance:"+str(sn))
	alpha=0.95
	delta=norm.ppf((1+alpha)/2)
	k=(delta*sn)/np.power(M,0.5)
	print("confidence interval:["+str(myu-k)+","+str(myu+k)+"]\n")
	return k
	

k1=fun(100)
k2=fun(1000)
k3=fun(10000)
k4=fun(100000)

def fun1(M):
	#gen1=random.random()
	print("M:"+str(M))
	N=M
	M=math.floor(M/2)
	myu=y()
	S=0
	for i in range(M-1):
		delta=y()-myu
		myu=myu+(delta/(i+2))
		S=S+((i+1)/(i+2))*(delta**2)
		
	print("mean:"+str(myu))
	sn=np.power(S/(M-1),0.5)
	print("unbiased variance:"+str(sn))
	alpha=0.95
	delta=norm.ppf((1+alpha)/2)
	k=(delta*sn)/np.power(M,0.5)
	print("confidence interval:["+str(myu-k)+","+str(myu+k)+"]\n")
	return k
	

print("For M=100:the ratio of intervals is"+str(k1/fun1(100)))
print("For M=1000:the ratio of intervals is"+str(k2/fun1(1000)))
print("For M=10000:the ratio of intervals is"+str(k3/fun1(10000)))
print("For M=100000:the ratio of intervals is"+str(k4/fun1(100000)))

