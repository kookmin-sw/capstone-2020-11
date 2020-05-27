import requests
import time

import matplotlib.pyplot as plt
import numpy as np

t_list = list()

f = open("KMU_wifi.txt", mode = 'w')

def timer(_time):
    timer_st = time.time()
    timer_et = time.time()
    while (timer_et - timer_st) <= _time:
        timer_et = time.time()

ip = 'http://localhost'
ip2 = 'http://15.164.164.49'

t_st = time.time()
headers = {'Content-Type':'application/json'}
response = requests.get(ip2+':3000/running', headers=headers)
t_et = time.time()

data = response.json()

print((t_et-t_st)*1000)
print(data)
print(data['isRunning'])

tot_time = 0
for i in range(1000):
    st = time.time()
    res = requests.get(ip2 + ':3000/running', headers=headers)
    et = time.time()
    #t_list.append((et-st)*1000)
    f.write(str((et-st)*1000)+'\n')
    
    
    
    
    
    print(i, (et-st)*1000, res.json())
    tot_time += (et-st)*1000

    timer(0.5)
        


print((t_et-t_st)*1000)
print(tot_time)
print(tot_time/1000)
#print(t_list)
