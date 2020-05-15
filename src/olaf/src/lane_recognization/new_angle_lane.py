import cv2
import numpy as np
from matplotlib import pyplot as plt
import os

width = 1080
height = 720
lower_light = np.array([0, 0, 0]) # ([0, 0, 0]
upper_light = np.array([255, 255, 130]) # [255, 255, 130]  ([240, 240, 130])
edge_min = 20   # 20
edge_max = 60   # 50
centor_gap = 100
hough_min_lengh = 10
hough_max_gap = 10
rank = 10

def Edge_Recalibration(img):
    global edge_min, edge_min
    result = cv2.Canny(img, edge_min, edge_max)
    return result

if __name__ == '__main__':
    cap = cv2.VideoCapture('test1.avi')
    while(cap.isOpened()):
        hist = []
        for i in range(0, 1581):
            hist.append(0)
        # hist = np.array([0 for _ in range(1580), dytpe=uint8])
        ret, frame = cap.read()
        image = cv2.resize(frame, dsize=(width, height), interpolation=cv2.INTER_AREA)
        frame = image.copy()
        hsv = cv2.cvtColor(image, cv2.COLOR_BGR2HSV)
        mask = cv2.inRange(hsv, lower_light, upper_light)
        kernel = np.ones((7, 7), np.uint8)
        result = cv2.dilate(mask, kernel, iterations=3)
        result = cv2.erode(result, kernel, iterations=1)
        res = cv2.bitwise_and(frame, frame, mask=result)
        # cv2.imshow('hsv', res)
        gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
        edge = Edge_Recalibration(gray)
        # roi = Region_Of_Interest(gray, vertices)
        lines = cv2.HoughLinesP(edge, 1, np.pi / 360, 100, hough_min_lengh, hough_max_gap)
        if lines is not None:
            for line in lines:
                x1, y1, x2, y2 = line.reshape(4)
                cv2.line(edge, (x1, y1), (x2, y2), 255, 10)
        view_tp = np.zeros_like(image)
        edge = cv2.bitwise_and(edge, edge, mask=result)
        edge = cv2.erode(edge, kernel, iterations=1)
        edge = cv2.dilate(edge, kernel, iterations=1)
        new_lines = []
        new_x = []
        lines_left = []
        lines_right = []
        lines = cv2.HoughLinesP(edge, 1, np.pi / 360, 100, hough_min_lengh, hough_max_gap)
        if lines is not None:
            for line in lines:
                x1, y1, x2, y2 = line.reshape(4)
                dx = x2 - x1
                if dx == 0:
                    continue
                dy = y2 - y1
                m = dy / dx
                if abs(m) > 0.2 and abs(m) < 300:
                    tp = m * x1
                    b = y1 - tp
                    start_y = height
                    start_x = int((start_y - b) / m)
                    if start_x <= -250 or start_x > width+250:
                        continue
                    hist[start_x + 250] = hist[start_x + 250] + 1
                    end_y = 0
                    end_x = int((end_y - b) / m)
                    new_lines.append([start_x, start_y, end_x, end_y])
                    new_x.append(start_x)
                    # if start_x < (width // 2):
                    #     cv2.line(image, (start_x, start_y), (end_x, end_y), (255, 0, 0), 2)
                    # else:
                    #     cv2.line(image, (start_x, start_y), (end_x, end_y), (0, 0, 255), 2)

        x=np.linspace(0, 1580, 1580)

        sum_count_100 = []
        while True:
            idx = hist.index(max(hist))
            idx_low = 0
            idx_up = 1580
            if idx - 100 < 0:
                idx_low = 0
            else:
                idx_low = idx - 50
            if idx + 100 >= 1580:
                idx_up = 1580
            else:
                idx_up = idx + 50
            if sum(hist[idx_low:idx_up]) < 4:
                break
            value = [sum(hist[idx_low:idx_up]), idx_low - 250, idx_up - 250, idx]

            zeros = []
            for i in range(idx_low, idx_up):
                zeros.append(0)
            hist[idx_low:idx_up] = zeros
            sum_count_100.append(value)
        first_x1 = []
        first_y1 = []
        first_x2 = []
        first_y2 = []
        second_x1 = []
        second_y1 = []
        second_x2 = []
        second_y2 = []
        if len(sum_count_100) == 0:
            cv2.imshow('origin', image)
            continue
        elif len(sum_count_100) == 1:
            cv2.imshow('origin', image)
            continue
        else:
            if sum_count_100[0][0] > sum_count_100[1][0] * 3:
                cv2.imshow('origin', image)
                continue
            for line in new_lines:
                x1, y1, x2, y2 = line
                if sum_count_100[0][1] < x1 < sum_count_100[0][2]:
                    first_x1.append(x1)
                    first_y1.append(y1)
                    first_x2.append(x2)
                    first_y2.append(y2)
                elif sum_count_100[1][1] < x1 < sum_count_100[1][2]:
                    second_x1.append(x1)
                    second_y1.append(y1)
                    second_x2.append(x2)
                    second_y2.append(y2)
                else:
                    continue
        x1 = int((np.mean(first_x1) + np.mean(second_x1)) / 2)
        y1 = int((np.mean(first_y1) + np.mean(second_y1)) / 2)
        x2 = int((np.mean(first_x2) + np.mean(second_x2)) / 2)
        y2 = int((np.mean(first_y2) + np.mean(second_y2)) / 2)
        cv2.line(image, (x1, y1), (x2, y2), (255, 0, 0), 2)
        cv2.imshow('origin', image)
        cv2.waitKey(1)
        # plt.plot(x, np.array(hist))
        # plt.show()
    cap.release()
    cv2.destroyAllWindows()
