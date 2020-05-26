import json
from collections import OrderedDict
# set waypoint
way_point = list()

tmp = {'idx' : 0, 'name' : 'START_POINT', 'x_location' : 0, 'y_location' : 0, 'yaw': 0, 'lds_detect' : 'NONE', 'line_detect' : 'OFF', "drive" : "ROTATION", "is_intersact": 0,"AJ_NODE" : "1"}
tmp1 = {'idx' : 1, 'name' : 'TLAB', 'x_location' : 0 'y_location' : 2, 'yaw': 90, 'lds_detect' : 'RIGHT', 'line_detect' : 'ON', "drive" : "FOWARD", "is_intersact": 0}
tmp2 = {'idx' : 2, 'name' : 'MAN_TOILET', 'x_location' : 0, 'y_location' : 4, 'yaw': 90, 'lds_detect' : 'NONE', 'line_detect' : 'OFF', "drive" : "TOTAL", "is_intersact": 1}
tmp3 = {'idx' : 3, 'name' : 'WOMAN_TOILET', 'x_location' : 0, 'y_location' : 6, 'yaw': 90, 'lds_detect' : 'FRONT', 'line_detect' : 'OFF', "drive" : "ROTATION", "is_intersact": 1}
tmp4 = {'idx' : 4, 'name' : '629', 'x_location' : 4, 'y_location' : -4, 'yaw': -90, 'lds_detect' : 'LEFT', 'line_detect' : 'ON', "drive" : "FRONT", "is_intersact": 0}
tmp5 = {'idx' : 5, 'name' : 'EV', 'x_location' : 4, 'y_location' : -6, 'yaw': -90, 'lds_detect' : 'OFF', 'line_detect' : 'ON', "drive" : "FRONT", "is_intersact": 0}
tmp6 = {'idx' : 6, 'name' : 'TLAB', 'x_location' : 4, 'y_location' : -8, 'yaw': -90, 'lds_detect' : 'RIGHT', 'line_detect' : 'ON', "drive" : "FRONT", "is_intersact": 0}
tmp7 = {'idx' : 7, 'name' : 'MAN_TOILET', 'x_location' : 4, 'y_location' : -10, 'yaw': -90, 'lds_detect' : 'OFF', 'line_detect' : 'ON', "drive" : "ROTATION", "is_intersact": 1}
tmp8 = {'idx' : 8, 'name' : 'GLAB', 'x_location' : 4, 'y_location' : -12, 'yaw': -90, 'lds_detect' : 'FRONT', 'line_detect' : 'OFF', "drive" : "ROTATION", "is_intersact": 1}
tmp9 = {'idx' : 9, 'name' : '619', 'x_location' : 3, 'y_location' : -12, 'yaw': -180, 'lds_detect' : 'LEFT', 'line_detect' : 'ON', "drive" : "FRONT", "is_intersact": 1}

way_points = [
{'idx' : 0, 'name' : 'START_POINT', 'x_location' : 0, 'y_location' : 0, 'yaw': 0, 'lds_detect' : 'NONE', 'line_detect' : 'OFF', "drive" : "ROTATION", "is_intersact": 0,"AJ_NODE" : "1,4"},
{'idx' : 1, 'name' : 'TLAB', 'x_location' : 0 'y_location' : 2, 'yaw': 90, 'lds_detect' : 'RIGHT', 'line_detect' : 'ON', "drive" : "FOWARD", "is_intersact": 0,"AJ_NODE" : "2"},
{'idx' : 2, 'name' : 'MAN_TOILET', 'x_location' : 0, 'y_location' : 4, 'yaw': 90, 'lds_detect' : 'NONE', 'line_detect' : 'OFF', "drive" : "TOTAL", "is_intersact": 1, "AJ_NODE" : "2"}

]
way_point.append(tmp)
way_point.append(tmp1)
way_point.append(tmp2)
way_point.append(tmp3)
way_point.append(tmp4)
way_point.append(tmp5)
way_point.append(tmp6)
way_point.append(tmp7)
way_point.append(tmp8)

with open('way_point.json','w') as make_file:
    json.dump(way_point,make_file,ensure_ascii=False)
