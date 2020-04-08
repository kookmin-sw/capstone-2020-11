; Auto-generated. Do not edit!


(cl:in-package race-msg)


;//! \htmlinclude lane_info.msg.html

(cl:defclass <lane_info> (roslisp-msg-protocol:ros-message)
  ((left_slope
    :reader left_slope
    :initarg :left_slope
    :type cl:float
    :initform 0.0)
   (right_slope
    :reader right_slope
    :initarg :right_slope
    :type cl:float
    :initform 0.0)
   (is_left
    :reader is_left
    :initarg :is_left
    :type cl:boolean
    :initform cl:nil)
   (is_right
    :reader is_right
    :initarg :is_right
    :type cl:boolean
    :initform cl:nil)
   (bias_from_left
    :reader bias_from_left
    :initarg :bias_from_left
    :type cl:float
    :initform 0.0)
   (bias_from_right
    :reader bias_from_right
    :initarg :bias_from_right
    :type cl:float
    :initform 0.0))
)

(cl:defclass lane_info (<lane_info>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <lane_info>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'lane_info)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name race-msg:<lane_info> is deprecated: use race-msg:lane_info instead.")))

(cl:ensure-generic-function 'left_slope-val :lambda-list '(m))
(cl:defmethod left_slope-val ((m <lane_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader race-msg:left_slope-val is deprecated.  Use race-msg:left_slope instead.")
  (left_slope m))

(cl:ensure-generic-function 'right_slope-val :lambda-list '(m))
(cl:defmethod right_slope-val ((m <lane_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader race-msg:right_slope-val is deprecated.  Use race-msg:right_slope instead.")
  (right_slope m))

(cl:ensure-generic-function 'is_left-val :lambda-list '(m))
(cl:defmethod is_left-val ((m <lane_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader race-msg:is_left-val is deprecated.  Use race-msg:is_left instead.")
  (is_left m))

(cl:ensure-generic-function 'is_right-val :lambda-list '(m))
(cl:defmethod is_right-val ((m <lane_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader race-msg:is_right-val is deprecated.  Use race-msg:is_right instead.")
  (is_right m))

(cl:ensure-generic-function 'bias_from_left-val :lambda-list '(m))
(cl:defmethod bias_from_left-val ((m <lane_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader race-msg:bias_from_left-val is deprecated.  Use race-msg:bias_from_left instead.")
  (bias_from_left m))

(cl:ensure-generic-function 'bias_from_right-val :lambda-list '(m))
(cl:defmethod bias_from_right-val ((m <lane_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader race-msg:bias_from_right-val is deprecated.  Use race-msg:bias_from_right instead.")
  (bias_from_right m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <lane_info>) ostream)
  "Serializes a message object of type '<lane_info>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'left_slope))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'right_slope))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'is_left) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'is_right) 1 0)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'bias_from_left))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'bias_from_right))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <lane_info>) istream)
  "Deserializes a message object of type '<lane_info>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'left_slope) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'right_slope) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:slot-value msg 'is_left) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'is_right) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'bias_from_left) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'bias_from_right) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<lane_info>)))
  "Returns string type for a message object of type '<lane_info>"
  "race/lane_info")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'lane_info)))
  "Returns string type for a message object of type 'lane_info"
  "race/lane_info")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<lane_info>)))
  "Returns md5sum for a message object of type '<lane_info>"
  "e5107cf654a976d33dc89cb06bf8be8e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'lane_info)))
  "Returns md5sum for a message object of type 'lane_info"
  "e5107cf654a976d33dc89cb06bf8be8e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<lane_info>)))
  "Returns full string definition for message of type '<lane_info>"
  (cl:format cl:nil "float32 left_slope~%float32 right_slope~%~%bool is_left~%bool is_right~%~%float32 bias_from_left~%float32 bias_from_right~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'lane_info)))
  "Returns full string definition for message of type 'lane_info"
  (cl:format cl:nil "float32 left_slope~%float32 right_slope~%~%bool is_left~%bool is_right~%~%float32 bias_from_left~%float32 bias_from_right~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <lane_info>))
  (cl:+ 0
     4
     4
     1
     1
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <lane_info>))
  "Converts a ROS message object to a list"
  (cl:list 'lane_info
    (cl:cons ':left_slope (left_slope msg))
    (cl:cons ':right_slope (right_slope msg))
    (cl:cons ':is_left (is_left msg))
    (cl:cons ':is_right (is_right msg))
    (cl:cons ':bias_from_left (bias_from_left msg))
    (cl:cons ':bias_from_right (bias_from_right msg))
))
