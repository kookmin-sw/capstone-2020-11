import requests
import time

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
for i in range(100):
    st = time.time()
    res = requests.get(ip2 + ':3000/running', headers=headers)
    et = time.time()
    print(i, (et-st)*1000, res.json())
    tot_time += (et-st)*1000
    
    timer(1)
        


print((t_et-t_st)*1000)
print(tot_time)
print(tot_time/100)
