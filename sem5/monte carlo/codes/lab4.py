
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
import math
import random
import time
#print(random.randint(0,100))

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
    
gen1=ugen(50)
gen2=ugen(60)

def nd(x,myu,sigma):
	return (1/(np.power(2*np.pi,0.5)*sigma))*(np.power(np.e,-(((x-myu)/sigma)**2)/2))

def bm(n):
	start=time.time()
	lz1=[]
	binny=int(np.ceil(n/20))
	print(binny)
#lz2=[]
	for i in range(n):
		u1=gen1()
		u2=gen2()
		r=np.power(-2*np.log(u1),0.5)
		theta=2*np.pi*u2
		z1=r*np.cos(theta)
		#z2=r*np.sin(theta)
		lz1.append(z1)
		
	end=time.time()
	print("run time:"+str(end-start))
	nplz1=np.array(lz1)
	print("mean:"+str(np.mean(nplz1))) 
	print("variance"+str(np.var(lz1)))
	plt.hist(nplz1,bins=binny,weights=np.full(n,1/(20*(np.max(nplz1)-np.min(nplz1)))))
	x_=np.linspace(np.min(nplz1),np.max(nplz1),100)
	y_=nd(x_,0,1)

	plt.plot(x_,y_)
	plt.show()
	
	#weight of bins=(#bins)/(n*(max-min))
	nplz3=np.power(5,0.5)*nplz1
	nplz4=np.power(5,0.5)*nplz1+5

	plt.hist(nplz3,bins=binny,weights=np.full(n,1/(20*(np.max(nplz3)-np.min(nplz3)))))
	x_=np.linspace(np.min(nplz3),np.max(nplz3),100)
	y_=nd(x_,0,np.power(5,0.5))

	plt.plot(x_,y_)
	plt.show()
	
	plt.hist(nplz4,bins=binny,weights=np.full(n,1/(20*(np.max(nplz4)-np.min(nplz4)))))
	x_=np.linspace(np.min(nplz4),np.max(nplz4),100)
	y_=nd(x_,5,np.power(5,0.5))
	plt.plot(x_,y_)
	plt.show()
	
	
	
	
	
	
	
def mb(n):
	start=time.time()
	lz1=[]
	binny=int(np.ceil(n/20))
	print(binny)
#lz2=[]
	count=[]
	for i in range(n):
		county=0
		while True:
			county+=1
			u1=gen1()
			u2=gen2()
			u1=2*u1-1
			u2=2*u2-1
			tempy=(u1**2+u2**2)
			if (tempy<=1):
				#r=np.power(-2*np.log(u1),0.5)
				#theta=2*np.pi*u2
				z1=u1*np.power((-2*np.log(tempy)/tempy),0.5)
				#z2=r*np.sin(theta)
				lz1.append(z1)
				count.append(county-1)
				break
		
	end=time.time()
	
	print("run time:"+str(end-start))
	nplz1=np.array(lz1)
	print("mean:"+str(np.mean(nplz1))) 
	print("variance"+str(np.var(lz1)))
	plt.hist(nplz1,bins=binny,weights=np.full(n,1/(20*(np.max(nplz1)-np.min(nplz1)))))
	x_=np.linspace(np.min(nplz1),np.max(nplz1),100)
	y_=nd(x_,0,1)

	plt.plot(x_,y_)
	plt.show()
	
	#weight of bins=(#bins)/(n*(max-min))
	nplz3=np.power(5,0.5)*nplz1
	nplz4=np.power(5,0.5)*nplz1+5

	plt.hist(nplz3,bins=binny,weights=np.full(n,1/(20*(np.max(nplz3)-np.min(nplz3)))))
	x_=np.linspace(np.min(nplz3),np.max(nplz3),100)
	y_=nd(x_,0,np.power(5,0.5))

	plt.plot(x_,y_)
	plt.show()
	
	plt.hist(nplz4,bins=binny,weights=np.full(n,1/(20*(np.max(nplz4)-np.min(nplz4)))))
	x_=np.linspace(np.min(nplz4),np.max(nplz4),100)
	y_=nd(x_,5,np.power(5,0.5))
	plt.plot(x_,y_)
	plt.show()
	
	kek=np.mean(np.array(count))
	print("proportion of rejected values:"+str(kek/(1+kek)))
	
	
	
	
bm(100)
bm(10000)
mb(100)
mb(10000)
	
		

