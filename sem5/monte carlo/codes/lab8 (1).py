import math
import random
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
from scipy.stats import norm
from scipy import integrate
import scipy.stats as stats

random.seed(5)

def poi(lambd):
	u=random.uniform(0,1)
	j=1
	q=0
	while(True):
		#qi
		q+=np.power(np.e,-lambd)*(np.power(lambd,j-1)/math.factorial(j-1))
		j+=1
		if(q>=u):
			break
	
	return j-2
	
def pdfofpoi(lambd,k):
	j=k+1
	return np.power(np.e,-lambd)*(np.power(lambd,j-1)/math.factorial(j-1))
	
def cdfofpoi(lambd,k):
	q=0
	for j in range(1,k+2):
		q+=np.power(np.e,-lambd)*(np.power(lambd,j-1)/math.factorial(j-1))
	return q

def normal(myu,sigma):
	u1=np.random.uniform(0,1)
	u2=np.random.uniform(0,1)
	z=np.power(-2*np.log(u1),0.5)*np.cos(2*np.pi*u2)
	return sigma*z+myu	
	
def lognormal(myu,sigma):
	return np.power(np.e,myu+sigma*normal(0,1))	
	
def exp(lambd):
	u=np.random.uniform(0,1)
	return -lambd*np.log(u)

#this works only for integer alpha			
def gamma(alpha,beta):
	temp=0
	for i in range(alpha):
		temp+=exp(beta)
	return temp

'''	
def f(alpha,x):
	#print(alpha)
	return np.power(np.e,-x)*np.power(x,alpha-1)/np.math.factorial(alpha-1)

#this works only for integer alpha
def cdfofgamma(alpha,y):
	
	result,error=integrate.quad(lambda x:f(alpha,x),0,y)
	return result
'''

def cdfofweib(x,scale,shape):
	
	return 1-np.power(np.e,-np.power((x/scale),shape))
	

def cdfofgamma(alpha,x):
	return stats.gamma.cdf(x,alpha,1)
	
def dirichlet(alpha_list):
	listx=[]
	#sum=0
	for i in alpha_list:
		x=gamma(i,1)
		listx.append(x)
		#sum+=x
	#return (np.array(listx)/sum)
	return np.array(list)

#ULTRA IMPORTANT U SEE THIS

def weib(scale,shape):
	return scale*(np.power(exp(1),1/shape))
	
'''
listx=[]	
for i in range(1000):
	listx.append(poi(5))
print(str((np.array(listx)).mean()))
'''
def genfor1(Sip):
	
	y=0
	for i in range(Sip):
			y+=weib(3,0.8)
	return y
	
