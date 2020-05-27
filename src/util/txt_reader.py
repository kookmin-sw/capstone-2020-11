import matplotlib.pyplot as plt
import numpy as np

# file open 'slow.txt'
f_slow = open('slow.txt','r')

# slow data store
slow_data = list()

while True:
    data = f_slow.readline()
    if not data:
        break
        
    slow_data.append(float(data[:-2]))

# file open 'fast.txt'
f_fast = open('fast.txt', 'r')

# fast data store
fast_data = list()

while True:
    data = f_fast.readline()
    if not data:
        break
        
    fast_data.append(float(data[:-2]))

print(len(fast_data))
print(len(slow_data))

x = np.linspace(0,1000,1000)
x_100 = np.linspace(0,100,100)
x_10 = np.linspace(0,10,10)

plt.figure(1)
plt.title("Result Set")
plt.xlabel("Index")
plt.ylabel("Time (ms)")

plt.axhline(y=1000,color='g', linewidth=2, linestyle = '-', label ='Target Time')
plt.plot(x,fast_data,'r',linewidth=2, label ='Good Network Condition')
plt.plot(x,slow_data,'b', label ='Bad Network Condition')
plt.legend(loc='upper right')

plt.figure(2)
slow_data.sort()
fast_data.sort()

plt.xlabel("Index")
plt.ylabel("Time (ms)")
plt.title("Sorted Set 100")
plt.axhline(y=1000,color='g', linewidth=2, linestyle = '-', label ='Target Time')
plt.plot(x_100,fast_data[900:],'r',label ='Good Network Condition')
plt.plot(x_100,slow_data[900:],'b',label ='Bad Network Condition')
plt.legend(loc='upper left')

plt.figure(3)
plt.xlabel("Index")
plt.ylabel("Time (ms)")
plt.title("Sorted Set 10")
plt.axhline(y=1000,color='g', linewidth=2, linestyle = '-', label ='Target Time')
plt.plot(x_10,fast_data[990:],'r',label ='Good Network Condition')
plt.plot(x_10,slow_data[990:],'b',label ='Bad Network Condition')
plt.legend(loc='upper left')

plt.show()
