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


f_HCI = open('HCI_wifi.txt', 'r')
HCI_data = list()
while True:
    data = f_HCI.readline()
    if not data:
        break;
    HCI_data.append(float(data[:-2]))
    
f_KMU = open('KMU_wifi.txt', 'r')
KMU_data = list()
while True:
    data = f_KMU.readline()
    if not data:
        break;
    KMU_data.append(float(data[:-2]))


x = np.linspace(0,1000,1000)
compare_wifi = np.linspace(0, 1000, 1000)

x_100 = np.linspace(0,100,100)
x_10 = np.linspace(0,10,10)


compare_wifi_100 = np.linspace(0, 100, 100)
compare_wifi_10 = np.linspace(0, 10, 10)

plt.figure(1)
plt.title("Result Set")
plt.xlabel("Index")
plt.ylabel("Time (ms)")

plt.axhline(y=1000,color='g', linewidth=2, linestyle = '-', label ='Target Time')
plt.plot(compare_wifi,fast_data,'r',linewidth=2, label ='Good Network Condition')
plt.plot(compare_wifi,slow_data,'b', label ='Bad Network Condition')
plt.legend(loc='upper right')


plt.figure(2)
plt.title("Result Set")
plt.xlabel("Index")
plt.ylabel("Time (ms)")

plt.axhline(y=1000,color='g', linewidth=2, linestyle = '-', label ='Target Time')
plt.plot(x,fast_data,'r',linewidth=2, label ='Good Network Condition')
plt.plot(x,HCI_data,'b', label ='HCI Network Condition')
plt.plot(x,KMU_data,'m', label ='KMU Network Condition')
plt.legend(loc='upper right')


plt.figure(3)
slow_data.sort()
fast_data.sort()
HCI_data.sort()
KMU_data.sort()

plt.xlabel("Index")
plt.ylabel("Time (ms)")
plt.title("Sorted Set 100")
plt.axhline(y=1000,color='g', linewidth=2, linestyle = '-', label ='Target Time')
plt.plot(x_100,fast_data[900:],'r',label ='Good Network Condition')
plt.plot(x_100,slow_data[900:],'b',label ='Bad Network Condition')
plt.legend(loc='upper left')

plt.figure(4)
plt.xlabel("Index")
plt.ylabel("Time (ms)")
plt.title("Sorted Set 10")
plt.axhline(y=1000,color='g', linewidth=2, linestyle = '-', label ='Target Time')
plt.plot(x_10,fast_data[990:],'r',label ='Good Network Condition')
plt.plot(x_10,slow_data[990:],'b',label ='Bad Network Condition')
plt.legend(loc='upper left')


plt.figure(5)
plt.title("Sorted Set 100")
plt.xlabel("Index")
plt.ylabel("Time (ms)")

plt.axhline(y=1000,color='g', linewidth=2, linestyle = '-', label ='Target Time')
plt.plot(compare_wifi_100,fast_data[900:],'r',linewidth=2, label ='Good Network Condition')
plt.plot(compare_wifi_100,HCI_data[900:],'b', label ='HCI Network Condition')
plt.plot(compare_wifi_100,KMU_data[900:],'m', label ='KMU Network Condition')
plt.legend(loc='upper left')

plt.figure(6)
plt.title("Sorted Set 10")
plt.xlabel("Index")
plt.ylabel("Time (ms)")

plt.axhline(y=1000,color='g', linewidth=2, linestyle = '-', label ='Target Time')
plt.plot(compare_wifi_10,fast_data[990:],'r',linewidth=2, label ='Good Network Condition')
plt.plot(compare_wifi_10,HCI_data[990:],'b', label ='HCI Network Condition')
plt.plot(compare_wifi_10,KMU_data[990:],'m', label ='KMU Network Condition')
plt.legend(loc='upper left')


plt.show()
