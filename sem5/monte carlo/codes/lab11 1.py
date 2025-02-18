import math
import random 
import numpy as np
import matplotlib.pyplot as plt

def normal(myu,sigma):
	u1=np.random.uniform(0,1)
	u2=np.random.uniform(0,1)
	z=np.power(-2*np.log(u1),0.5)*np.cos(2*np.pi*u2)
	return sigma*z+myu	

random.seed(50)
def random_color():
    return "#{:02X}{:02X}{:02X}".format(random.randint(0, 255), random.randint(0, 255), random.randint(0, 255))

colors = [random_color() for _ in range(10)]

lx=[]
for _ in range(5000):
	u=random.uniform(0,1)
	if u<=(1/2):
		x=normal(-1,1/4)
	elif (u>(1/2) and u<=(5/6)):
		x=normal(0,1)
	else:
		x=normal(1,1/2)
	lx.append(x)
print(f"avg of generated numbers: {np.mean(np.array(lx)):.3f}")

def fun(myu,sigma,start):
	w2=[]
	w5=[]
	mw2=[]
	mw5=[]
	for i in range(10):
		lw=[start]
		for j in range(5000-1):
			lw.append(lw[j]+myu*(1/1000)+sigma*np.sqrt(1/1000)*(normal(0,1)))
		w2.append(lw[2000-1])
		w5.append(lw[5000-1])
		#print(len(lw))
		plt.scatter(np.linspace(0,5,5000),lw,s=1,color=colors[i])
	plt.show()
	print(f"E[W(2)]: {np.mean(np.array(w2)):.3f}")
	print(f"E[W(5)]: {np.mean(np.array(w5)):.3f}")
	print("\n\n\n")
		
fun(0,1,0)

fun(0.06,0.3,5)	
	
