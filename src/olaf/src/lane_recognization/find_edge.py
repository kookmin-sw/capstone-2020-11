import cv2
import numpy as np
from slidewindow import SlideWindow
from warper import Warper
import time
from datetime import datetime # for record
now = datetime.now() # for record

class Raw_Image():
    def __init__(self):
        self.frame_width = 1280
        self.frame_height = 720
        self.warper = Warper()
        self.slidewindow  = SlideWindow()
        
    def main(self):
        global now
        out = cv2.VideoWriter('/home/chanwoo/Desktop/capstone-2020-11/src/olaf/src/lane_recognization/final {}-{}-{} {}-{}.avi'.format(now.year, now.month, now.day, now.hour, now.minute), cv2.VideoWriter_fourcc('M','J','P','G'), 30, (1280,720))
        #out2 = cv2.VideoWriter('/home/nvidia/Desktop/video/original {}-{}-{} {}-{}.avi'.format(now.year, now.month, now.day, now.hour, now.minute), cv2.VideoWriter_fourcc('M','J','P','G'), 30, (1280,720))
        cap = cv2.VideoCapture("/home/chanwoo/Desktop/capstone-2020-11/src/olaf/src/lane_recognization/video0.avi")
        cap.set(5, 10)
        while cap.isOpened():
            ret, frame = cap.read()
            img, x_location = self.process_image(frame)
            out.write(img)
            cv2.imshow('result', img)
            if cv2.waitKey(1) & 0xFF == ord('q'):
                break
        cv2.destroyAllWindows()
        cap.release()
        out.release()
        
    def process_image(self, frame):
        # grayscle
        gray = cv2.cvtColor(frame,cv2.COLOR_BGR2GRAY)
        # blur
        kernel_size = 5
        blur_gray = cv2.GaussianBlur(gray,(kernel_size, kernel_size), 0)
        # canny edge
        low_threshold = 20#60
        high_threshold = 60# 70
        #edges_img = cv2.Canny(np.uint8(blur_gray), low_threshold, high_threshold)
        # edges_img = cv2.Sobel(np.uint8(blur_gray), cv2.CV_64F, 0, 1, ksize=3)
        edges_img = cv2.Sobel(blur_gray, cv2.CV_8U, 1, 0, 3)
        ret, edges_img1 = cv2.threshold(edges_img, 33, 255, cv2.THRESH_BINARY)
        x_location = 0
        # warper
        img = self.warper.warp(edges_img1)
        img1, x_location = self.slidewindow.slidewindow(img)
        return img1, x_location
 
if __name__ == '__main__':
    node = Raw_Image()
    node.main()
        



