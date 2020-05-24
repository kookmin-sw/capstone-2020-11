import cv2
import numpy as np

from warper import Warper
from slidewindow import SlideWindow


videoFile = "output_TEST_1.avi"

cap = cv2.VideoCapture(videoFile)
warper = Warper()
slidewindow = SlideWindow()

while(cap.isOpened()):
    ret, frame = cap.read()
    
    frame = cv2.resize(frame,(1280,720))
    #print(frame.shape)
    if ret:
        warp_img = warper.warp(frame)
        gray_img = cv2.cvtColor(warp_img,cv2.COLOR_BGR2GRAY)
        
        kernel_size = 5 
        blur_img = cv2.GaussianBlur(gray_img,(kernel_size, kernel_size), 0)
        
        edge_img = cv2.Canny(blur_img,15,60)

        img, x_location = slidewindow.slidewindow(edge_img)
        
        #cv2.circle(img, x_location, 5, (0, 255, 0), -1) 
        
        cv2.imshow("edge_img",edge_img)
        #cv2.imshow("src",frame)
        cv2.imshow("warp_img",img)
        #cv2.imshow("src",frame)
        if cv2.waitKey(1) & 0XFF ==ord('q'):
            break
    else:
        break
        
