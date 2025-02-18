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
def fun(M):
	gen1=ugen(100)
	myu=gen1()
	S=0
	for i in range(M-1):
		delta=gen1()-myu
		myu=myu+(delta/(i+2))
		S=S+((i+1)/(i+2))*(delta**2)
		
	print("mean:"+str(myu))
	sn=np.power(S/(M-1),0.5)
	print("unbiased variance:"+str(sn))
	alpha=0.95
	delta=norm.ppf((1+alpha)/2)
	k=(delta*sn)/np.power(M,0.5)
	print("confidence interval:["+str(myu-k)+","+str(myu+k)+"]\n")
	

fun(100)

 	
 	
