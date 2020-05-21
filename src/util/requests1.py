#! /usr/bin/env python
import requests

#print(dir(requests))

headers = {'Content-Type':'application/json'}
response = requests.get('http://localhost:3000/check/1', headers=headers)
data = response.json()

print(data)
print(data['check_run'])

inputData = '{"check_run":1,"state1":"622","state2":"WTF"}'
response2 = requests.put('http://localhost:3000/check/1', headers=headers, data=inputData)
#data2 = response2.json()
print(response2)
print(response2.json())
