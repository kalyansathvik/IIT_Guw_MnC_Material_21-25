import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
import math
import random
import time
#import plotly.graph_objects as go

#print(random.randint(0,100))

def ugen(x0):
    a=51749
    b=5
    m=24494458
    x=x0
    def gen():
        nonlocal x
        x=(a*x+b)%m
        return x/m

    return gen
    
gen1=ugen(50)
gen2=ugen(60)


#random.seed(2)

def nd(x1,x2,myu1,myu2,si1,si2,a):
	x1=(x1-myu1)/si1
	x2=(x2-myu2)/si2
	k=(-1/(2*(1-a*a)))*(x1**2+x2**2-2*a*x1*x2)
	return (1/((2*np.pi)*si1*si2*np.power(1-a*a,0.5))*(np.power(np.e,k)))

def bm(n,a):
	start=time.time()
	lz1=[]
	lz2=[]
	lx1=[]
	lx2=[]
	
#lz2=[]
	for i in range(n):
		u1=gen1()
		u2=gen2()
		r=np.power(-2*np.log(u1),0.5)
		theta=2*np.pi*u2
		z1=r*np.cos(theta)
		z2=r*np.sin(theta)
		lz1.append(z1)
		lz2.append(z2)
		x1=5+z1
		x2=8+a*2*z1+np.power(1-a*a,0.5)*2*z2
		lx1.append(x1)
		lx2.append(x2)
		
	plt.hist2d(lx1,lx2,bins=100)
	
	
	minx1=np.min(np.array(lx1))
	maxx1=np.max(np.array(lx1))
	minx2=np.min(np.array(lx2))
	maxx2=np.max(np.array(lx2))
	
	#print("mean1:"+str(np.mean(np.array(lx1))))
	#print("mean2:"+str(np.mean(np.array(lx2))))
	#print("var1:"+str(np.var(np.array(lx1))))
	#print("var2:"+str(np.var(np.array(lx2))))
	
	cox1=np.linspace(minx1,maxx1,100)
	cox2=np.linspace(minx2,maxx2,100)
	X1,X2=np.meshgrid(cox1,cox2)
	if(a!=1 and a!=-1):
		Z=nd(X1,X2,5,8,1,2,a)
		plt.contour(X1,X2,Z,cmap='gist_rainbow_r')
	plt.show()
		
bm(10000,-0.5)
bm(10000,0)
bm(10000,0.5)
bm(10000,1)
	
		
		
		
