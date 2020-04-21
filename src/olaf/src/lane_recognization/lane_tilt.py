import cv2
import numpy as np

image_path = 'frame89.png'
width = 1280
height = 720
roi_height = height // 2 + 100
roi_width = width // 2 - 100
edge_min = 20   # 30
edge_max = 70   # 90
hough_min_lengh = 0
hough_max_gap = 0
rank = 10

def Roi(img):
    global width
    global roi_height, roi_width
    w = width // 2
    r = img[roi_height:, w:w + roi_width]
    l = img[roi_height:, w - roi_width:w]
    return l, r

def Remove_VerAndHor(lines):

    return lines

def Edge_Recalibration(img):
    global edge_min, edge_min
    result = cv2.Canny(img, edge_min, edge_max)
    return result

if __name__ == '__main__':
    origin = cv2.imread(image_path, cv2.IMREAD_COLOR)
    image = cv2.resize(origin, dsize=(1280, 720), interpolation=cv2.INTER_AREA)
    # ---------------------
    gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
    # left, right = Roi(gray)
    edge = Edge_Recalibration(gray)
    # right_edge = Edge_Recalibration(right)
    roi = edge[roi_height:, :]
    cv2.imshow('l', roi)
    # cv2.imshow('r', right_edge)
    lines = cv2.HoughLinesP(roi, 1, np.pi / 360, 100, hough_min_lengh, hough_max_gap)
    if lines is not None:
        for line in lines:
            # print(line)
            x1, y1, x2, y2 = line.reshape(4)
            # dx = x2 - x1
            # if dx == 0:
            #     continue
            # dy = y2 - y1
            # dydx = abs(dy / dx)
            # if dydx > 0.1 and dydx < 200:
            cv2.line(roi, (x1, y1), (x2, y2), 255, 10)

    lines = cv2.HoughLinesP(roi, 1, np.pi / 360, 100, hough_min_lengh, hough_max_gap)
    lines_left = []
    lines_right = []
    dst = image.copy()
    dst2 = image.copy()
    if lines is not None:
        for line in lines:
            # print(line)
            x1, y1, x2, y2 = line.reshape(4)
            dx = x2 - x1
            if dx == 0:
                continue
            dy = y2 - y1
            m = dy / dx

            if abs(m) > 0.1 and abs(m) < 200:
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
            # x1 = line[0]
            # y1 = line[1]
            # x2 = line[2]
            # y2 = line[3]
            # cv2.line(dst, (x1, y1 + roi_height), (x2, y2 + roi_height), (255, 0, 0), 2)
    if lines_right is not None:
        for line in lines_right:
            if right_cnt == 0:
                break
            right_cnt -= 1
            sum_start_x += line[0]
            sum_start_y += line[1]
            sum_end_x += line[2]
            sum_end_y += line[3]
            # x1 = line[0]
            # y1 = line[1]
            # x2 = line[2]
            # y2 = line[3]
            # cv2.line(dst, (x1, y1 + roi_height), (x2, y2 + roi_height), (0, 0, 255), 2)

    final_x1 = sum_start_x // 20
    final_y1 = sum_start_y // 20
    final_x2 = sum_end_x // 20
    final_y2 = sum_end_y // 20
    cv2.line(dst, (final_x1, final_y1 + roi_height), (final_x2, final_y2 + roi_height), (0, 0, 255), 5)
    print('bottom_x :', final_x1, ' bottom_y :', final_y1)
    print('top_x :', final_x2, ' top_y :', final_y2)
    # ---------------------
    cv2.imshow('result', dst)
    cv2.imshow('Original', image)
    cv2.waitKey(0)
    cv2.destroyAllWindows()
