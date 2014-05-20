; Auto-generated. Do not edit!


(cl:in-package baxter_maintenance_msgs-srv)


;//! \htmlinclude RMCores-request.msg.html

(cl:defclass <RMCores-request> (roslisp-msg-protocol:ros-message)
  ((core
    :reader core
    :initarg :core
    :type cl:string
    :initform ""))
)

(cl:defclass RMCores-request (<RMCores-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RMCores-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RMCores-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name baxter_maintenance_msgs-srv:<RMCores-request> is deprecated: use baxter_maintenance_msgs-srv:RMCores-request instead.")))

(cl:ensure-generic-function 'core-val :lambda-list '(m))
(cl:defmethod core-val ((m <RMCores-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader baxter_maintenance_msgs-srv:core-val is deprecated.  Use baxter_maintenance_msgs-srv:core instead.")
  (core m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RMCores-request>) ostream)
  "Serializes a message object of type '<RMCores-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'core))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'core))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RMCores-request>) istream)
  "Deserializes a message object of type '<RMCores-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'core) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'core) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RMCores-request>)))
  "Returns string type for a service object of type '<RMCores-request>"
  "baxter_maintenance_msgs/RMCoresRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RMCores-request)))
  "Returns string type for a service object of type 'RMCores-request"
  "baxter_maintenance_msgs/RMCoresRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RMCores-request>)))
  "Returns md5sum for a message object of type '<RMCores-request>"
  "e357395786d5752c179252d49e6293b4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RMCores-request)))
  "Returns md5sum for a message object of type 'RMCores-request"
  "e357395786d5752c179252d49e6293b4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RMCores-request>)))
  "Returns full string definition for message of type '<RMCores-request>"
  (cl:format cl:nil "string  core~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RMCores-request)))
  "Returns full string definition for message of type 'RMCores-request"
  (cl:format cl:nil "string  core~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RMCores-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'core))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RMCores-request>))
  "Converts a ROS message object to a list"
  (cl:list 'RMCores-request
    (cl:cons ':core (core msg))
))
;//! \htmlinclude RMCores-response.msg.html

(cl:defclass <RMCores-response> (roslisp-msg-protocol:ros-message)
  ((err
    :reader err
    :initarg :err
    :type cl:integer
    :initform 0)
   (err_str
    :reader err_str
    :initarg :err_str
    :type cl:string
    :initform ""))
)

(cl:defclass RMCores-response (<RMCores-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RMCores-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RMCores-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name baxter_maintenance_msgs-srv:<RMCores-response> is deprecated: use baxter_maintenance_msgs-srv:RMCores-response instead.")))

(cl:ensure-generic-function 'err-val :lambda-list '(m))
(cl:defmethod err-val ((m <RMCores-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader baxter_maintenance_msgs-srv:err-val is deprecated.  Use baxter_maintenance_msgs-srv:err instead.")
  (err m))

(cl:ensure-generic-function 'err_str-val :lambda-list '(m))
(cl:defmethod err_str-val ((m <RMCores-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader baxter_maintenance_msgs-srv:err_str-val is deprecated.  Use baxter_maintenance_msgs-srv:err_str instead.")
  (err_str m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RMCores-response>) ostream)
  "Serializes a message object of type '<RMCores-response>"
  (cl:let* ((signed (cl:slot-value msg 'err)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'err_str))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'err_str))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RMCores-response>) istream)
  "Deserializes a message object of type '<RMCores-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'err) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'err_str) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'err_str) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RMCores-response>)))
  "Returns string type for a service object of type '<RMCores-response>"
  "baxter_maintenance_msgs/RMCoresResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RMCores-response)))
  "Returns string type for a service object of type 'RMCores-response"
  "baxter_maintenance_msgs/RMCoresResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RMCores-response>)))
  "Returns md5sum for a message object of type '<RMCores-response>"
  "e357395786d5752c179252d49e6293b4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RMCores-response)))
  "Returns md5sum for a message object of type 'RMCores-response"
  "e357395786d5752c179252d49e6293b4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RMCores-response>)))
  "Returns full string definition for message of type '<RMCores-response>"
  (cl:format cl:nil "int32   err~%string  err_str~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RMCores-response)))
  "Returns full string definition for message of type 'RMCores-response"
  (cl:format cl:nil "int32   err~%string  err_str~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RMCores-response>))
  (cl:+ 0
     4
     4 (cl:length (cl:slot-value msg 'err_str))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RMCores-response>))
  "Converts a ROS message object to a list"
  (cl:list 'RMCores-response
    (cl:cons ':err (err msg))
    (cl:cons ':err_str (err_str msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'RMCores)))
  'RMCores-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'RMCores)))
  'RMCores-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RMCores)))
  "Returns string type for a service object of type '<RMCores>"
  "baxter_maintenance_msgs/RMCores")