#!/usr/bin/env python
import rospy
import serial
import sys
import time
import math

from sensor_msgs.msg import Imu
from tf.transformations import quaternion_from_euler, euler_from_quaternion

# =============
# = Init Node =
# =============
rospy.init_node('imu_node_foscar')
pub = rospy.Publisher('imu', Imu, queue_size=1)

# ==============
# = Connection =
# ==============
port='/dev/ttyIMU'

# baudrate 921600 for wireless, 115200 for wire
try:
    ser = serial.Serial(port=port, baudrate= 115200, timeout=1)
except Exception as e:
    print('IMU not found at port ', port)
    print('[ERROR] {}'.format(e))
    sys.exit(0)

print('[INFO] Connected to {}'.format(ser))

# ===============
# = Calibration =
# ===============
#ser.write('<lf>' + chr(13))
#ser.flushInput()
#print('[WRITE] <sof1> ' + ser.readline().rstrip())
#time.sleep(1)

#ser.write('<soa2>' + chr(13))
#ser.flushInput()
#print('[WRITE] <soa2> ' + ser.readline().rstrip())
#time.sleep(1)

# ==============
# = Publishing =
# ==============
imuMsg = Imu()
seq = 0

while not rospy.is_shutdown():
    ser.flushInput()
    line = ser.readline().rstrip()
    words = line[1:].split(',')

    #print("Roll : ", words[0])
    #print("Pitch : ", words[1])
    #print("Yaw : ", words[2])

    try:
        Roll, Pitch, Yaw = [val * math.pi / 180 for val in map(float, words[0:3])] # degree -> radian
        x, y, z, w = quaternion_from_euler(Roll, Pitch, Yaw) # euler -> quaternion
        imuMsg.orientation.x = x
        imuMsg.orientation.y = y
        imuMsg.orientation.z = z
        imuMsg.orientation.w = w
        #ax, ay, az = [val * 9.81 for val in map(float, words[4:7])] # g -> m/s^2
        #imuMsg.linear_acceleration.x = ax
        #imuMsg.linear_acceleration.y = ay
        #imuMsg.linear_acceleration.z = az
        #imuMsg.header.stamp= rospy.Time.now()
        #imuMsg.header.frame_id = 'base_imu_link'
        #imuMsg.header.seq = seq
        #seq = seq + 1
        pub.publish(imuMsg)
        print('[INFO] Publish ' + line)
    except Exception as e:
        print('[ERROR] {}'.format(e))
