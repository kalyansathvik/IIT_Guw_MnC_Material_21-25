import numpy as np 
np.random.seed(69)
freq = np.zeros(4)
for j in range(100):
    for i in range(10):
        x = np.random.uniform(0, 1)
        if x < 0.2:
            freq[0] = freq[0] + 1
        elif x > 0.2 and x < 0.3:
            freq[1] = freq[1] + 1
        elif x > 0.3 and x < 0.4:
            freq[2] = freq[2] + 1
        else:
            freq[3] = freq[3] + 1
print(freq/100)