; Auto-generated. Do not edit!


(cl:in-package baxter_core_msgs-srv)


;//! \htmlinclude SolvePositionIK-request.msg.html

(cl:defclass <SolvePositionIK-request> (roslisp-msg-protocol:ros-message)
  ((pose_stamp
    :reader pose_stamp
    :initarg :pose_stamp
    :type (cl:vector geometry_msgs-msg:PoseStamped)
   :initform (cl:make-array 0 :element-type 'geometry_msgs-msg:PoseStamped :initial-element (cl:make-instance 'geometry_msgs-msg:PoseStamped))))
)

(cl:defclass SolvePositionIK-request (<SolvePositionIK-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SolvePositionIK-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SolvePositionIK-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name baxter_core_msgs-srv:<SolvePositionIK-request> is deprecated: use baxter_core_msgs-srv:SolvePositionIK-request instead.")))

(cl:ensure-generic-function 'pose_stamp-val :lambda-list '(m))
(cl:defmethod pose_stamp-val ((m <SolvePositionIK-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader baxter_core_msgs-srv:pose_stamp-val is deprecated.  Use baxter_core_msgs-srv:pose_stamp instead.")
  (pose_stamp m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SolvePositionIK-request>) ostream)
  "Serializes a message object of type '<SolvePositionIK-request>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'pose_stamp))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'pose_stamp))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SolvePositionIK-request>) istream)
  "Deserializes a message object of type '<SolvePositionIK-request>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'pose_stamp) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'pose_stamp)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'geometry_msgs-msg:PoseStamped))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SolvePositionIK-request>)))
  "Returns string type for a service object of type '<SolvePositionIK-request>"
  "baxter_core_msgs/SolvePositionIKRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SolvePositionIK-request)))
  "Returns string type for a service object of type 'SolvePositionIK-request"
  "baxter_core_msgs/SolvePositionIKRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SolvePositionIK-request>)))
  "Returns md5sum for a message object of type '<SolvePositionIK-request>"
  "834204e935305c14abaec9b5121e2032")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SolvePositionIK-request)))
  "Returns md5sum for a message object of type 'SolvePositionIK-request"
  "834204e935305c14abaec9b5121e2032")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SolvePositionIK-request>)))
  "Returns full string definition for message of type '<SolvePositionIK-request>"
  (cl:format cl:nil "geometry_msgs/PoseStamped[] pose_stamp~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.secs: seconds (stamp_secs) since epoch~%# * stamp.nsecs: nanoseconds since stamp_secs~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of postion and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SolvePositionIK-request)))
  "Returns full string definition for message of type 'SolvePositionIK-request"
  (cl:format cl:nil "geometry_msgs/PoseStamped[] pose_stamp~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.secs: seconds (stamp_secs) since epoch~%# * stamp.nsecs: nanoseconds since stamp_secs~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of postion and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SolvePositionIK-request>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'pose_stamp) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SolvePositionIK-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SolvePositionIK-request
    (cl:cons ':pose_stamp (pose_stamp msg))
))
;//! \htmlinclude SolvePositionIK-response.msg.html

(cl:defclass <SolvePositionIK-response> (roslisp-msg-protocol:ros-message)
  ((joints
    :reader joints
    :initarg :joints
    :type (cl:vector sensor_msgs-msg:JointState)
   :initform (cl:make-array 0 :element-type 'sensor_msgs-msg:JointState :initial-element (cl:make-instance 'sensor_msgs-msg:JointState)))
   (isValid
    :reader isValid
    :initarg :isValid
    :type (cl:vector cl:boolean)
   :initform (cl:make-array 0 :element-type 'cl:boolean :initial-element cl:nil)))
)

(cl:defclass SolvePositionIK-response (<SolvePositionIK-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SolvePositionIK-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SolvePositionIK-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name baxter_core_msgs-srv:<SolvePositionIK-response> is deprecated: use baxter_core_msgs-srv:SolvePositionIK-response instead.")))

(cl:ensure-generic-function 'joints-val :lambda-list '(m))
(cl:defmethod joints-val ((m <SolvePositionIK-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader baxter_core_msgs-srv:joints-val is deprecated.  Use baxter_core_msgs-srv:joints instead.")
  (joints m))

(cl:ensure-generic-function 'isValid-val :lambda-list '(m))
(cl:defmethod isValid-val ((m <SolvePositionIK-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader baxter_core_msgs-srv:isValid-val is deprecated.  Use baxter_core_msgs-srv:isValid instead.")
  (isValid m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SolvePositionIK-response>) ostream)
  "Serializes a message object of type '<SolvePositionIK-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'joints))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'joints))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'isValid))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if ele 1 0)) ostream))
   (cl:slot-value msg 'isValid))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SolvePositionIK-response>) istream)
  "Deserializes a message object of type '<SolvePositionIK-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'joints) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'joints)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'sensor_msgs-msg:JointState))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'isValid) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'isValid)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:not (cl:zerop (cl:read-byte istream)))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SolvePositionIK-response>)))
  "Returns string type for a service object of type '<SolvePositionIK-response>"
  "baxter_core_msgs/SolvePositionIKResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SolvePositionIK-response)))
  "Returns string type for a service object of type 'SolvePositionIK-response"
  "baxter_core_msgs/SolvePositionIKResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SolvePositionIK-response>)))
  "Returns md5sum for a message object of type '<SolvePositionIK-response>"
  "834204e935305c14abaec9b5121e2032")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SolvePositionIK-response)))
  "Returns md5sum for a message object of type 'SolvePositionIK-response"
  "834204e935305c14abaec9b5121e2032")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SolvePositionIK-response>)))
  "Returns full string definition for message of type '<SolvePositionIK-response>"
  (cl:format cl:nil "sensor_msgs/JointState[] joints~%bool[] isValid~%~%~%================================================================================~%MSG: sensor_msgs/JointState~%# This is a message that holds data to describe the state of a set of torque controlled joints. ~%#~%# The state of each joint (revolute or prismatic) is defined by:~%#  * the position of the joint (rad or m),~%#  * the velocity of the joint (rad/s or m/s) and ~%#  * the effort that is applied in the joint (Nm or N).~%#~%# Each joint is uniquely identified by its name~%# The header specifies the time at which the joint states were recorded. All the joint states~%# in one message have to be recorded at the same time.~%#~%# This message consists of a multiple arrays, one for each part of the joint state. ~%# The goal is to make each of the fields optional. When e.g. your joints have no~%# effort associated with them, you can leave the effort array empty. ~%#~%# All arrays in this message should have the same size, or be empty.~%# This is the only way to uniquely associate the joint name with the correct~%# states.~%~%~%Header header~%~%string[] name~%float64[] position~%float64[] velocity~%float64[] effort~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.secs: seconds (stamp_secs) since epoch~%# * stamp.nsecs: nanoseconds since stamp_secs~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SolvePositionIK-response)))
  "Returns full string definition for message of type 'SolvePositionIK-response"
  (cl:format cl:nil "sensor_msgs/JointState[] joints~%bool[] isValid~%~%~%================================================================================~%MSG: sensor_msgs/JointState~%# This is a message that holds data to describe the state of a set of torque controlled joints. ~%#~%# The state of each joint (revolute or prismatic) is defined by:~%#  * the position of the joint (rad or m),~%#  * the velocity of the joint (rad/s or m/s) and ~%#  * the effort that is applied in the joint (Nm or N).~%#~%# Each joint is uniquely identified by its name~%# The header specifies the time at which the joint states were recorded. All the joint states~%# in one message have to be recorded at the same time.~%#~%# This message consists of a multiple arrays, one for each part of the joint state. ~%# The goal is to make each of the fields optional. When e.g. your joints have no~%# effort associated with them, you can leave the effort array empty. ~%#~%# All arrays in this message should have the same size, or be empty.~%# This is the only way to uniquely associate the joint name with the correct~%# states.~%~%~%Header header~%~%string[] name~%float64[] position~%float64[] velocity~%float64[] effort~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.secs: seconds (stamp_secs) since epoch~%# * stamp.nsecs: nanoseconds since stamp_secs~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SolvePositionIK-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'joints) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'isValid) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SolvePositionIK-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SolvePositionIK-response
    (cl:cons ':joints (joints msg))
    (cl:cons ':isValid (isValid msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SolvePositionIK)))
  'SolvePositionIK-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SolvePositionIK)))
  'SolvePositionIK-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SolvePositionIK)))
  "Returns string type for a service object of type '<SolvePositionIK>"
  "baxter_core_msgs/SolvePositionIK")