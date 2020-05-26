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
        self.w = 640
        self.h = 360
        self.warper = Warper()
        self.slidewindow  = SlideWindow()
        self.histo_gap = 50
        self.count_threshold = 4
        
    def main(self):
        global now
        #out = cv2.VideoWriter('/home/chanwoo/Desktop/capstone-2020-11/src/olaf/src/lane_recognization/final {}-{}-{} {}-{}.avi'.format(now.year, now.month, now.day, now.hour, now.minute), cv2.VideoWriter_fourcc('M','J','P','G'), 30, (1280,720))
        #out2 = cv2.VideoWriter('/home/nvidia/Desktop/video/original {}-{}-{} {}-{}.avi'.format(now.year, now.month, now.day, now.hour, now.minute), cv2.VideoWriter_fourcc('M','J','P','G'), 30, (1280,720))
        cap = cv2.VideoCapture("/home/chanwoo/catkin_ws/src/opencv/src/video0.avi")
        cap.set(5, 10)
        while cap.isOpened():
            ret, frame = cap.read()
            img, x_location = self.process_image(frame)
            #out.write(img)
            cv2.imshow('result', img)
            if cv2.waitKey(1) & 0xFF == ord('q'):
                break
        cv2.destroyAllWindows()
        cap.release()
        #out.release()
        
    def use_histo_point(self, img):
        # for image make
        ret = np.zeros_like(img)

        # create width array
        hist = list(np.zeros(self.w))
        
        # height searching
        #for i in range(self.w):
        #    for j in range(self.h):
        #        tp = img[j,i]
        #        if tp == 255:
        #            hist[i] += 1
        for i in range(self.w):
            count = 0
            tmp = np.array(img[:,i])
            hist[i] = np.count_nonzero(tmp)
        
        # create sub list
        hist1_max = max(hist[0:self.w//2])
        hist2_max = max(hist[self.w//2:self.w])

        idx1 = hist[0:self.w//2].index(hist1_max)
        idx2 = hist[self.w//2:self.w].index(hist2_max)
        
        return_lane = [-1, -1]
        
        if hist1_max > self.count_threshold:
            return_lane[0] = idx1
        if hist2_max > self.count_threshold:
            return_lane[1] = idx2 + self.w//2
        
        #print(return_lane)
        return return_lane

    def use_histo(self, img):
        # for image make
        ret = np.zeros_like(img)

        # create width array
        hist = list(np.zeros(self.w))
        
        # height searching
        for i in range(self.w):
            count = 0
            tmp = np.array(img[:,i])
            hist[i] = np.count_nonzero(tmp)
        
        # create sub list
        hist1_max = max(hist)
        if hist1_max < self.count_threshold:
            return img
      
        # get max value's index
        idx1 = hist.index(hist1_max)

        # make roi
        idx1_low = idx1 - self.histo_gap
        idx1_high = idx1 + self.histo_gap
             
        if idx1_low < 0:
            idx1_low = 0

        if idx1_high > self.w:
            idx1_high = self.w

        ret[0:self.h,idx1_low:idx1_high] = img[0:self.h,idx1_low:idx1_high]
        zeros = np.zeros(idx1_high - idx1_low)
        hist[idx1_low:idx1_high] = zeros
        hist2_max = max(hist)
        if hist2_max < self.count_threshold:
            return ret
        idx2 = int(hist.index(hist2_max))
        idx2_low = idx2 - self.histo_gap
        idx2_high = idx2 + self.histo_gap
        if idx2_low < 0:
            idx2_low = 0
        if idx2_high > self.w:
            idx2_high = self.w
        ret[0:self.h,idx2_low:idx2_high] = img[0:self.h,idx2_low:idx2_high]
        return ret



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
        img = self.use_histo(img)
        #k = self.use_histo_point(img)
        img1, x_location = self.slidewindow.slidewindow(img)
        return img1, x_location
 
if __name__ == '__main__':
    node = Raw_Image()
    node.main()
        



