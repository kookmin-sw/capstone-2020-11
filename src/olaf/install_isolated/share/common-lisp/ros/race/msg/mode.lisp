; Auto-generated. Do not edit!


(cl:in-package race-msg)


;//! \htmlinclude mode.msg.html

(cl:defclass <mode> (roslisp-msg-protocol:ros-message)
  ((status
    :reader status
    :initarg :status
    :type cl:fixnum
    :initform 0)
   (mode
    :reader mode
    :initarg :mode
    :type cl:fixnum
    :initform 0)
   (spd_limit
    :reader spd_limit
    :initarg :spd_limit
    :type cl:fixnum
    :initform 0))
)

(cl:defclass mode (<mode>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <mode>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'mode)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name race-msg:<mode> is deprecated: use race-msg:mode instead.")))

(cl:ensure-generic-function 'status-val :lambda-list '(m))
(cl:defmethod status-val ((m <mode>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader race-msg:status-val is deprecated.  Use race-msg:status instead.")
  (status m))

(cl:ensure-generic-function 'mode-val :lambda-list '(m))
(cl:defmethod mode-val ((m <mode>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader race-msg:mode-val is deprecated.  Use race-msg:mode instead.")
  (mode m))

(cl:ensure-generic-function 'spd_limit-val :lambda-list '(m))
(cl:defmethod spd_limit-val ((m <mode>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader race-msg:spd_limit-val is deprecated.  Use race-msg:spd_limit instead.")
  (spd_limit m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <mode>) ostream)
  "Serializes a message object of type '<mode>"
  (cl:let* ((signed (cl:slot-value msg 'status)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'mode)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'spd_limit)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <mode>) istream)
  "Deserializes a message object of type '<mode>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'status) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'mode) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'spd_limit) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<mode>)))
  "Returns string type for a message object of type '<mode>"
  "race/mode")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'mode)))
  "Returns string type for a message object of type 'mode"
  "race/mode")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<mode>)))
  "Returns md5sum for a message object of type '<mode>"
  "4d86579415141bf5b868c51e2a521f14")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'mode)))
  "Returns md5sum for a message object of type 'mode"
  "4d86579415141bf5b868c51e2a521f14")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<mode>)))
  "Returns full string definition for message of type '<mode>"
  (cl:format cl:nil "int8 status~%int8 mode~%int8 spd_limit~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'mode)))
  "Returns full string definition for message of type 'mode"
  (cl:format cl:nil "int8 status~%int8 mode~%int8 spd_limit~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <mode>))
  (cl:+ 0
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <mode>))
  "Converts a ROS message object to a list"
  (cl:list 'mode
    (cl:cons ':status (status msg))
    (cl:cons ':mode (mode msg))
    (cl:cons ':spd_limit (spd_limit msg))
))
