import cv2
import numpy as np


class Warper:
    def __init__(self):
        self.h = 720
        self.w = 1280
        self.mapping_h = 360
        self.mapping_w = 640

        print("input_w : " ,self.w)
        print("input_h : " ,self.h)
        print("output_w : " ,self.mapping_w)
        print("output_h : " ,self.mapping_h)
         
        # distort scr to dst
        src = np.float32([
            [0, self.h],
            [self.w, self.h],
            [self.w//2 - 290, 200],
            [self.w//2 + 310, 200],
        ])
        dst = np.float32([
            [0, self.mapping_h],
            [self.mapping_w, self.mapping_h],
            [0, 0],
            [self.mapping_w , 0],
        ])
        

        self.M = cv2.getPerspectiveTransform(src, dst)
        self.Minv = cv2.getPerspectiveTransform(dst, src)

    def warp(self, img):
        return cv2.warpPerspective(
            img,
            self.M,
            (self.mapping_w, self.mapping_h),
            flags=cv2.INTER_LINEAR
        )

    def unwarp(self, img):
        return cv2.warpPersective(
            img,
            self.Minv,
            (self.w, self.h),
            flags=cv2.INTER_LINEAR
        )
