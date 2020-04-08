; Auto-generated. Do not edit!


(cl:in-package race-msg)


;//! \htmlinclude enc_values.msg.html

(cl:defclass <enc_values> (roslisp-msg-protocol:ros-message)
  ((steering
    :reader steering
    :initarg :steering
    :type cl:fixnum
    :initform 0)
   (enc_val
    :reader enc_val
    :initarg :enc_val
    :type cl:integer
    :initform 0))
)

(cl:defclass enc_values (<enc_values>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <enc_values>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'enc_values)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name race-msg:<enc_values> is deprecated: use race-msg:enc_values instead.")))

(cl:ensure-generic-function 'steering-val :lambda-list '(m))
(cl:defmethod steering-val ((m <enc_values>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader race-msg:steering-val is deprecated.  Use race-msg:steering instead.")
  (steering m))

(cl:ensure-generic-function 'enc_val-val :lambda-list '(m))
(cl:defmethod enc_val-val ((m <enc_values>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader race-msg:enc_val-val is deprecated.  Use race-msg:enc_val instead.")
  (enc_val m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <enc_values>) ostream)
  "Serializes a message object of type '<enc_values>"
  (cl:let* ((signed (cl:slot-value msg 'steering)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'enc_val)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <enc_values>) istream)
  "Deserializes a message object of type '<enc_values>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'steering) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'enc_val) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<enc_values>)))
  "Returns string type for a message object of type '<enc_values>"
  "race/enc_values")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'enc_values)))
  "Returns string type for a message object of type 'enc_values"
  "race/enc_values")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<enc_values>)))
  "Returns md5sum for a message object of type '<enc_values>"
  "261c425b19fc3c9973e23fc0e2a83f33")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'enc_values)))
  "Returns md5sum for a message object of type 'enc_values"
  "261c425b19fc3c9973e23fc0e2a83f33")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<enc_values>)))
  "Returns full string definition for message of type '<enc_values>"
  (cl:format cl:nil "int16 steering~%int32 enc_val~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'enc_values)))
  "Returns full string definition for message of type 'enc_values"
  (cl:format cl:nil "int16 steering~%int32 enc_val~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <enc_values>))
  (cl:+ 0
     2
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <enc_values>))
  "Converts a ROS message object to a list"
  (cl:list 'enc_values
    (cl:cons ':steering (steering msg))
    (cl:cons ':enc_val (enc_val msg))
))
