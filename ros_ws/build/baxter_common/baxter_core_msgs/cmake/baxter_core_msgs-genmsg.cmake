# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "baxter_core_msgs: 26 messages, 4 services")

set(MSG_I_FLAGS "-Ibaxter_core_msgs:/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg;-Igeometry_msgs:/opt/ros/groovy/share/geometry_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/groovy/share/sensor_msgs/cmake/../msg;-Istd_msgs:/opt/ros/groovy/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(baxter_core_msgs_generate_messages ALL)

#
#  langs = gencpp;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(baxter_core_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/EndEffectorState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/baxter_core_msgs
)
_generate_msg_cpp(baxter_core_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/RobustControllerStatus.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/baxter_core_msgs
)
_generate_msg_cpp(baxter_core_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/NavigatorStates.msg"
  "${MSG_I_FLAGS}"
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/NavigatorState.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/baxter_core_msgs
)
_generate_msg_cpp(baxter_core_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/CollisionAvoidanceState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/groovy/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/baxter_core_msgs
)
_generate_msg_cpp(baxter_core_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/AnalogIOStates.msg"
  "${MSG_I_FLAGS}"
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/AnalogIOState.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/baxter_core_msgs
)
_generate_msg_cpp(baxter_core_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/AssemblyStates.msg"
  "${MSG_I_FLAGS}"
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/AssemblyState.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/baxter_core_msgs
)
_generate_msg_cpp(baxter_core_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/DigitalIOState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/baxter_core_msgs
)
_generate_msg_cpp(baxter_core_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/CollisionDetectionState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/groovy/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/baxter_core_msgs
)
_generate_msg_cpp(baxter_core_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/JointCommand.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/baxter_core_msgs
)
_generate_msg_cpp(baxter_core_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/AssemblyState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/baxter_core_msgs
)
_generate_msg_cpp(baxter_core_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/ITBState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/baxter_core_msgs
)
_generate_msg_cpp(baxter_core_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/AnalogOutputCommand.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/baxter_core_msgs
)
_generate_msg_cpp(baxter_core_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/DigitalIOStates.msg"
  "${MSG_I_FLAGS}"
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/DigitalIOState.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/baxter_core_msgs
)
_generate_msg_cpp(baxter_core_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/EndpointState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/groovy/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/groovy/share/geometry_msgs/cmake/../msg/Wrench.msg;/opt/ros/groovy/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/groovy/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/groovy/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/groovy/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/baxter_core_msgs
)
_generate_msg_cpp(baxter_core_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/NavigatorState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/baxter_core_msgs
)
_generate_msg_cpp(baxter_core_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/DigitalOutputCommand.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/baxter_core_msgs
)
_generate_msg_cpp(baxter_core_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/HeadPanCommand.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/baxter_core_msgs
)
_generate_msg_cpp(baxter_core_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/SEAJointState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/groovy/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/baxter_core_msgs
)
_generate_msg_cpp(baxter_core_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/EndEffectorProperties.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/baxter_core_msgs
)
_generate_msg_cpp(baxter_core_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/HeadState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/baxter_core_msgs
)
_generate_msg_cpp(baxter_core_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/CameraControl.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/baxter_core_msgs
)
_generate_msg_cpp(baxter_core_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/CameraSettings.msg"
  "${MSG_I_FLAGS}"
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/CameraControl.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/baxter_core_msgs
)
_generate_msg_cpp(baxter_core_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/ITBStates.msg"
  "${MSG_I_FLAGS}"
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/ITBState.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/baxter_core_msgs
)
_generate_msg_cpp(baxter_core_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/EndEffectorCommand.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/baxter_core_msgs
)
_generate_msg_cpp(baxter_core_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/EndpointStates.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/groovy/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/groovy/share/geometry_msgs/cmake/../msg/Wrench.msg;/opt/ros/groovy/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/groovy/share/geometry_msgs/cmake/../msg/Twist.msg;/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/EndpointState.msg;/opt/ros/groovy/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/groovy/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/baxter_core_msgs
)
_generate_msg_cpp(baxter_core_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/AnalogIOState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/baxter_core_msgs
)

