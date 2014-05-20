; Auto-generated. Do not edit!


(cl:in-package baxter_maintenance_msgs-msg)


;//! \htmlinclude CalibrateArmData.msg.html

(cl:defclass <CalibrateArmData> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass CalibrateArmData (<CalibrateArmData>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CalibrateArmData>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CalibrateArmData)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name baxter_maintenance_msgs-msg:<CalibrateArmData> is deprecated: use baxter_maintenance_msgs-msg:CalibrateArmData instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CalibrateArmData>) ostream)
  "Serializes a message object of type '<CalibrateArmData>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CalibrateArmData>) istream)
  "Deserializes a message object of type '<CalibrateArmData>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CalibrateArmData>)))
  "Returns string type for a message object of type '<CalibrateArmData>"
  "baxter_maintenance_msgs/CalibrateArmData")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CalibrateArmData)))
  "Returns string type for a message object of type 'CalibrateArmData"
  "baxter_maintenance_msgs/CalibrateArmData")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CalibrateArmData>)))
  "Returns md5sum for a message object of type '<CalibrateArmData>"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CalibrateArmData)))
  "Returns md5sum for a message object of type 'CalibrateArmData"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CalibrateArmData>)))
  "Returns full string definition for message of type '<CalibrateArmData>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CalibrateArmData)))
  "Returns full string definition for message of type 'CalibrateArmData"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CalibrateArmData>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CalibrateArmData>))
  "Converts a ROS message object to a list"
  (cl:list 'CalibrateArmData
))
