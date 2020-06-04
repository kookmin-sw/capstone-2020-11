#!/usr/bin/env python

import rospy
from std_msgs.msg import Int32MultiArray
import requests, signal, time, sys
import matplotlib.pyplot as plt
import numpy as np

class json_request():

    def __init__(self):
    
        AWS_IP = '15.164.164.49'
        PREFIX = 'http://'
        POSTFIX = ':3000/running'
	    
        self.REQ_URL = PREFIX + AWS_IP + POSTFIX
    	self.HEADER = {'Content-Type':'application/json'}
    	self.isRunning = 0
    	
    def checkServer(self):
        data = requests.get(self.REQ_URL, headers=self.HEADER).json()
        self.isRunning = data['isRunning']
        print(data)
    	
    def polling(self):
    
        polling_rate = rospy.Rate(3)
        self.checkServer()
        
        while self.isRunning == 0:
            
            self.checkServer()
            polling_rate.sleep()
            
    def update(self, data):
    
        inputData = '{"isRunning":' + str(data) + '}'
        response = requests.put(self.REQ_URL, headers=self.HEADER, data=inputData)
        	
def signal_handler(signum, f):
    sys.exit()

if __name__ == '__main__':

    rospy.init_node('json_connection_test')
    
    signal.signal(signal.SIGINT, signal_handler)
    
    connectionObject = json_request()
    
    while True:
    
        print ""
        connectionObject.polling()
    
        print ""
    
        time.sleep(1)
        print('WayBackHome')
        connectionObject.update(2)
        connectionObject.checkServer()
    
        print ""
    
        time.sleep(1)
        print('Done')
        connectionObject.update(0)
        connectionObject.checkServer()
