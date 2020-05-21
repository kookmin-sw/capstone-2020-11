#!/usr/bin/env python

import rospy
import cv2
import numpy as np
from cv_bridge import CvBridge, CvBridgeError
from sensor_msgs.msg import Image
from sensor_msgs.msg import CompressedImage

class Raw_Image():
    def __init__(self):
        self.selecting_sub_image = "compressed"
        self.frame_width = 800
        self.frame_height = 600

        if self.selecting_sub_image == "compressed":
            self._sub = rospy.Subscriber('/usb_cam/image_raw/compressed', CompressedImage, self.callback, queue_size=1)
        else:
            self._sub = rospy.Subscriber('/usb_cam/image_raw', Image, self.callback, queue_size=1)
        self.bridge = CvBridge()
    
    def callback(self, image_msg):
        if self.selecting_sub_image == "compressed":
            #converting compressed image to opencv image
            np_arr = np.fromstring(image_msg.data, np.uint8)
            cv_image = cv2.imdecode(np_arr, cv2.IMREAD_COLOR)
        elif self.selecting_sub_image == "raw":
            cv_image = self.bridge.imgmsg_to_cv2(image_msg, "bgr8")
        src = np.float32([[0, self.frame_height], [800, self.frame_height], [200, self.frame_height//3], [self.frame_width-200, self.frame_height//3]])
        dst = np.float32([[0, self.frame_height], [800, self.frame_height], [0, 0], [self.frame_width, 0]])
        M = cv2.getPerspectiveTransform(src, dst) # The transformation matrix
        Minv = cv2.getPerspectiveTransform(dst, src) # Inverse transformation
        warped_img = cv2.warpPerspective(cv_image, M, (self.frame_width, self.frame_height))

        cv2.imshow("raw_image",cv_image)
        cv2.imshow('cv_image', warped_img), cv2.waitKey(1)
    def main(self):
        rospy.spin()
 
if __name__ == '__main__':
    rospy.init_node('gray')
    node = Raw_Image()
    node.main()
        



