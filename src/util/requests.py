import requests

headers = {'Content-Type':'application/json'}
response = requests.get('http://localhost:3000/testJsonData', headers=headers)
data = response.json()

print(data)
print(data[0])
