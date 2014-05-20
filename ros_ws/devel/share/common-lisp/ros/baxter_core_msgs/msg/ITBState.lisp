; Auto-generated. Do not edit!


(cl:in-package baxter_core_msgs-msg)


;//! \htmlinclude ITBState.msg.html

(cl:defclass <ITBState> (roslisp-msg-protocol:ros-message)
  ((buttons
    :reader buttons
    :initarg :buttons
    :type (cl:vector cl:boolean)
   :initform (cl:make-array 4 :element-type 'cl:boolean :initial-element cl:nil))
   (up
    :reader up
    :initarg :up
    :type cl:boolean
    :initform cl:nil)
   (down
    :reader down
    :initarg :down
    :type cl:boolean
    :initform cl:nil)
   (left
    :reader left
    :initarg :left
    :type cl:boolean
    :initform cl:nil)
   (right
    :reader right
    :initarg :right
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

(cl:defclass ITBState (<ITBState>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ITBState>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ITBState)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name baxter_core_msgs-msg:<ITBState> is deprecated: use baxter_core_msgs-msg:ITBState instead.")))

(cl:ensure-generic-function 'buttons-val :lambda-list '(m))
(cl:defmethod buttons-val ((m <ITBState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader baxter_core_msgs-msg:buttons-val is deprecated.  Use baxter_core_msgs-msg:buttons instead.")
  (buttons m))

(cl:ensure-generic-function 'up-val :lambda-list '(m))
(cl:defmethod up-val ((m <ITBState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader baxter_core_msgs-msg:up-val is deprecated.  Use baxter_core_msgs-msg:up instead.")
  (up m))

(cl:ensure-generic-function 'down-val :lambda-list '(m))
(cl:defmethod down-val ((m <ITBState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader baxter_core_msgs-msg:down-val is deprecated.  Use baxter_core_msgs-msg:down instead.")
  (down m))

(cl:ensure-generic-function 'left-val :lambda-list '(m))
(cl:defmethod left-val ((m <ITBState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader baxter_core_msgs-msg:left-val is deprecated.  Use baxter_core_msgs-msg:left instead.")
  (left m))

(cl:ensure-generic-function 'right-val :lambda-list '(m))
(cl:defmethod right-val ((m <ITBState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader baxter_core_msgs-msg:right-val is deprecated.  Use baxter_core_msgs-msg:right instead.")
  (right m))

(cl:ensure-generic-function 'wheel-val :lambda-list '(m))
(cl:defmethod wheel-val ((m <ITBState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader baxter_core_msgs-msg:wheel-val is deprecated.  Use baxter_core_msgs-msg:wheel instead.")
  (wheel m))

(cl:ensure-generic-function 'innerLight-val :lambda-list '(m))
(cl:defmethod innerLight-val ((m <ITBState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader baxter_core_msgs-msg:innerLight-val is deprecated.  Use baxter_core_msgs-msg:innerLight instead.")
  (innerLight m))

(cl:ensure-generic-function 'outerLight-val :lambda-list '(m))
(cl:defmethod outerLight-val ((m <ITBState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader baxter_core_msgs-msg:outerLight-val is deprecated.  Use baxter_core_msgs-msg:outerLight instead.")
  (outerLight m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ITBState>) ostream)
  "Serializes a message object of type '<ITBState>"
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if ele 1 0)) ostream))
   (cl:slot-value msg 'buttons))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'up) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'down) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'left) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'right) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'wheel)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'innerLight) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'outerLight) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ITBState>) istream)
  "Deserializes a message object of type '<ITBState>"
  (cl:setf (cl:slot-value msg 'buttons) (cl:make-array 4))
  (cl:let ((vals (cl:slot-value msg 'buttons)))
    (cl:dotimes (i 4)
    (cl:setf (cl:aref vals i) (cl:not (cl:zerop (cl:read-byte istream))))))
    (cl:setf (cl:slot-value msg 'up) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'down) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'left) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'right) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'wheel)) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'innerLight) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'outerLight) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ITBState>)))
  "Returns string type for a message object of type '<ITBState>"
  "baxter_core_msgs/ITBState")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ITBState)))
  "Returns string type for a message object of type 'ITBState"
  "baxter_core_msgs/ITBState")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ITBState>)))
  "Returns md5sum for a message object of type '<ITBState>"
  "fd86ad89da05230247c94b4d8e7ed306")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ITBState)))
  "Returns md5sum for a message object of type 'ITBState"
  "fd86ad89da05230247c94b4d8e7ed306")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ITBState>)))
  "Returns full string definition for message of type '<ITBState>"
  (cl:format cl:nil "bool[4] buttons~%bool    up~%bool    down~%bool    left~%bool    right~%uint8   wheel~%~%# true if the inner light is on, false if not~%bool innerLight~%~%# true if the outer light is on, false if not~%bool outerLight~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ITBState)))
  "Returns full string definition for message of type 'ITBState"
  (cl:format cl:nil "bool[4] buttons~%bool    up~%bool    down~%bool    left~%bool    right~%uint8   wheel~%~%# true if the inner light is on, false if not~%bool innerLight~%~%# true if the outer light is on, false if not~%bool outerLight~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ITBState>))
  (cl:+ 0
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'buttons) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
     1
     1
     1
     1
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ITBState>))
  "Converts a ROS message object to a list"
  (cl:list 'ITBState
    (cl:cons ':buttons (buttons msg))
    (cl:cons ':up (up msg))
    (cl:cons ':down (down msg))
    (cl:cons ':left (left msg))
    (cl:cons ':right (right msg))
    (cl:cons ':wheel (wheel msg))
    (cl:cons ':innerLight (innerLight msg))
    (cl:cons ':outerLight (outerLight msg))
))
