import numpy as np

start_x = 0
start_y = 0

target_x = 5
target_y = -2

def path_calc(start_x, start_y, target_x, target_y):
    topic_list = list()
    control_topic = np.array([0,0,0])

    while(1):
        if target_x != start_x and target_y != start_y:
            print(1)
            control_topic[0] = target_x - start_x

            if target_y - start_y < 0:
                control_topic[2] = -90
            elif target_y - start_y > 0:
                control_topic[2] = 90

            tmp_control = np.array(control_topic)
            topic_list.append(tmp_control)

            start_x = control_topic[0]
            start_y = control_topic[1]

        elif target_x == start_x and target_y != start_y:
            print(2)
            control_topic[1] = target_y - start_y
            tmp_control = np.array(control_topic)
            topic_list.append(control_topic)
            start_x = control_topic[0]
            start_y = control_topic[1]

        elif start_x == target_x and target_y == start_y:
            return topic_list


topic_list = path_calc(start_x,start_y,target_x,target_y)

print(topic_list)
