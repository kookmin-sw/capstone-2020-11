import rospy
from sensor_msgs.msg import JointState
from turtlebot3_msgs.msg import SensorState
from geometry_msgs.msg import Twist, Point, Quaternion
import tf
from math import radians, copysign, sqrt, pow, pi, atan2
from tf.transformations import euler_from_quaternion
import numpy as np

BURGER_MAX_LIN_VEL = 0.22
BURGER_MAX_ANG_VEL = 1.5
ANG_VEL_STEP_SIZE = 0.1

class GotoPoint():
    def __init__(self, path_list):
  
        rospy.init_node('olaf_pointop', anonymous=False)
        rospy.on_shutdown(self.shutdown)
        self.cmd_vel = rospy.Publisher('cmd_vel', Twist, queue_size=5)
        rospy.Subscriber('sensor_state', SensorState, self.sensor_callback)
        rospy.Subscriber('joint_states', JointState, self.joint_callback)
    
        position = Point()
        move_cmd = Twist()
    
        self.rate = rospy.Rate(10)
        self.tf_listener = tf.TransformListener()
        self.odom_frame = 'odom'
    
        self.TF_LISTEN()
        
        (position, rotation) = self.get_odom()
        last_rotation = 0
        linear_speed = 1
        angular_speed = 1
        
        (goal_x, goal_y) = (path_list[0], path_list[1])
        
        xy_flag = self.rotate_before_move(goal_x, goal_y)
        self.move(xy_flag, goal_x, goal_y)
        
    def rotate_before_move(target_x, target_y):
        
        (position, rotation) = self.get_odom()
        (x_diff, y_diff) = (target_x - position.x, target_y - position.y)
        
        turn_cmd = Twist()
        turn_cmd.linear.x = 0.0
        
        target_angle = 0.0
        
        if x_diff > 0:
            xy_flag = 0
            pass
            
        elif x_diff < 0:
            xy_flag = 0
            target_angle = 180
            
        elif y_diff > 0:
            xy_flag = 1
            target_angle = 90
            
        elif y_diff < 0:
            xy_flag = 1
            target_angle = -90
            
        else:
            print("Wrong path operation.")
            self.shutdown()
            
        target_angle = np.deg2rad(target_angle)
            
        while abs(rotation - target_angle) > 0.03:
        
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
            
            self.cmd_vel.publish(move_cmd)
            self.rate.sleep()
            
        return xy_flag
            
    def move(xy_flag, target_x, target_y):
        
        move_cmd = Twist()
        (position, rotation) = self.get_odom()
        distance = sqrt(pow(target_x - position.x, 2) + pow(target_y - position.y, 2))
        
        while distance > 0.05:
            (position, rotation) = self.get_odom()
            x_start = position.x
            y_start = position.y
            path_angle = atan2(target_y - y_start, target_x - x_start)
            
            distance = sqrt(pow(target_x - position.x, 2) + pow(target_y - position.y, 2))
            move_cmd.linear.x = min(distance, 0.18)
            
            
            
    def sensor_callback(data):
        self.encoder = [data.left_encoder, data.right_encoder]
        
    def joint_callback(data):
        self.velocity = [data.velocity[0], data.velocity[1]]
                
    def TF_LISTEN():
        
        try:
            self.tf_listener.waitForTransform(self.odom_frame, 'base_footprint', rospy.Time(), rospy.Duration(1.0))
            self.base_frame = 'base_footprint'
        except (tf.Exception, tf.ConnectivityException, tf.LookupException):
            try:
                self.tf_listener.waitForTransform(self.odom_frame, 'base_link', rospy.Time(), rospy.Duration())
                self.base_frame = 'base_link'
            except (tf.Exception, tf.ConnectivityException, tf.LookupException):
                rospy.loginfo("Cannot find transform between odom and base_link or base_footprint")
                rospy.signal_shutdown("tf Exception")
