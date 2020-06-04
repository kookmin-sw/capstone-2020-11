import rospy
import numpy as np
from geometry_msgs.msg import Twist, Point, Quaternion
import tf
from math import radians, copysign, sqrt, pow, pi, atan2
from tf.transformations import euler_from_quaternion
from std_msgs.msg import Int32MultiArray

MAX_LIN_VEL = 0
CUR_LIN_VEL = 0
BURGER_MAX_ANG_VEL = 1.5
ANG_VEL_STEP_SIZE = 0.1

last_target_angle = 0

LAST_TARGET_POINT_X = 0
LAST_TARGET_POINT_Y = 0

g_lane_location = 0

class GotoPoint():
    def __init__(self, path_list):
        global LAST_TARGET_POINT_X
        global LAST_TARGET_POINT_Y
        global g_lane_location
        #rospy.init_node('olaf_pointop', anonymous=False)
        rospy.on_shutdown(self.shutdown)
        self.cmd_vel = rospy.Publisher('cmd_vel', Twist, queue_size=5)

        position = Point()
        move_cmd = Twist()
        
        x_location = Point()

        self.lane_location = 0
        self.rate = rospy.Rate(10)
        self.tf_listener = tf.TransformListener()
        self.odom_frame = 'odom'
        self.lane_location_sub = rospy.Subscriber("lane_data",Int32MultiArray,self.callback)
        self.TF_LISTEN()
        
        (goal_x, goal_y) = (path_list[0], path_list[1])
        
        self.rotate_before_move(goal_x, goal_y)
        self.move(goal_x, goal_y)
        
        LAST_TARGET_POINT_X = goal_x
        LAST_TARGET_POINT_Y = goal_y
        
    def callback(self,msg):
        global g_lane_location
        g_lane_location = msg.data[0]
        #print(self.lane_location)
    
    def rotate_before_move(self, target_x, target_y):
    
        global last_target_angle

        (position, rotation) = self.get_odom()
        (x_diff, y_diff) = (target_x - position.x, target_y - position.y)

        turn_cmd = Twist()
        turn_cmd.linear.x = 0.0

        (x_diff, y_diff) = (int(x_diff), int(y_diff))

        target_angle = 0.0

        if x_diff > 0:
            xy_flag = 0
            pass

        elif x_diff < 0:
            if last_target_angle < 0:
                target_angle = -180
            else:
                target_angle = 180

        elif y_diff > 0:
            target_angle = 90

        elif y_diff < 0:
            target_angle = -90

        else:
            print("Wrong path operation.")
            self.shutdown()
            
        last_target_angle = target_angle

        target_angle = np.deg2rad(target_angle)
        print("x_diff :" + str(x_diff))
        print("y_diff :" + str(y_diff))
        print("target_angle :" + str(target_angle))

        while abs(rotation - target_angle) > 0.05:

            (position, rotation) = self.get_odom()
            if target_angle > 0:
                if rotation <= target_angle and rotation >= target_angle - pi:
                    turn_cmd.angular.z = 0.5
                else:
                    turn_cmd.angular.z = -0.5
            else:
                if rotation <= target_angle + pi and rotation > target_angle:
                    turn_cmd.angular.z = -0.5
                else:
                    turn_cmd.angular.z = 0.5

            self.cmd_vel.publish(turn_cmd)
            self.rate.sleep()

        rospy.loginfo("Stopping the robot...")

    def move(self, target_x, target_y):
        global MAX_LIN_VEL
        global LAST_TARGET_POINT_X
        global LAST_TARGET_POINT_Y
        global g_lane_location
        
        lane_location = g_lane_location
        move_cmd = Twist()
        (position, rotation) = self.get_odom()
        last_rotation = 0.0
        
        #print("target_x : ", target_x)
        #print("target_y : ", target_y)
        #distance = sqrt(pow(target_x - position.x, 2) + pow(target_y - position.y, 2))
        if target_x != LAST_TARGET_POINT_X:
            distance = sqrt(pow(target_x - position.x,2))
        elif target_y != LAST_TARGET_POINT_Y:
            distance = sqrt(pow(target_y - position.y,2))
        else:
            distance = 0

        while distance > 0.05:
            (position, rotation) = self.get_odom()
            x_start = position.x
            y_start = position.y
            
            print("lane_location : ", g_lane_location)
            
            path_angle = atan2(target_y - y_start, target_x - x_start)
            
            lane_diff = (330.0 - float(g_lane_location))
            
            print("lane_diff : ", lane_diff)
            
            if path_angle > pi-0.1 and rotation <= 0:
                rotation = 2*pi + rotation
            elif path_angle < -pi+0.1 and rotation > 0:
                rotation = -2*pi + rotation
                
            print("last_rotation: " + str(last_rotation))
                
            #move_cmd.angular.z = path_angle - rotation
            if abs(lane_diff) > 30 and abs(lane_diff) < 80:
                move_cmd.angular.z = lane_diff/33000
                if MAX_LIN_VEL > 0.25:
                    MAX_LIN_VEL -= 0.005
                print("***********lane_contorl111111111________________")
            elif abs(lane_diff) > 80:
                if MAX_LIN_VEL > 0.25:
                    MAX_LIN_VEL -= 0.05
                move_cmd.angular.z = lane_diff/3300*5
                print("***********lane_contorl2222222________________")
            else :
                move_cmd.angular.z = path_angle - rotation
                print("&&&&&&&&&&&odom_control&&&&&&&&&&&&&&&&&&")
            
            #if distance < 0.7:
            #    move_cmd.angular.z = path_angle - rotation
            #    print("******************** 1m *********************")
            
            if target_x != LAST_TARGET_POINT_X:
                distance = sqrt(pow(target_x - position.x,2))
            elif target_y != LAST_TARGET_POINT_Y:
                distance = sqrt(pow(target_y - position.y,2))
            #distance = sqrt(pow(target_x - position.x, 2) + pow(target_y - position.y, 2))
            if MAX_LIN_VEL < 0.2:
                MAX_LIN_VEL+=0.001
            move_cmd.linear.x = min(distance, MAX_LIN_VEL)
            print("distance : ", distance)
            print("position : ", position)
            
            #if move_cmd.angular.z > 0:
                #move_cmd.angular.z = min(move_cmd.angular.z, 0)
                #move_cmd.angular.z = min(move_cmd.angular.z, 1.5)
            #elif move_cmd.angular.z < 0:
                #move_cmd.angular.z = max(move_cmd.angular.z, 0)
                #move_cmd.angular.z = max(move_cmd.angular.z, -1.5)
            
            print("move_cmd.angular.z : ", move_cmd.angular.z)
            #print("path_angle: " + str(path_angle))
            #print("diff : ", abs(path_angle - rotation))

            last_rotation = rotation
            self.cmd_vel.publish(move_cmd)
            self.rate.sleep()
        MAX_LIN_VEL = 0

    def TF_LISTEN(self):
        try:
            self.tf_listener.waitForTransform(self.odom_frame, 'base_footprint', rospy.Time(), rospy.Duration(1.0))
            self.base_frame = 'base_footprint'
        except (tf.Exception, tf.ConnectivityException, tf.LookupException):
            try:
                self.tf_listener.waitForTransform(self.odom_frame, 'base_link', rospy.Time(), rospy.Duration(1.0))
                self.base_frame = 'base_link'
            except (tf.Exception, tf.ConnectivityException, tf.LookupException):
                rospy.loginfo("Cannot find transform between odom and base_link or base_footprint")
                rospy.signal_shutdown("tf Exception")

    def get_odom(self):
        try:
            (trans, rot) = self.tf_listener.lookupTransform(self.odom_frame, self.base_frame, rospy.Time(0))
            rotation = euler_from_quaternion(rot)

        except (tf.Exception, tf.ConnectivityException, tf.LookupException):
            rospy.loginfo("TF Exception")
            return

        return (Point(*trans), rotation[2])

    def shutdown(self):
        self.cmd_vel.publish(Twist())
        rospy.sleep(1)
