import cv2

video1 = "output_test.mp4"

#video2 = "output2.mp4"

cap1 = cv2.VideoCapture(1)

cap1.set(3,1920)
cap1.set(4, 1080)
#cap2 = cv2.VideoCapture(2)
width = int(cap1.get(cv2.CAP_PROP_FRAME_WIDTH))
height = int(cap1.get(cv2.CAP_PROP_FRAME_HEIGHT))

fourcc = cv2.VideoWriter_fourcc(*'MJPG')

out1 = cv2.VideoWriter('output_TEST_1.avi', fourcc, 25.0, (width,height))
#out2 = cv2.VideoWriter('output2.avi', fourcc, 25,(1920,1080))

print(width, ' ', height,)

while True:
    ret1,frame1 = cap1.read()
    #ret2,frame2 = cap2.read()
    
    if ret1:
        
        out1.write(frame1)
        #out2.write(frame2)
        
        cv2.imshow("src1",frame1)
        #cv2.imshow("src2",frame2)
        
        if cv2.waitKey(1) & 0XFF == ord('q'):
            break
        

cap1.release()
#cap2.release()    
out1.release()
#out2.release()
cv2.destroyAllWindows()
