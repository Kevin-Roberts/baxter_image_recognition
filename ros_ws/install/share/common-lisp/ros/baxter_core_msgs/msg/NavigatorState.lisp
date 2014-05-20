; Auto-generated. Do not edit!


(cl:in-package baxter_core_msgs-msg)


;//! \htmlinclude NavigatorState.msg.html

(cl:defclass <NavigatorState> (roslisp-msg-protocol:ros-message)
  ((ok
    :reader ok
    :initarg :ok
    :type cl:boolean
    :initform cl:nil)
   (cancel
    :reader cancel
    :initarg :cancel
    :type cl:boolean
    :initform cl:nil)
   (show
    :reader show
    :initarg :show
    :type cl:boolean
    :initform cl:nil)
   (wheel
    :reader wheel
    :initarg :wheel
    :type cl:fixnum
    :initform 0)
   (innerLight
    :reader innerLight
    :initarg :innerLight
    :type cl:boolean
    :initform cl:nil)
   (outerLight
    :reader outerLight
    :initarg :outerLight
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass NavigatorState (<NavigatorState>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <NavigatorState>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'NavigatorState)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name baxter_core_msgs-msg:<NavigatorState> is deprecated: use baxter_core_msgs-msg:NavigatorState instead.")))

(cl:ensure-generic-function 'ok-val :lambda-list '(m))
(cl:defmethod ok-val ((m <NavigatorState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader baxter_core_msgs-msg:ok-val is deprecated.  Use baxter_core_msgs-msg:ok instead.")
  (ok m))

(cl:ensure-generic-function 'cancel-val :lambda-list '(m))
(cl:defmethod cancel-val ((m <NavigatorState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader baxter_core_msgs-msg:cancel-val is deprecated.  Use baxter_core_msgs-msg:cancel instead.")
  (cancel m))

(cl:ensure-generic-function 'show-val :lambda-list '(m))
(cl:defmethod show-val ((m <NavigatorState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader baxter_core_msgs-msg:show-val is deprecated.  Use baxter_core_msgs-msg:show instead.")
  (show m))

(cl:ensure-generic-function 'wheel-val :lambda-list '(m))
(cl:defmethod wheel-val ((m <NavigatorState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader baxter_core_msgs-msg:wheel-val is deprecated.  Use baxter_core_msgs-msg:wheel instead.")
  (wheel m))

(cl:ensure-generic-function 'innerLight-val :lambda-list '(m))
(cl:defmethod innerLight-val ((m <NavigatorState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader baxter_core_msgs-msg:innerLight-val is deprecated.  Use baxter_core_msgs-msg:innerLight instead.")
  (innerLight m))

(cl:ensure-generic-function 'outerLight-val :lambda-list '(m))
(cl:defmethod outerLight-val ((m <NavigatorState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader baxter_core_msgs-msg:outerLight-val is deprecated.  Use baxter_core_msgs-msg:outerLight instead.")
  (outerLight m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <NavigatorState>) ostream)
  "Serializes a message object of type '<NavigatorState>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'ok) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'cancel) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'show) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'wheel)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'innerLight) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'outerLight) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <NavigatorState>) istream)
  "Deserializes a message object of type '<NavigatorState>"
    (cl:setf (cl:slot-value msg 'ok) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'cancel) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'show) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'wheel)) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'innerLight) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'outerLight) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<NavigatorState>)))
  "Returns string type for a message object of type '<NavigatorState>"
  "baxter_core_msgs/NavigatorState")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'NavigatorState)))
  "Returns string type for a message object of type 'NavigatorState"
  "baxter_core_msgs/NavigatorState")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<NavigatorState>)))
  "Returns md5sum for a message object of type '<NavigatorState>"
  "c91873a1e27ea9e2268873827e29eb68")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'NavigatorState)))
  "Returns md5sum for a message object of type 'NavigatorState"
  "c91873a1e27ea9e2268873827e29eb68")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<NavigatorState>)))
  "Returns full string definition for message of type '<NavigatorState>"
  (cl:format cl:nil "# OK button~%bool ok~%# Cancel button~%bool cancel~%# Show button~%bool show~%# Wheel button~%uint8   wheel~%~%# true if the inner light is on, false if not~%bool innerLight~%~%# true if the outer light is on, false if not~%bool outerLight~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'NavigatorState)))
  "Returns full string definition for message of type 'NavigatorState"
  (cl:format cl:nil "# OK button~%bool ok~%# Cancel button~%bool cancel~%# Show button~%bool show~%# Wheel button~%uint8   wheel~%~%# true if the inner light is on, false if not~%bool innerLight~%~%# true if the outer light is on, false if not~%bool outerLight~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <NavigatorState>))
  (cl:+ 0
     1
     1
     1
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <NavigatorState>))
  "Converts a ROS message object to a list"
  (cl:list 'NavigatorState
    (cl:cons ':ok (ok msg))
    (cl:cons ':cancel (cancel msg))
    (cl:cons ':show (show msg))
    (cl:cons ':wheel (wheel msg))
    (cl:cons ':innerLight (innerLight msg))
    (cl:cons ':outerLight (outerLight msg))
))
