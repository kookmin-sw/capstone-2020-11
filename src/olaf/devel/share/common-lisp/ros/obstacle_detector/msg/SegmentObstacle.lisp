; Auto-generated. Do not edit!


(cl:in-package obstacle_detector-msg)


;//! \htmlinclude SegmentObstacle.msg.html

(cl:defclass <SegmentObstacle> (roslisp-msg-protocol:ros-message)
  ((first_point
    :reader first_point
    :initarg :first_point
    :type geometry_msgs-msg:Point
    :initform (cl:make-instance 'geometry_msgs-msg:Point))
   (last_point
    :reader last_point
    :initarg :last_point
    :type geometry_msgs-msg:Point
    :initform (cl:make-instance 'geometry_msgs-msg:Point)))
)

(cl:defclass SegmentObstacle (<SegmentObstacle>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SegmentObstacle>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SegmentObstacle)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name obstacle_detector-msg:<SegmentObstacle> is deprecated: use obstacle_detector-msg:SegmentObstacle instead.")))

(cl:ensure-generic-function 'first_point-val :lambda-list '(m))
(cl:defmethod first_point-val ((m <SegmentObstacle>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader obstacle_detector-msg:first_point-val is deprecated.  Use obstacle_detector-msg:first_point instead.")
  (first_point m))

(cl:ensure-generic-function 'last_point-val :lambda-list '(m))
(cl:defmethod last_point-val ((m <SegmentObstacle>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader obstacle_detector-msg:last_point-val is deprecated.  Use obstacle_detector-msg:last_point instead.")
  (last_point m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SegmentObstacle>) ostream)
  "Serializes a message object of type '<SegmentObstacle>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'first_point) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'last_point) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SegmentObstacle>) istream)
  "Deserializes a message object of type '<SegmentObstacle>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'first_point) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'last_point) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SegmentObstacle>)))
  "Returns string type for a message object of type '<SegmentObstacle>"
  "obstacle_detector/SegmentObstacle")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SegmentObstacle)))
  "Returns string type for a message object of type 'SegmentObstacle"
  "obstacle_detector/SegmentObstacle")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SegmentObstacle>)))
  "Returns md5sum for a message object of type '<SegmentObstacle>"
  "37ecbf7e1053bae89f0770466b37c3c3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SegmentObstacle)))
  "Returns md5sum for a message object of type 'SegmentObstacle"
  "37ecbf7e1053bae89f0770466b37c3c3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SegmentObstacle>)))
  "Returns full string definition for message of type '<SegmentObstacle>"
  (cl:format cl:nil "geometry_msgs/Point first_point  # First point of the segment [m]~%geometry_msgs/Point last_point   # Last point of the segment [m]~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SegmentObstacle)))
  "Returns full string definition for message of type 'SegmentObstacle"
  (cl:format cl:nil "geometry_msgs/Point first_point  # First point of the segment [m]~%geometry_msgs/Point last_point   # Last point of the segment [m]~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SegmentObstacle>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'first_point))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'last_point))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SegmentObstacle>))
  "Converts a ROS message object to a list"
  (cl:list 'SegmentObstacle
    (cl:cons ':first_point (first_point msg))
    (cl:cons ':last_point (last_point msg))
))
