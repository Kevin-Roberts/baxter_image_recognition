; Auto-generated. Do not edit!


(cl:in-package baxter_maintenance_msgs-srv)


;//! \htmlinclude LSCores-request.msg.html

(cl:defclass <LSCores-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass LSCores-request (<LSCores-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LSCores-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LSCores-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name baxter_maintenance_msgs-srv:<LSCores-request> is deprecated: use baxter_maintenance_msgs-srv:LSCores-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LSCores-request>) ostream)
  "Serializes a message object of type '<LSCores-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LSCores-request>) istream)
  "Deserializes a message object of type '<LSCores-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LSCores-request>)))
  "Returns string type for a service object of type '<LSCores-request>"
  "baxter_maintenance_msgs/LSCoresRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LSCores-request)))
  "Returns string type for a service object of type 'LSCores-request"
  "baxter_maintenance_msgs/LSCoresRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LSCores-request>)))
  "Returns md5sum for a message object of type '<LSCores-request>"
  "327760b6a778597bd0478d23b1ca7006")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LSCores-request)))
  "Returns md5sum for a message object of type 'LSCores-request"
  "327760b6a778597bd0478d23b1ca7006")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LSCores-request>)))
  "Returns full string definition for message of type '<LSCores-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LSCores-request)))
  "Returns full string definition for message of type 'LSCores-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LSCores-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LSCores-request>))
  "Converts a ROS message object to a list"
  (cl:list 'LSCores-request
))
;//! \htmlinclude LSCores-response.msg.html

(cl:defclass <LSCores-response> (roslisp-msg-protocol:ros-message)
  ((cores
    :reader cores
    :initarg :cores
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element "")))
)

(cl:defclass LSCores-response (<LSCores-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LSCores-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LSCores-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name baxter_maintenance_msgs-srv:<LSCores-response> is deprecated: use baxter_maintenance_msgs-srv:LSCores-response instead.")))

(cl:ensure-generic-function 'cores-val :lambda-list '(m))
(cl:defmethod cores-val ((m <LSCores-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader baxter_maintenance_msgs-srv:cores-val is deprecated.  Use baxter_maintenance_msgs-srv:cores instead.")
  (cores m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LSCores-response>) ostream)
  "Serializes a message object of type '<LSCores-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'cores))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((__ros_str_len (cl:length ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) ele))
   (cl:slot-value msg 'cores))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LSCores-response>) istream)
  "Deserializes a message object of type '<LSCores-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'cores) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'cores)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:aref vals i) __ros_str_idx) (cl:code-char (cl:read-byte istream))))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LSCores-response>)))
  "Returns string type for a service object of type '<LSCores-response>"
  "baxter_maintenance_msgs/LSCoresResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LSCores-response)))
  "Returns string type for a service object of type 'LSCores-response"
  "baxter_maintenance_msgs/LSCoresResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LSCores-response>)))
  "Returns md5sum for a message object of type '<LSCores-response>"
  "327760b6a778597bd0478d23b1ca7006")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LSCores-response)))
  "Returns md5sum for a message object of type 'LSCores-response"
  "327760b6a778597bd0478d23b1ca7006")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LSCores-response>)))
  "Returns full string definition for message of type '<LSCores-response>"
  (cl:format cl:nil "string[]    cores~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LSCores-response)))
  "Returns full string definition for message of type 'LSCores-response"
  (cl:format cl:nil "string[]    cores~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LSCores-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'cores) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LSCores-response>))
  "Converts a ROS message object to a list"
  (cl:list 'LSCores-response
    (cl:cons ':cores (cores msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'LSCores)))
  'LSCores-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'LSCores)))
  'LSCores-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LSCores)))
  "Returns string type for a service object of type '<LSCores>"
  "baxter_maintenance_msgs/LSCores")