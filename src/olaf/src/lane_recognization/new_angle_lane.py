import cv2
import numpy as np
import os

width = 1920
height = 1080
lower_light = np.array([0, 0, 0])
upper_light = np.array([240, 240, 130]) # [255, 255, 130]
edge_min = 20   # 20
edge_max = 60   # 50
roi_h1_gap = 50
roi_h2_gap = 200
roi_w_gap = 500
centor_gap = 100
hough_min_lengh = 10
hough_max_gap = 10
# vertices = np.array([[10,500],[10,300],[300,200],[500,200],[800,300],[800,500],], np.int32)
vertices = np.array([[0, height], [0, height - roi_h1_gap], [width // 2 - roi_w_gap, height - roi_h2_gap]
                        , [width // 2 + roi_w_gap, height - roi_h2_gap], [width, height - roi_h1_gap], [width, height]],dtype=np.int32)
rank = 10

# def Except_light():


def Edge_Recalibration(img):
    global edge_min, edge_min
    result = cv2.Canny(img, edge_min, edge_max)
    return result

def Region_Of_Interest(img, vertices, color3=(255, 255, 255), color1=255):  # ROI 셋팅
    mask = np.zeros_like(img)  # mask = img와 같은 크기의 빈 이미지
    if len(img.shape) > 2:  # Color 이미지(3채널)라면 :
        color = color3
    else:  # 흑백 이미지(1채널)라면 :
        color = color1
    # vertices에 정한 점들로 이뤄진 다각형부분(ROI 설정부분)을 color로 채움
    cv2.fillPoly(mask, vertices, color)
    # 이미지와 color로 채워진 ROI를 합침
    ROI_image = cv2.bitwise_and(img, mask)
    return ROI_image

if __name__ == '__main__':
    cap = cv2.VideoCapture('test1.avi')
    while(cap.isOpened()):
        ret, frame = cap.read()
        image = cv2.resize(frame, dsize=(width, height), interpolation=cv2.INTER_AREA)
        hsv = cv2.cvtColor(image, cv2.COLOR_BGR2HSV)
        mask = cv2.inRange(hsv, lower_light, upper_light)
        kernel = np.ones((7, 7), np.uint8)
        result = cv2.dilate(mask, kernel, iterations=3)
        result = cv2.erode(result, kernel, iterations=1)
        res = cv2.bitwise_and(frame, frame, mask=result)
        cv2.imshow('res', res)
        gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
        edge = Edge_Recalibration(gray)
        # roi = Region_Of_Interest(gray, vertices)
        lines = cv2.HoughLinesP(edge, 1, np.pi / 360, 100, hough_min_lengh, hough_max_gap)
        if lines is not None:
            for line in lines:
                x1, y1, x2, y2 = line.reshape(4)
                cv2.line(edge, (x1, y1), (x2, y2), 255, 10)
        view_tp = np.zeros_like(image)
        lines = cv2.HoughLinesP(edge, 1, np.pi / 360, 100, hough_min_lengh, hough_max_gap)
        if lines is not None:
            for line in lines:
                x1, y1, x2, y2 = line.reshape(4)
                cv2.line(image, (x1, y1), (x2, y2), (255, 0, 0), 5)
                cv2.line(view_tp, (x1, y1), (x2, y2), (255, 255, 255), 5)
        rest = cv2.bitwise_and(view_tp, res)
        cv2.imshow('frame', rest)
        cv2.imshow('origin', image)



        if cv2.waitKey(1) & 0xFF == ord('q'):
            break
    cap.release()
    cv2.destroyAllWindows()

"""
def Region_Of_Interest(img, vertices, color3=(255, 255, 255), color1=255):  # ROI 셋팅
    mask = np.zeros_like(img)  # mask = img와 같은 크기의 빈 이미지
    if len(img.shape) > 2:  # Color 이미지(3채널)라면 :
        color = color3
    else:  # 흑백 이미지(1채널)라면 :
        color = color1
    # vertices에 정한 점들로 이뤄진 다각형부분(ROI 설정부분)을 color로 채움
    cv2.fillPoly(mask, vertices, color)
    # 이미지와 color로 채워진 ROI를 합침
    ROI_image = cv2.bitwise_and(img, mask)
    return ROI_image

def Roi(img):
    global width
    global roi_height, roi_width
    w = width // 2
    r = img[roi_height:, w:w + roi_width]
    l = img[roi_height:, w - roi_width:w]
    return l, r

def Edge_Recalibration(img):
    global edge_min, edge_min
    result = cv2.Canny(img, edge_min, edge_max)
    return result

if __name__ == '__main__':
    for root, dirs, files in os.walk('/Users/chanwoo/Downloads/video_data-2'):
        size = len(files)
        # for fname in files:
        for idx in range(1, size + 1):
            fname = 'frame'+str(idx)+'.png'
            full_fname = os.path.join(root, fname)
            if fname == '.DS_Store':
                continue
            origin = cv2.imread(full_fname, cv2.IMREAD_COLOR)
            image = cv2.resize(origin, dsize=(width, height), interpolation=cv2.INTER_AREA)
            # ---------------------
            gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
            edge = Edge_Recalibration(gray)
            roi = edge[roi_height:, :]
            lines = cv2.HoughLinesP(roi, 1, np.pi / 360, 100, hough_min_lengh, hough_max_gap)
            if lines is not None:
                for line in lines:
                    x1, y1, x2, y2 = line.reshape(4)
                    cv2.line(roi, (x1, y1), (x2, y2), 255, 10)

            lines = cv2.HoughLinesP(roi, 1, np.pi / 360, 100, hough_min_lengh, hough_max_gap)
            lines_left = []
            lines_right = []
            dst = image.copy()
            dst2 = image.copy()
            if lines is not None:
                for line in lines:
                    x1, y1, x2, y2 = line.reshape(4)
                    dx = x2 - x1
                    if dx == 0 or abs(dx) > 10:
                        continue
                    dy = y2 - y1
                    m = dy / dx
                    if abs(m) > 0.1 and abs(m) < 300:
                        cv2.line(image, (x1, y1 + roi_height), (x2, y2 + roi_height), (0, 0, 255), 2)
                        tp = m * x1
                        b = y1 - tp
                        start_y = height - roi_height
                        start_x = int((start_y - b) / m)
                        if start_x < 0 or start_x > width:
                            continue
                        end_y = 0
                        end_x = int((end_y - b) / m)
                        if start_x < (width // 2):
                            lines_left.append([start_x, start_y, end_x, end_y])
                        else:
                            lines_right.append([start_x, start_y, end_x, end_y])
                        cv2.line(dst2, (start_x, start_y + roi_height), (end_x, end_y + roi_height), (0, 0, 255), 2)
            # cv2.imshow('candidate', dst2)
            lines_right.sort(key=lambda x:x[0])
            lines_left.sort(key=lambda x:x[0])
            lines_left.reverse()
            right_cnt = rank
            left_cnt = rank
            sum_start_x = 0
            sum_start_y = 0
            sum_end_x = 0
            sum_end_y = 0

            if lines_left is not None:
                for line in lines_left:
                    if left_cnt == 0:
                        break
                    left_cnt -= 1
                    sum_start_x += line[0]
                    sum_start_y += line[1]
                    sum_end_x += line[2]
                    sum_end_y += line[3]
            if lines_right is not None:
                for line in lines_right:
                    if right_cnt == 0:
                        break
                    right_cnt -= 1
                    sum_start_x += line[0]
                    sum_start_y += line[1]
                    sum_end_x += line[2]
                    sum_end_y += line[3]
            if ((20 - left_cnt) - right_cnt) != 0:
                final_x1 = sum_start_x // ((20 - left_cnt) - right_cnt)
                final_y1 = sum_start_y // ((20 - left_cnt) - right_cnt)
                final_x2 = sum_end_x // ((20 - left_cnt) - right_cnt)
                final_y2 = sum_end_y // ((20 - left_cnt) - right_cnt)
                cv2.line(dst, (final_x1, final_y1 + roi_height), (final_x2, final_y2 + roi_height), (0, 0, 255), 5)
                print('bottom_x :', final_x1, ' bottom_y :', final_y1)
                print('top_x :', final_x2, ' top_y :', final_y2)
                # ---------------------
                cv2.imshow('result', dst)
            # cv2.imshow('Original', image)
            cv2.waitKey(2)
            cv2.destroyAllWindows()"""
