#!/usr/bin/env python

import rospy
import cv2
import numpy as np
from cv_bridge import CvBridge, CvBridgeError
from sensor_msgs.msg import Image
from sensor_msgs.msg import CompressedImage
from slidewindow import SlideWindow
from warper import Warper
from datetime import datetime
import time

cv_image = None
now = datetime.now()

class Raw_Image():
    def __init__(self):
        self.selecting_sub_image = "raw"
        self.frame_width = 1280
        self.frame_height = 720
        self.warper = Warper()
        self.slidewindow  = SlideWindow()

        if self.selecting_sub_image == "compressed":
            self._sub = rospy.Subscriber('/usb_cam1/image_raw/compressed', CompressedImage, self.callback, queue_size=1)
        else:
            self._sub = rospy.Subscriber('/usb_cam1/image_raw', Image, self.callback, queue_size=1)
        self.bridge = CvBridge()
    
    def callback(self, image_msg):
        global cv_image
        if self.selecting_sub_image == "compressed":
            #converting compressed image to opencv image
            np_arr = np.fromstring(image_msg.data, np.uint8)
            cv_image = cv2.imdecode(np_arr, cv2.IMREAD_COLOR)
        elif self.selecting_sub_image == "raw":
            cv_image = self.bridge.imgmsg_to_cv2(image_msg, "bgr8")
        
    def main(self):
        global cv_image
        global now
        
        rospy.sleep(3)
        bride = CvBridge()

        #out = cv2.VideoWriter('/home/nvidia/Desktop {}-{}-{} {}-{}.avi'.format(now.year, now.month, now.day, now.hour, now.minute), cv2.VideoWriter_fourcc('M','J','P','G'), 30, (1280,720))

        while not rospy.is_shutdown():
            #print(cv_image.shape)
            img, x_location = self.process_image(cv_image)
            #out.write(cv_image)
            cv2.imshow('result', img)
            if cv2.waitKey(1) & 0xFF == ord('q'):
                break
            
        try:    
            rospy.spin()
        except KeyboardInterrupt:
            print("Shutting down")
        finally:
            print('Finally')
            #out.release()
            cv2.destroyAllWindows() 
        

    def process_image(self,frame):
        hist = []
        #for i in range(0,)
        # grayscle
        gray = cv2.cvtColor(frame,cv2.COLOR_BGR2GRAY)
        # blur
        kernel_size = 5
        blur_gray = cv2.GaussianBlur(gray,(kernel_size, kernel_size), 0)
        # canny edge
        #edges_img = cv2.Sobel(blur_gray, cv2.CV_8U, 1, 0, 3)
        edges_img = cv2.Sobel(blur_gray, cv2.CV_8U, 1, 0, 3)
        #edges_img = cv2.erode(edges_img, (3,3), iterations=1)
        #edges_img = cv2.dilate(edges_img, (3,3), iterations=3)
        cv2.imshow('edge', edges_img)
        ret, edges_img = cv2.threshold(edges_img, 33, 255, cv2.THRESH_BINARY)
        cv2.imshow('binary', edges_img)
        # warper
        img = self.warper.warp(frame)
        img1, x_location = self.slidewindow.slidewindow(img)
        return img1, x_location
 
if __name__ == '__main__':
    rospy.init_node('gray')
    node = Raw_Image()
    node.main()
        



