import cv2

def show_zoom(mirror=False):
    scale = 10
    
    cam = cv2.VideoCapture(1)
    
    cam.set(3,1920)
    cam.set(4, 1080)
    
    while True:
        ret, image = cam.read()
        
        if mirror:
            image = cv2.filp(image,1)
            
        # get webcam size
        height, width, channels = image.shape
        
        # prepare the crop center point
        centerX, centerY = int(height/2-200), int(width/2+200)
        radiusX, radiusY = int(scale*height/100), int(scale*width/100)
        
        minX,maxX = centerX-radiusX, centerX+radiusX
        minY,maxY = centerY-radiusY, centerY+radiusY
        
        cropped = image[minX:maxX, minY:maxY]
        resized_cropped = cv2.resize(cropped, (width,height))
        
        print("scale factor : ", scale)
        cv2.imshow("src", resized_cropped)
        
        if cv2.waitKey(1) & 0XFF == ord('q'):
            break
            
        elif cv2.waitKey(1) == ord('s'):
            if scale < 30:
                scale+=5
        elif cv2.waitKey(1) == ord('a'):
            if scale > 5:
                scale-=5
            
def main():
    show_zoom()
    
if __name__ == '__main__':
    main()