def fun1(n):
	less_rain=0
	Sip=poi(2.9)
	myu=genfor1(Sip)
	listy=[]
	listpoi=[]
	S=0
	why=0
	listrain=[]
	if myu>=5:
		listrain.append(0)
	else:
		listrain.append(1)
	#Sip->S in problem
	for i in range(n-1):
		Sip=poi(2.9)
		listpoi.append(Sip)
		y=genfor1(Sip)
		listy.append(y)
		if y<5:
			less_rain+=1
			listrain.append(1)
		else:
			listrain.append(0)
			if Sip>=6:
				why+=1
			
		delta=y-myu
		myu=myu+(delta/(i+2))
		S=S+((i+1)/(i+2))*(delta**2)
	print("simple Monte Carlo:")
	print("mean of total rainfall:"+str(myu))
	myu=np.mean(np.array(listrain))
	print("variance:"+str(np.var(np.array(listrain))))
	alpha=0.99
	delta=norm.ppf((1+alpha)/2)
	k=delta*(np.power((np.var(listrain,ddof=1)/n),0.5))
	
	print("confidence interval of probability:["+str(myu-k)+","+str(myu+k)+"]\n")
	print("less rain probability:"+str(less_rain/n))
	
	Xji=np.empty(7,dtype=object)
	Yji=np.empty(7,dtype=object)
	for j in range(7):
		Xji[j]=np.empty(0,dtype=int)
		Yji[j]=np.empty(0,dtype=int)
	#print(Xji)
	for j in range(n-1):
		Sip=poi(2.9)
		y=genfor1(Sip)
		
		if Sip<=5:
			Xji[Sip]=np.append(Xji[Sip],y)
			if y<5:
				Yji[Sip]=np.append(Yji[Sip],1)
			else:
				Yji[Sip]=np.append(Yji[Sip],0)
			#print(len(Xji[Sip]))
		else:
			Xji[6]=np.append(Xji[6],y)
			if y<5:
				Yji[6]=np.append(Yji[6],1)
			else:
				Yji[6]=np.append(Yji[6],0)
	#print(Xji)
	myu=[]
	myu2=[]
	mean=0
	mean2=0
	for j in range(7):
		if j<=5:
			w=pdfofpoi(2.9,j)
		else:
			w=1-cdfofpoi(2.9,5)
		sum=0
		sum2=0
		for i in Xji[j]:
			sum+=i
		for i in Yji[j]:
			sum2+=i
		if(Xji[j].size>0):
			#print("hi"+str(Xji[j].size))
			myu.append(sum/(Xji[j].size))
			myu2.append(sum2/(Yji[j].size))
			mean+=myu[j]*w
			mean2+=myu2[j]*w
		
	var=0
	var2=0
	for j in range(7):
		if j<=5:
			w=pdfofpoi(2.9,j)
		else:
			w=1-cdfofpoi(2.9,5)
		sum=0
		sum2=0
		for i in Xji[j]:
			sum+=((i-myu[j])**2)
		for i in Yji[j]:
			sum2+=((i-myu2[j])**2)
		nj=Xji[j].size
		if(nj>1):
			var+=(w*w/(nj*(nj-1)))*sum
			var2+=(w*w/(nj*(nj-1)))*sum2
	
	alpha=0.99
	delta=norm.ppf((1+alpha)/2)
	
	print("\nfrom stratification:")
	print("mean of total rainfall:"+str(mean))
	print("probability:"+str(mean2))
	print("confidence interval of probability:["+str(mean2-delta*var2)+","+str(mean2+delta*var2)+str("]"))
	'''
	print("why?:"+str(why/n)+"\n")
	'''
	

fun1(100)
fun1(10000)	

def fun2(n):
	alpha_list=[2082,1999,2008,2047,2199,2153,1999,2136,2053,2121,1974,2110,2110,2168,2035,2019,2044,2191,2284,1912,2196,2099,2041,2192,2188,1984,2158,2019,2032,2051,2192,2133,2142,2113,2150,2221,2046,2127]
	listh=[]
	for i in range(n):
		y=gamma(alpha_list[18],1)
		h=1
		for j in alpha_list:
			if(j!=2284):
				h=h*cdfofgamma(j,y)
		listh.append(h)
		
	'''
	k=0
	for i in range(5*n):
		listx=[]
		for j in alpha_list:
			
			x=gamma(j,1)
			#print(str(j)+" "+str(x))
			listx.append(x)
		nplistx=np.array(listx)
		if(np.max(nplistx)==listx[18]):
			k+=1
	'''	
		
		
	print("myu from conditional expectation:"+str(np.mean(np.array(listh))))
	#print("myu from monte:"+str(k/(5*n)))


fun2(1000)
#myu from conditional expectation:0.6929867079958946
'''

def fun3(n):
	listf=[]
	listh=[]
	for j in range(n):
		sum=0
		product=1
		for i in range(5):
			temp=lognormal(0,np.power(2*np.log(i+1),0.5))
			sum+=temp
			product*=temp
		listf.append(max(0,sum/5))
		listh.append(product/5)
	
	myu=np.mean(np.array(listf))
	theta=np.mean(np.array(listh))
	num=0
	dem=0
	for i in range(n):
		num+=(listf[i]-myu)*(listh[i]-theta)
		dem+=((listh[i]-theta)**2)
	beta=num/dem
	theoretical_theta=24
	myu_cap=myu+beta*(theoretical_theta-theta)
		
	#expeectation of log normal exp(myu+(sigma**2)/2)
	print("practical theta:"+str(theta))
	print("practical myu:"+str(myu))
	print("myu_cap"+str(myu_cap))
	
fun2(1000)
fun3(1000)



#cdfofpoi(2.9,6)
'''	









		
