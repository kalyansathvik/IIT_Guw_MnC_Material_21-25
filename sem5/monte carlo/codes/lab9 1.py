import math
import random
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from scipy.stats import norm,skew

random.seed(35)
def Exp(theta):
	u=random.uniform(0,1)
	return -1*theta*np.log(u)
	
Exp=np.vectorize(Exp)

def help(x):
	if x>=70:
		return 1
	else:
		return 0
	
help=np.vectorize(help)

def pdfofexp(x,theta):
	return np.power(np.e,-x/theta)/theta
	
def fun1(n):
	liste10=np.array([])
	theta=np.array([4,4,2,5,2,3,2,3,2,2])
	for i in range(n):
		T=Exp(theta)
		E10=max(T[0]+T[1]+T[3],max(T[0]+T[1]+T[4],T[0]+T[2]+T[5],T[0]+T[2]+T[6])+T[8],T[0]+T[2]+T[7])+T[9]
		liste10=np.append(liste10,E10)
	print("E10 value using simple monte carlo:"+str(np.mean(liste10)))
	plt.hist(liste10,bins=100)
	plt.xlabel("E10 values")
	plt.ylabel("Frequencies")
	plt.show()
	lprob=help(liste10)
	print("no of E10's with value greater than 70: "+str(np.sum(lprob)))
	print("probability of deadline miss using simple monte carlo:"+str(np.mean(lprob)))
	print("standard deviation:"+str(np.power(np.var(lprob),0.5)))
	print("skewness: "+str(skew(liste10)))
	
	liste10=np.array([])
	listf=np.array([])
	listh=np.array([])
	listweights=np.array([])
	lambd=theta*4
	for j in range(n):
		T=Exp(lambd)
		E10=max(T[0]+T[1]+T[3],max(T[0]+T[1]+T[4],T[0]+T[2]+T[5],T[0]+T[2]+T[6])+T[8],T[0]+T[2]+T[7])+T[9]
		pbyq=1
		for i in range(10):
			pbyq*=pdfofexp(T[i],theta[i])/pdfofexp(T[i],lambd[i])
		listweights=np.append(listweights,pbyq)
		listh=np.append(listh,help(E10)*pbyq)
		listf=np.append(listf,help(E10))
		liste10=np.append(liste10,E10)
	print("\nno of E10's with value greater than 70: "+str(np.sum(listf)))
	print("probability of deadline miss using importance monte carlo:"+str(np.mean(listh)))
	print("standard deviation:"+str(np.power(np.var(listh),0.5)))
	print("size of listweights"+str(len(listweights)))
	eff_size=n*(np.mean(listweights)**2)/(np.mean(listweights**2))
	print("effective sample size: "+str(eff_size))
	
	kappa=[3,4,5]
	for k in kappa:
		lambd=np.empty(10)
		liste10=np.array([])
		listf=np.array([])
		listh=np.array([])
		listweights=np.array([])
		for j in range(10):
			if j in [0,1,3,9]:
				lambd[j]=k*theta[j]
			else:
				lambd[j]=theta[j]
		for j in range(n):
			T=Exp(lambd)
			E10=max(T[0]+T[1]+T[3],max(T[0]+T[1]+T[4],T[0]+T[2]+T[5],T[0]+T[2]+T[6])+T[8],T[0]+T[2]+T[7])+T[9]
			pbyq=1
			for i in range(10):
				pbyq*=pdfofexp(T[i],theta[i])/pdfofexp(T[i],lambd[i])
			listweights=np.append(listweights,pbyq)
			listh=np.append(listh,help(E10)*pbyq)
			listf=np.append(listf,help(E10))
			liste10=np.append(liste10,E10)
		print("\nfor kappa:"+str(k))
		print("no of E10's with value greater than 70: "+str(np.sum(listf)))
		mean=np.mean(listh)
		print("probability of deadline miss using importance monte carlo "+str(mean))
		print("size of listweights"+str(len(listweights)))
		sigma=np.power(np.var(listh),0.5)
		print("standard deviation:"+str(sigma))
		delta=norm.ppf(0.995)
		print("99% confidence interval:["+str(mean-delta*sigma/np.sqrt(n))+str(",")+str(mean+delta*sigma/np.sqrt(n))+str("]"))
		eff_size=n*(np.mean(listweights)**2)/(np.mean(listweights**2))
		print("effective sample size: "+str(eff_size))
			
	
	
		
fun1(10000)
