import numpy as np
import pandas as pd
import random 
import math
import matplotlib.pyplot as plt

def ugen(x0):
    a=51749
    b=0
    m=244944584
    x=x0
    def gen():
        nonlocal x
        x=(a*x+b)%m
        return x/m

    return gen
   
def basebstring(i,b):
	ans=""
	while(i>0):
		ans=str(int(i%b))+ans
		i=np.floor(i/b)
	return ans

def radinv(i,b):
	idk=basebstring(i,b)
	n=len(idk)
	ans=0
	for iu in range(n):
		ans+=int(idk[iu])/np.power(b,n-iu)
	return ans

lx=[]		
for i in range(25):
	lx.append(radinv(i+1,2))
print(lx)
	
lx=[]
for i in range(1000):
	lx.append(radinv(i+1,2))
plt.scatter(lx[0:998],lx[1:999])
plt.show()

def fun1(n):
	lx=[]
	gen1=ugen(50)
	lu=[]
	for i in range(n):
		lx.append(radinv(i+1,2))
		lu.append(gen1())
	if(n<=1000):
		binny=10
	else:
		binny=100
	plt.hist(lx,bins=binny)
	plt.show()
	plt.hist(lu,bins=binny)
	plt.show()
	
fun1(100)
fun1(100000)

def fun2(n):
	l2x=[]
	l3x=[]
	for i in range(n):
		l2x.append(radinv(i+1,2))
		l3x.append(radinv(i+1,3))
	plt.scatter(l2x,l3x)
	plt.show()
	
fun2(100)
fun2(100000)

