import numpy as np
from math import radians, copysign, sqrt, pow, pi, atan2

start_x = 0
start_y = 0

target_x = 5
target_y = 2

def path_calc(start_x, start_y, target_x, target_y):

    arrived = False
    topic_list = list()

    control_topic = np.array([0,0,0])

    start_z = 0

    current_x = start_x
    current_y = start_y
    current_z = 0

    point_z = 0

    while(1):
        if not arrived:
            if target_x != current_x:
                print("target_x != current_x")
                control_topic[0] = target_x - current_x

                if target_y - start_y < 0:
                    control_topic[2] = -90
                    current_z = -90
                    point_z = -90
                elif target_y - start_y > 0:
                    control_topic[2] = 90
                    current_z = 90
                    point_z = 90

                    tmp_control = np.array(control_topic)

                    topic_list.append(tmp_control)

                    current_x = control_topic[0]
                    current_y = control_topic[1]
                    current_z = control_topic[2]

            elif target_x == current_x and target_y != current_y:
                print("target_x == current_x and target_y != current_y")
                control_topic[1] = target_y - start_y

                tmp_control = np.array(control_topic)
                topic_list.append(tmp_control)

                current_x = control_topic[0]
                current_y = control_topic[1]
                current_z = control_topic[2]

            elif current_x == target_x and target_y == current_y:
                print("arrived")
                arrived = True
        else:
            print("arrived else")
            if current_x == target_x and current_y == target_y and current_z == point_z:
                control_topic[2] = -current_z
                tmp_control = np.array(control_topic)
                current_z = -current_z

                topic_list.append(tmp_control)
            elif current_x == target_x and current_y == target_y and current_z == -point_z:
                control_topic = np.array(topic_list[0])
                if current_z > 0:
                    control_topic[2] = 180
                else:
                    control_topic[2] = -180

                tmp_control = np.array(control_topic)

                current_x = tmp_control[0]
                current_y = tmp_control[1]
                current_z = tmp_control[2]

                topic_list.append(tmp_control)

            elif current_y == start_y and current_x != start_x:
                control_topic = np.array([start_x,start_y,current_z])

                topic_list.append(control_topic)

                current_x = control_topic[0]
                current_y = control_topic[1]
                current_z = 0

                topic_list.append(np.array([start_x, start_y, 0]))
                return topic_list


topic_list = path_calc(start_x,start_y,target_x,target_y)
print("topic_list", topic_list)
