# Class Node Define
class WayPoint():
    # init function
    def __init__(self, idx, x_location, yaw, line_dect, driving, p_next_idx):
        # waypoint index
        self.idx = idx
        # waypoint x location
        self.x_location = x_location
        # waypoint y location
        self.y_location = y_location
        # waypoints yaw rate
        self.yaw = yaw
        # line_detection mode
        self.line_dect = line_dect
        # Driving Method [0 : forward] [1 : rotation]
        self.driving = driving
        # adjacent waypoints index
        self.p_next_index = p_next_idx
        # adjacent waypoints pointer list
        seft.p_Next = []
