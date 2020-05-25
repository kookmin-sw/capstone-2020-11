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

            move_cmd.angular.z = path_angle - rotation
            if move_cmd.angular.z > 0:
                move_cmd.angular.z = min(move_cmd.angular.z, 1.5)
            else:
                move_cmd.angular.z = min(move_cmd.angular.z, -1.5)

            move_cmd.linear.x = min(distance, 0.18)

            self.cmd_vel.publish(move_cmd)
            self.rate.sleep()

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
                #topic_list.append(tmp_control)
            elif current_x == target_x and current_y == target_y and current_z == -point_z:
                control_topic = np.array(topic_list[0])
                if current_z > 0:
                    control_topic[2] = -180
                else:
                    control_topic[2] = 180
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

if __name__ == '__main__':
    try:
        path_lists = path_calc(0, 0, 5, 2)
        count = 0

        while not rospy.is_shutdown():
            print(msg)
            GotoPoint(path_lists[count])
            count += 1
            if count > len(path_lists):
                break

    except:
        rospy.loginfo("shutdown program")