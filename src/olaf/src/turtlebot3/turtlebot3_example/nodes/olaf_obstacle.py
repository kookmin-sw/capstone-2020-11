#!/usr/bin/env python
#################################################################################
# Copyright 2018 ROBOTIS CO., LTD.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#################################################################################

# Authors: Gilbert #

import rospy
import math
from sensor_msgs.msg import LaserScan
from geometry_msgs.msg import Twist
import numpy as np
import matplotlib.pyplot as plt

LINEAR_VEL = 0.1
STOP_DISTANCE = 1.0
LIDAR_ERROR = 0.05
SAFE_STOP_DISTANCE = STOP_DISTANCE + LIDAR_ERROR

class Obstacle():
    def __init__(self):
        self._cmd_pub = rospy.Publisher('cmd_vel', Twist, queue_size=1)
        self.obstacle()
        
    def get_scan(self):
        scan = rospy.wait_for_message('scan', LaserScan)
        scan_filter = []
        right_scan_filter = []
        left_scan_filter = []
        
        samples = len(scan.ranges)  # The number of samples is defined in 
                                    # turtlebot3_<model>.gazebo.xacro file,
                                    # the default is 360.
        samples_view = 20           # 1 <= samples_view <= samples
        
        #print(type(scan_filter))
        front_samples_view = 20
        
        # left range
        left_samples_upper = -80
        left_samples_lower = -100
        
        # right range
        right_samples_upper = 100
        right_samples_lower = 80
        
        
        print("samples : ", samples)
        
        if samples_view > samples:
            samples_view = samples

        if samples_view is 1:
            scan_filter.append(scan.ranges[0])

        else:
            front_left_lidar_samples_ranges = -(samples_view//2 + samples_view % 2)
            front_right_lidar_samples_ranges = samples_view//2
            
            print("left_lidar_samples_ranges : ", front_left_lidar_samples_ranges)
            print("right_lidar_samples_ranges : ", front_right_lidar_samples_ranges)
            
            right_scan_filter = scan.ranges[right_samples_lower:right_samples_upper]
            left_scan_filter = scan.ranges[left_samples_lower:left_samples_upper]
            
            front_left_lidar_samples = scan.ranges[front_left_lidar_samples_ranges:]
            front_right_lidar_samples = scan.ranges[:front_right_lidar_samples_ranges]
            scan_filter.extend(front_left_lidar_samples + front_right_lidar_samples)

        for i in range(samples_view):
            if scan_filter[i] == float('Inf'):
                scan_filter[i] = 3.5     
            elif math.isnan(scan_filter[i]):
                scan_filter[i] = 0
        
        for i in range(20):
            if right_scan_filter[i] == float('Inf'):
                right_scan_filter[i] = 3.5
            elif math.isnan(right_scan_filter[i]):
                right_scan_filter[i] = 0
            
            if left_scan_filter[i] == float('Inf'):
                left_scan_filter[i] = 3.5
            elif math.isnan(left_scan_filter[i]):
                left_scan_filter[i] = 0
        
        scan_filter = np.array(scan_filter)
        right_scan_filter = np.array(right_scan_filter)
        left_scan_filter = np.array(left_scan_filter)
        
        return scan_filter, right_scan_filter, left_scan_filter

    def obstacle(self):
        twist = Twist()
        turtlebot_moving = True

        while not rospy.is_shutdown():
            front_scan, right_scan, left_scan = self.get_scan()
            
            # round 
            front_scan = np.round(front_scan,2)
            right_scan = np.round(right_scan,2)
            left_scan = np.round(left_scan,2)
            
            front_distance = np.mean(front_scan)
            left_distance = np.mean(left_scan)
            right_distance = np.mean(right_scan)
            
            print("front : ", front_distance)    
            print("left : ", left_distance)
            print("right : ", right_distance)
            
            x_label = np.linspace(0,20,20)
            
            x_polyfit = np.polyfit(x_label,front_scan,2)
            
            #y = x_polyfit[0]*x_label*x_label + x_polyfit[1]*x_label + x_polyfit[0]
            
            
            
            #plt.plot(x_label,y,'r-')
            plt.plot(x_label,front_scan,'r*')
            plt.plot(x_label,right_scan,'g*')
            plt.plot(x_label,left_scan,'b*')
            
            plt.show()
            #min_distance = min(lidar_distances)
            #print("min_distance : ", min_distance)
            #if min_distance < SAFE_STOP_DISTANCE:
            #    if turtlebot_moving:
            #        twist.linear.x = 0.0
            #        twist.angular.z = 0.0
            #        self._cmd_pub.publish(twist)
            #        turtlebot_moving = False
            #        rospy.loginfo('Stop!')
            #else:
            #    twist.linear.x = LINEAR_VEL
            #    twist.angular.z = 0.0
            #    self._cmd_pub.publish(twist)
            #    turtlebot_moving = True
            #    rospy.loginfo('Distance of the front obstacle : %f', min_distance)

def main():
    rospy.init_node('turtlebot3_obstacle')
    try:
        obstacle = Obstacle()
    except rospy.ROSInterruptException:
        pass

if __name__ == '__main__':
    main()