### Generating Services
_generate_srv_cpp(baxter_core_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/srv/OpenCamera.srv"
  "${MSG_I_FLAGS}"
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/CameraControl.msg;/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/CameraSettings.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/baxter_core_msgs
)
_generate_srv_cpp(baxter_core_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/srv/SolvePositionIK.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/groovy/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/groovy/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/groovy/share/sensor_msgs/cmake/../msg/JointState.msg;/opt/ros/groovy/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/groovy/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/groovy/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/baxter_core_msgs
)
_generate_srv_cpp(baxter_core_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/srv/CloseCamera.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/baxter_core_msgs
)
_generate_srv_cpp(baxter_core_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/srv/ListCameras.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/baxter_core_msgs
)

### Generating Module File
_generate_module_cpp(baxter_core_msgs
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/baxter_core_msgs
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(baxter_core_msgs_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(baxter_core_msgs_generate_messages baxter_core_msgs_generate_messages_cpp)

# target for backward compatibility
add_custom_target(baxter_core_msgs_gencpp)
add_dependencies(baxter_core_msgs_gencpp baxter_core_msgs_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS baxter_core_msgs_generate_messages_cpp)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(baxter_core_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/EndEffectorState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/baxter_core_msgs
)
_generate_msg_lisp(baxter_core_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/RobustControllerStatus.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/baxter_core_msgs
)
_generate_msg_lisp(baxter_core_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/NavigatorStates.msg"
  "${MSG_I_FLAGS}"
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/NavigatorState.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/baxter_core_msgs
)
_generate_msg_lisp(baxter_core_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/CollisionAvoidanceState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/groovy/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/baxter_core_msgs
)
_generate_msg_lisp(baxter_core_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/AnalogIOStates.msg"
  "${MSG_I_FLAGS}"
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/AnalogIOState.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/baxter_core_msgs
)
_generate_msg_lisp(baxter_core_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/AssemblyStates.msg"
  "${MSG_I_FLAGS}"
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/AssemblyState.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/baxter_core_msgs
)
_generate_msg_lisp(baxter_core_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/DigitalIOState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/baxter_core_msgs
)
_generate_msg_lisp(baxter_core_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/CollisionDetectionState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/groovy/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/baxter_core_msgs
)
_generate_msg_lisp(baxter_core_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/JointCommand.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/baxter_core_msgs
)
_generate_msg_lisp(baxter_core_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/AssemblyState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/baxter_core_msgs
)
_generate_msg_lisp(baxter_core_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/ITBState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/baxter_core_msgs
)
_generate_msg_lisp(baxter_core_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/AnalogOutputCommand.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/baxter_core_msgs
)
_generate_msg_lisp(baxter_core_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/DigitalIOStates.msg"
  "${MSG_I_FLAGS}"
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/DigitalIOState.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/baxter_core_msgs
)
_generate_msg_lisp(baxter_core_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/EndpointState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/groovy/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/groovy/share/geometry_msgs/cmake/../msg/Wrench.msg;/opt/ros/groovy/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/groovy/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/groovy/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/groovy/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/baxter_core_msgs
)
_generate_msg_lisp(baxter_core_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/NavigatorState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/baxter_core_msgs
)
_generate_msg_lisp(baxter_core_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/DigitalOutputCommand.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/baxter_core_msgs
)
_generate_msg_lisp(baxter_core_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/HeadPanCommand.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/baxter_core_msgs
)
_generate_msg_lisp(baxter_core_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/SEAJointState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/groovy/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/baxter_core_msgs
)
_generate_msg_lisp(baxter_core_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/EndEffectorProperties.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/baxter_core_msgs
)
_generate_msg_lisp(baxter_core_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/HeadState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/baxter_core_msgs
)
_generate_msg_lisp(baxter_core_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/CameraControl.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/baxter_core_msgs
)
_generate_msg_lisp(baxter_core_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/CameraSettings.msg"
  "${MSG_I_FLAGS}"
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/CameraControl.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/baxter_core_msgs
)
_generate_msg_lisp(baxter_core_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/ITBStates.msg"
  "${MSG_I_FLAGS}"
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/ITBState.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/baxter_core_msgs
)
_generate_msg_lisp(baxter_core_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/EndEffectorCommand.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/baxter_core_msgs
)
_generate_msg_lisp(baxter_core_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/EndpointStates.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/groovy/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/groovy/share/geometry_msgs/cmake/../msg/Wrench.msg;/opt/ros/groovy/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/groovy/share/geometry_msgs/cmake/../msg/Twist.msg;/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/EndpointState.msg;/opt/ros/groovy/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/groovy/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/baxter_core_msgs
)
_generate_msg_lisp(baxter_core_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/AnalogIOState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/baxter_core_msgs
)

### Generating Services
_generate_srv_lisp(baxter_core_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/srv/OpenCamera.srv"
  "${MSG_I_FLAGS}"
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/CameraControl.msg;/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/CameraSettings.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/baxter_core_msgs
)
_generate_srv_lisp(baxter_core_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/srv/SolvePositionIK.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/groovy/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/groovy/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/groovy/share/sensor_msgs/cmake/../msg/JointState.msg;/opt/ros/groovy/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/groovy/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/groovy/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/baxter_core_msgs
)
_generate_srv_lisp(baxter_core_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/srv/CloseCamera.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/baxter_core_msgs
)
_generate_srv_lisp(baxter_core_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/srv/ListCameras.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/baxter_core_msgs
)

### Generating Module File
_generate_module_lisp(baxter_core_msgs
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/baxter_core_msgs
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(baxter_core_msgs_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(baxter_core_msgs_generate_messages baxter_core_msgs_generate_messages_lisp)

# target for backward compatibility
add_custom_target(baxter_core_msgs_genlisp)
add_dependencies(baxter_core_msgs_genlisp baxter_core_msgs_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS baxter_core_msgs_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(baxter_core_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/EndEffectorState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/baxter_core_msgs
)
_generate_msg_py(baxter_core_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/RobustControllerStatus.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/baxter_core_msgs
)
_generate_msg_py(baxter_core_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/NavigatorStates.msg"
  "${MSG_I_FLAGS}"
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/NavigatorState.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/baxter_core_msgs
)
_generate_msg_py(baxter_core_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/CollisionAvoidanceState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/groovy/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/baxter_core_msgs
)
_generate_msg_py(baxter_core_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/AnalogIOStates.msg"
  "${MSG_I_FLAGS}"
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/AnalogIOState.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/baxter_core_msgs
)
_generate_msg_py(baxter_core_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/AssemblyStates.msg"
  "${MSG_I_FLAGS}"
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/AssemblyState.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/baxter_core_msgs
)
_generate_msg_py(baxter_core_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/DigitalIOState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/baxter_core_msgs
)
_generate_msg_py(baxter_core_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/CollisionDetectionState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/groovy/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/baxter_core_msgs
)
_generate_msg_py(baxter_core_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/JointCommand.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/baxter_core_msgs
)
_generate_msg_py(baxter_core_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/AssemblyState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/baxter_core_msgs
)
_generate_msg_py(baxter_core_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/ITBState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/baxter_core_msgs
)
_generate_msg_py(baxter_core_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/AnalogOutputCommand.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/baxter_core_msgs
)
_generate_msg_py(baxter_core_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/DigitalIOStates.msg"
  "${MSG_I_FLAGS}"
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/DigitalIOState.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/baxter_core_msgs
)
_generate_msg_py(baxter_core_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/EndpointState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/groovy/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/groovy/share/geometry_msgs/cmake/../msg/Wrench.msg;/opt/ros/groovy/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/groovy/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/groovy/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/groovy/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/baxter_core_msgs
)
_generate_msg_py(baxter_core_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/NavigatorState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/baxter_core_msgs
)
_generate_msg_py(baxter_core_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/DigitalOutputCommand.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/baxter_core_msgs
)
_generate_msg_py(baxter_core_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/HeadPanCommand.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/baxter_core_msgs
)
_generate_msg_py(baxter_core_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/SEAJointState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/groovy/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/baxter_core_msgs
)
_generate_msg_py(baxter_core_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/EndEffectorProperties.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/baxter_core_msgs
)
_generate_msg_py(baxter_core_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/HeadState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/baxter_core_msgs
)
_generate_msg_py(baxter_core_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/CameraControl.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/baxter_core_msgs
)
_generate_msg_py(baxter_core_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/CameraSettings.msg"
  "${MSG_I_FLAGS}"
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/CameraControl.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/baxter_core_msgs
)
_generate_msg_py(baxter_core_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/ITBStates.msg"
  "${MSG_I_FLAGS}"
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/ITBState.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/baxter_core_msgs
)
_generate_msg_py(baxter_core_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/EndEffectorCommand.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/baxter_core_msgs
)
_generate_msg_py(baxter_core_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/EndpointStates.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/groovy/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/groovy/share/geometry_msgs/cmake/../msg/Wrench.msg;/opt/ros/groovy/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/groovy/share/geometry_msgs/cmake/../msg/Twist.msg;/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/EndpointState.msg;/opt/ros/groovy/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/groovy/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/baxter_core_msgs
)
_generate_msg_py(baxter_core_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/AnalogIOState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/baxter_core_msgs
)

### Generating Services
_generate_srv_py(baxter_core_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/srv/OpenCamera.srv"
  "${MSG_I_FLAGS}"
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/CameraControl.msg;/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/CameraSettings.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/baxter_core_msgs
)
_generate_srv_py(baxter_core_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/srv/SolvePositionIK.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/groovy/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/groovy/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/groovy/share/sensor_msgs/cmake/../msg/JointState.msg;/opt/ros/groovy/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/groovy/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/groovy/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/baxter_core_msgs
)
_generate_srv_py(baxter_core_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/srv/CloseCamera.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/baxter_core_msgs
)
_generate_srv_py(baxter_core_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/srv/ListCameras.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/baxter_core_msgs
)

### Generating Module File
_generate_module_py(baxter_core_msgs
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/baxter_core_msgs
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(baxter_core_msgs_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(baxter_core_msgs_generate_messages baxter_core_msgs_generate_messages_py)

# target for backward compatibility
add_custom_target(baxter_core_msgs_genpy)
add_dependencies(baxter_core_msgs_genpy baxter_core_msgs_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS baxter_core_msgs_generate_messages_py)


debug_message(2 "baxter_core_msgs: Iflags=${MSG_I_FLAGS}")


if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/baxter_core_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/baxter_core_msgs
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
add_dependencies(baxter_core_msgs_generate_messages_cpp geometry_msgs_generate_messages_cpp)
add_dependencies(baxter_core_msgs_generate_messages_cpp sensor_msgs_generate_messages_cpp)
add_dependencies(baxter_core_msgs_generate_messages_cpp std_msgs_generate_messages_cpp)

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/baxter_core_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/baxter_core_msgs
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
add_dependencies(baxter_core_msgs_generate_messages_lisp geometry_msgs_generate_messages_lisp)
add_dependencies(baxter_core_msgs_generate_messages_lisp sensor_msgs_generate_messages_lisp)
add_dependencies(baxter_core_msgs_generate_messages_lisp std_msgs_generate_messages_lisp)

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/baxter_core_msgs)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/baxter_core_msgs\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/baxter_core_msgs
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
add_dependencies(baxter_core_msgs_generate_messages_py geometry_msgs_generate_messages_py)
add_dependencies(baxter_core_msgs_generate_messages_py sensor_msgs_generate_messages_py)
add_dependencies(baxter_core_msgs_generate_messages_py std_msgs_generate_messages_py)
