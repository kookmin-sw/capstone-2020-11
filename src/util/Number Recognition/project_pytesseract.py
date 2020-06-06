#!/usr/bin/etc python
import cv2
import numpy as np
import pytesseract
from  PIL import Image

class Recognition:
     def ExtractNumber(self):
          Number='test.jpg'
          img=cv2.imread(Number,cv2.IMREAD_COLOR)
          width, height, channels = img.shape

          print("width : ", width)
          print("height : ", height)
          print("channels : ", channels)

          copy_img=img.copy()

          img_1 = copy_img[:width//2,height//2:]


          img2=cv2.cvtColor(img_1,cv2.COLOR_BGR2GRAY)
          ret,img_binary = cv2.threshold(img2, 50, 255, cv2.THRESH_BINARY)

          cv2.imshow("binary", img_binary)

          img_3 = cv2.cvtColor(img_1,cv2.COLOR_BGR2YUV)
          #cv2.imshow("lab",img_3)
          # h,s,v = cv2.split(img2)
          # ret, th_s = cv2.threshold(s,130,255,cv2.THRESH_BINARY)

          l,a,b = cv2.split(img_3)
          # cv2.imshow("l",l)
          # cv2.imshow("a",a)
          # cv2.imshow("b",b)

          #cv2.imwrite('gray.jpg',img2)
          blur = cv2.GaussianBlur(img2,(5,5),0)
          # cv2.imshow('h_img',img_1)
          # cv2.imshow('s_img',th_s)
          # cv2.imshow('v_img',v)
          # cv2.waitKey(100000)
          canny=cv2.Canny(img_binary,100,200)
          #cv2.imshow('canny.jpg',img2)
          # cv2.waitKey(100000)
          contours,hierarchy  = cv2.findContours(img_binary, cv2.RETR_TREE, cv2.CHAIN_APPROX_SIMPLE)
         #
          box1=[]
          f_count=0
          select=0
          plate_width=0
         #
          for i in range(len(contours)):
               cnt=contours[i]
               area = cv2.contourArea(cnt)
               x,y,w,h = cv2.boundingRect(cnt)
               rect_area=w*h  #area size
               aspect_ratio = float(w)/h # ratio = width/height

               if  (aspect_ratio>=0.2)and(aspect_ratio<=1.0)and(rect_area>=100)and(rect_area<=700):
                    #cv2.rectangle(img_1,(x,y),(x+w,y+h),(0,255,0),1)
                    box1.append(cv2.boundingRect(cnt))

          for i in range(len(box1)): ##Buble Sort on python
               for j in range(len(box1)-(i+1)):
                    if box1[j][0]>box1[j+1][0]:
                         temp=box1[j]
                         box1[j]=box1[j+1]
                         box1[j+1]=temp

         #to find number plate measureing length between rectangles
          for m in range(len(box1)):
               count=0
               for n in range(m+1,(len(box1)-1)):
                    delta_x=abs(box1[n+1][0]-box1[m][0])
                    if delta_x > 50:
                         break
                    delta_y =abs(box1[n+1][1]-box1[m][1])
                    if delta_x ==0:
                         delta_x=1
                    if delta_y ==0:
                         delta_y=1
                    gradient =float(delta_y) /float(delta_x)
                    if gradient<0.25:
                        count=count+1
               #measure number plate size
               if count > f_count:
                    select = m
                    f_count = count;
                    plate_width=delta_x
          #cv2.imwrite('snake.jpg',img)


          number_plate=img_1[box1[select][1]-10:box1[select][3]+box1[select][1]+20,box1[select][0]-10:140+box1[select][0]]
          resize_plate=cv2.resize(number_plate,None,fx=1.8,fy=1.4,interpolation=cv2.INTER_CUBIC+cv2.INTER_LINEAR)
          plate_gray=cv2.cvtColor(resize_plate,cv2.COLOR_BGR2GRAY)
          ret,th_plate = cv2.threshold(plate_gray,50,255,cv2.THRESH_BINARY)

          cv2.imshow("img1",th_plate)
          cv2.imshow('plate_th.jpg',number_plate)

          kernel = np.ones((3,3),np.uint8)
          er_plate = cv2.erode(th_plate,kernel,iterations=1)
          er_plate = cv2.dilate(er_plate,kernel,iterations=1)
          er_invplate = er_plate
          er_invplate = cv2.resize(er_invplate,(640,480),interpolation=cv2.INTER_CUBIC+cv2.INTER_LINEAR)
          cv2.imwrite('er_plate.jpg',er_invplate)
          #pytesseract.pytesseract.tesseract_cmd = "/home/sun/Desktop/label/tesseract-ocr-w64-setup-v4.1.0-bibtag19.exe"
          result = pytesseract.image_to_string(Image.open('er_plate.jpg'), lang='eng')
          print("Room Number Recognition : ", result)
          cv2.waitKey(100000)
          # return(result.replace(" ","")
          return result

recogtest=Recognition()
result=recogtest.ExtractNumber()
