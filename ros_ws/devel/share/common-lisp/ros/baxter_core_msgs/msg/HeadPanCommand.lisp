; Auto-generated. Do not edit!


(cl:in-package baxter_core_msgs-msg)


;//! \htmlinclude HeadPanCommand.msg.html

(cl:defclass <HeadPanCommand> (roslisp-msg-protocol:ros-message)
  ((target
    :reader target
    :initarg :target
    :type cl:float
    :initform 0.0)
   (speed
    :reader speed
    :initarg :speed
    :type cl:integer
    :initform 0))
)

(cl:defclass HeadPanCommand (<HeadPanCommand>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <HeadPanCommand>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'HeadPanCommand)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name baxter_core_msgs-msg:<HeadPanCommand> is deprecated: use baxter_core_msgs-msg:HeadPanCommand instead.")))

(cl:ensure-generic-function 'target-val :lambda-list '(m))
(cl:defmethod target-val ((m <HeadPanCommand>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader baxter_core_msgs-msg:target-val is deprecated.  Use baxter_core_msgs-msg:target instead.")
  (target m))

(cl:ensure-generic-function 'speed-val :lambda-list '(m))
(cl:defmethod speed-val ((m <HeadPanCommand>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader baxter_core_msgs-msg:speed-val is deprecated.  Use baxter_core_msgs-msg:speed instead.")
  (speed m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <HeadPanCommand>) ostream)
  "Serializes a message object of type '<HeadPanCommand>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'target))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'speed)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <HeadPanCommand>) istream)
  "Deserializes a message object of type '<HeadPanCommand>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'target) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'speed) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<HeadPanCommand>)))
  "Returns string type for a message object of type '<HeadPanCommand>"
  "baxter_core_msgs/HeadPanCommand")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'HeadPanCommand)))
  "Returns string type for a message object of type 'HeadPanCommand"
  "baxter_core_msgs/HeadPanCommand")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<HeadPanCommand>)))
  "Returns md5sum for a message object of type '<HeadPanCommand>"
  "990c3757495fec1dbde36b9b559e7bae")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'HeadPanCommand)))
  "Returns md5sum for a message object of type 'HeadPanCommand"
  "990c3757495fec1dbde36b9b559e7bae")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<HeadPanCommand>)))
  "Returns full string definition for message of type '<HeadPanCommand>"
  (cl:format cl:nil "#Header header~%float32 target # radians for target, 0 str~%int32 speed # between 0 and 100, 100 = max~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'HeadPanCommand)))
  "Returns full string definition for message of type 'HeadPanCommand"
  (cl:format cl:nil "#Header header~%float32 target # radians for target, 0 str~%int32 speed # between 0 and 100, 100 = max~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <HeadPanCommand>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <HeadPanCommand>))
  "Converts a ROS message object to a list"
  (cl:list 'HeadPanCommand
    (cl:cons ':target (target msg))
    (cl:cons ':speed (speed msg))
))
