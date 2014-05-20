; Auto-generated. Do not edit!


(cl:in-package baxter_core_msgs-msg)


;//! \htmlinclude HeadState.msg.html

(cl:defclass <HeadState> (roslisp-msg-protocol:ros-message)
  ((pan
    :reader pan
    :initarg :pan
    :type cl:float
    :initform 0.0)
   (isPanning
    :reader isPanning
    :initarg :isPanning
    :type cl:boolean
    :initform cl:nil)
   (isNodding
    :reader isNodding
    :initarg :isNodding
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass HeadState (<HeadState>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <HeadState>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'HeadState)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name baxter_core_msgs-msg:<HeadState> is deprecated: use baxter_core_msgs-msg:HeadState instead.")))

(cl:ensure-generic-function 'pan-val :lambda-list '(m))
(cl:defmethod pan-val ((m <HeadState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader baxter_core_msgs-msg:pan-val is deprecated.  Use baxter_core_msgs-msg:pan instead.")
  (pan m))

(cl:ensure-generic-function 'isPanning-val :lambda-list '(m))
(cl:defmethod isPanning-val ((m <HeadState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader baxter_core_msgs-msg:isPanning-val is deprecated.  Use baxter_core_msgs-msg:isPanning instead.")
  (isPanning m))

(cl:ensure-generic-function 'isNodding-val :lambda-list '(m))
(cl:defmethod isNodding-val ((m <HeadState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader baxter_core_msgs-msg:isNodding-val is deprecated.  Use baxter_core_msgs-msg:isNodding instead.")
  (isNodding m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <HeadState>) ostream)
  "Serializes a message object of type '<HeadState>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'pan))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'isPanning) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'isNodding) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <HeadState>) istream)
  "Deserializes a message object of type '<HeadState>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pan) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:slot-value msg 'isPanning) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'isNodding) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<HeadState>)))
  "Returns string type for a message object of type '<HeadState>"
  "baxter_core_msgs/HeadState")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'HeadState)))
  "Returns string type for a message object of type 'HeadState"
  "baxter_core_msgs/HeadState")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<HeadState>)))
  "Returns md5sum for a message object of type '<HeadState>"
  "a7a905cb9138493d35f02b3c35b9d65b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'HeadState)))
  "Returns md5sum for a message object of type 'HeadState"
  "a7a905cb9138493d35f02b3c35b9d65b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<HeadState>)))
  "Returns full string definition for message of type '<HeadState>"
  (cl:format cl:nil "float32 pan~%bool isPanning~%bool isNodding~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'HeadState)))
  "Returns full string definition for message of type 'HeadState"
  (cl:format cl:nil "float32 pan~%bool isPanning~%bool isNodding~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <HeadState>))
  (cl:+ 0
     4
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <HeadState>))
  "Converts a ROS message object to a list"
  (cl:list 'HeadState
    (cl:cons ':pan (pan msg))
    (cl:cons ':isPanning (isPanning msg))
    (cl:cons ':isNodding (isNodding msg))
))
