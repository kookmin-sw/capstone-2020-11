#!/usr/bin/env python

import rospy, time
from std_msgs.msg import Int32MultiArray
from darknet_ros_msgs.msg import BoundingBoxes

steering_pub = None
box_data = None

def init_node():
    global steering_pub
    rospy.init_node('steering')
    rospy.Subscriber('/darknet_ros/bounding_boxes',
                    BoundingBoxes, callback)
    steering_pub = rospy.Publisher('from_yolo_to_lidar',
                                Int32MultiArray, queue_size=1)
    
def exit_node():
    print('finished')

def drive(angle, speed):
    global steering_pub
    drive_info = [angle, speed]
    pub_data = Int32MultiArray(data=drive_info)
    steering_pub.publish(pub_data)
    rate.sleep()

def callback(data):
    global box_data
    box_data = data

if __name__ == '__main__':
    init_node()
    rate = rospy.Rate(10)
    while box_data is None:
        rate.sleep()

    while not rospy.is_shutdown():
        nobody = True
        boxes = box_data
        center = 0
        width = 0
        l = []
        for i in range(len(boxes.bounding_boxes)):
            if boxes.bounding_boxes[i].Class == "person":
                nobody = False
                center = (boxes.bounding_boxes[i].xmin + boxes.bounding_boxes[i].xmax) // 2
                width = (boxes.bounding_boxes[i].xmax - boxes.bounding_boxes[i].xmin) // 2
                l.append((center, width))
        #print("center :", center, "\t, width :", width)
        l2 = sorted(l, key=lambda x:x[1], reverse=True)
        if nobody:
            drive(0, 0)
            #print("not exist person")
            continue
        drive(l2[0][0], l2[0][1])

    rospy.on_shutdown(exit_node)
