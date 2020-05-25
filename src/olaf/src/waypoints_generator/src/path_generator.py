#!/usr/bin/env python

# for reading a json file(waypoints)
import json
# for using ordered Dictionary
from collections import OrderedDict
import rospy
from std_msgs.msg import String

json_file_path = '/home/nvidia/catkin_ws/src/waypoints_generator/src/way_points.json'

def json_reader():
    global json_file_path
    # init node : path_generator
    rospy.init_node('path_generator')
    
    # Path Publisher
    path_pub = rospy.Publisher('path',String)
    
    # json file open
    with open(json_file_path,'r') as json_file:
        json_data_dummy = json.load(json_file)
    
    while not rospy.is_shutdown():
        # print test
        for json_data in json_data_dummy:
            print('idx : ',json_data['idx'])
            print('name : ',json_data['name'])
            print('x_location : ',json_data['x_location'])
            print('y_location : ',json_data['y_location'])
            print('lds_detect : ',json_data['lds_detect'])
            print('line_detect : ',json_data['line_detect'])
        path_pub.publish('path')
        rospy.sleep(1.0)
        
    


if __name__=='__main__':
    try:
        json_reader()
    except rospy.ROSInterruptException: pass

