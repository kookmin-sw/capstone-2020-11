; Auto-generated. Do not edit!


(cl:in-package obstacle_detector-msg)


;//! \htmlinclude CircleObstacle.msg.html

(cl:defclass <CircleObstacle> (roslisp-msg-protocol:ros-message)
  ((center
    :reader center
    :initarg :center
    :type geometry_msgs-msg:Point
    :initform (cl:make-instance 'geometry_msgs-msg:Point))
   (velocity
    :reader velocity
    :initarg :velocity
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3))
   (radius
    :reader radius
    :initarg :radius
    :type cl:float
    :initform 0.0)
   (true_radius
    :reader true_radius
    :initarg :true_radius
    :type cl:float
    :initform 0.0))
)

(cl:defclass CircleObstacle (<CircleObstacle>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CircleObstacle>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CircleObstacle)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name obstacle_detector-msg:<CircleObstacle> is deprecated: use obstacle_detector-msg:CircleObstacle instead.")))

(cl:ensure-generic-function 'center-val :lambda-list '(m))
(cl:defmethod center-val ((m <CircleObstacle>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader obstacle_detector-msg:center-val is deprecated.  Use obstacle_detector-msg:center instead.")
  (center m))

(cl:ensure-generic-function 'velocity-val :lambda-list '(m))
(cl:defmethod velocity-val ((m <CircleObstacle>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader obstacle_detector-msg:velocity-val is deprecated.  Use obstacle_detector-msg:velocity instead.")
  (velocity m))

(cl:ensure-generic-function 'radius-val :lambda-list '(m))
(cl:defmethod radius-val ((m <CircleObstacle>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader obstacle_detector-msg:radius-val is deprecated.  Use obstacle_detector-msg:radius instead.")
  (radius m))

(cl:ensure-generic-function 'true_radius-val :lambda-list '(m))
(cl:defmethod true_radius-val ((m <CircleObstacle>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader obstacle_detector-msg:true_radius-val is deprecated.  Use obstacle_detector-msg:true_radius instead.")
  (true_radius m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CircleObstacle>) ostream)
  "Serializes a message object of type '<CircleObstacle>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'center) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'velocity) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'radius))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'true_radius))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CircleObstacle>) istream)
  "Deserializes a message object of type '<CircleObstacle>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'center) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'velocity) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'radius) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'true_radius) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CircleObstacle>)))
  "Returns string type for a message object of type '<CircleObstacle>"
  "obstacle_detector/CircleObstacle")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CircleObstacle)))
  "Returns string type for a message object of type 'CircleObstacle"
  "obstacle_detector/CircleObstacle")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CircleObstacle>)))
  "Returns md5sum for a message object of type '<CircleObstacle>"
  "d23cb7e768ed09971078d4cccc3808a9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CircleObstacle)))
  "Returns md5sum for a message object of type 'CircleObstacle"
  "d23cb7e768ed09971078d4cccc3808a9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CircleObstacle>)))
  "Returns full string definition for message of type '<CircleObstacle>"
  (cl:format cl:nil "geometry_msgs/Point center      # Central point [m]~%geometry_msgs/Vector3 velocity  # Linear velocity [m/s]~%float64 radius                  # Radius with added margin [m]~%float64 true_radius             # True measured radius [m]~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CircleObstacle)))
  "Returns full string definition for message of type 'CircleObstacle"
  (cl:format cl:nil "geometry_msgs/Point center      # Central point [m]~%geometry_msgs/Vector3 velocity  # Linear velocity [m/s]~%float64 radius                  # Radius with added margin [m]~%float64 true_radius             # True measured radius [m]~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CircleObstacle>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'center))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'velocity))
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CircleObstacle>))
  "Converts a ROS message object to a list"
  (cl:list 'CircleObstacle
    (cl:cons ':center (center msg))
    (cl:cons ':velocity (velocity msg))
    (cl:cons ':radius (radius msg))
    (cl:cons ':true_radius (true_radius msg))
))
