import cv2


cap = cv2.VideoCapture(0)
width = int(cap.get(cv2.CAP_PROP_FRAME_WIDTH))
height = int(cap.get(cv2.CAP_PROP_FRAME_HEIGHT))

fourcc = cv2.VideoWriter_fourcc(*'XVID')

# 컬러 영상 저장시
writer = cv2.VideoWriter('output.avi', fourcc, 30.0, (width, height))
# 그레이스케일 영상 저장시
# writer = cv2.VideoWriter('output.avi', fourcc, 30.0, (width, height), 0)

while True:
    ret,img_color = cap.read()

    if ret == False:
        break

    img_gray = cv2.cvtColor(img_color, cv2.COLOR_BGR2GRAY)

    cv2.imshow("Color", img_color)
    cv2.imshow("Gray", img_gray)

    writer.write(img_color)

    if cv2.waitKey(1)&0xFF == 27:
        break

cap.release()
writer.release()
cv2.destroyAllWindows()
