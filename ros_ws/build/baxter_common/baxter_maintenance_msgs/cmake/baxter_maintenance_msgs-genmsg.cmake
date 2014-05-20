# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "baxter_maintenance_msgs: 7 messages, 2 services")

set(MSG_I_FLAGS "-Ibaxter_maintenance_msgs:/home/kevin/ros_ws/src/baxter_common/baxter_maintenance_msgs/msg;-Istd_msgs:/opt/ros/groovy/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(baxter_maintenance_msgs_generate_messages ALL)

#
#  langs = gencpp;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(baxter_maintenance_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_maintenance_msgs/msg/TareData.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/baxter_maintenance_msgs
)
_generate_msg_cpp(baxter_maintenance_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_maintenance_msgs/msg/CalibrateArmData.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/baxter_maintenance_msgs
)
_generate_msg_cpp(baxter_maintenance_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_maintenance_msgs/msg/TareEnable.msg"
  "${MSG_I_FLAGS}"
  "/home/kevin/ros_ws/src/baxter_common/baxter_maintenance_msgs/msg/TareData.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/baxter_maintenance_msgs
)
_generate_msg_cpp(baxter_maintenance_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_maintenance_msgs/msg/UpdateSources.msg"
  "${MSG_I_FLAGS}"
  "/home/kevin/ros_ws/src/baxter_common/baxter_maintenance_msgs/msg/UpdateSource.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/baxter_maintenance_msgs
)
_generate_msg_cpp(baxter_maintenance_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_maintenance_msgs/msg/CalibrateArmEnable.msg"
  "${MSG_I_FLAGS}"
  "/home/kevin/ros_ws/src/baxter_common/baxter_maintenance_msgs/msg/CalibrateArmData.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/baxter_maintenance_msgs
)
_generate_msg_cpp(baxter_maintenance_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_maintenance_msgs/msg/UpdateSource.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/baxter_maintenance_msgs
)
_generate_msg_cpp(baxter_maintenance_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_maintenance_msgs/msg/UpdateStatus.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/baxter_maintenance_msgs
)

### Generating Services
_generate_srv_cpp(baxter_maintenance_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_maintenance_msgs/srv/RMCores.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/baxter_maintenance_msgs
)
_generate_srv_cpp(baxter_maintenance_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_maintenance_msgs/srv/LSCores.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/baxter_maintenance_msgs
)

### Generating Module File
_generate_module_cpp(baxter_maintenance_msgs
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/baxter_maintenance_msgs
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(baxter_maintenance_msgs_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(baxter_maintenance_msgs_generate_messages baxter_maintenance_msgs_generate_messages_cpp)

# target for backward compatibility
add_custom_target(baxter_maintenance_msgs_gencpp)
add_dependencies(baxter_maintenance_msgs_gencpp baxter_maintenance_msgs_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS baxter_maintenance_msgs_generate_messages_cpp)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(baxter_maintenance_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_maintenance_msgs/msg/TareData.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/baxter_maintenance_msgs
)
_generate_msg_lisp(baxter_maintenance_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_maintenance_msgs/msg/CalibrateArmData.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/baxter_maintenance_msgs
)
_generate_msg_lisp(baxter_maintenance_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_maintenance_msgs/msg/TareEnable.msg"
  "${MSG_I_FLAGS}"
  "/home/kevin/ros_ws/src/baxter_common/baxter_maintenance_msgs/msg/TareData.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/baxter_maintenance_msgs
)
_generate_msg_lisp(baxter_maintenance_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_maintenance_msgs/msg/UpdateSources.msg"
  "${MSG_I_FLAGS}"
  "/home/kevin/ros_ws/src/baxter_common/baxter_maintenance_msgs/msg/UpdateSource.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/baxter_maintenance_msgs
)
_generate_msg_lisp(baxter_maintenance_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_maintenance_msgs/msg/CalibrateArmEnable.msg"
  "${MSG_I_FLAGS}"
  "/home/kevin/ros_ws/src/baxter_common/baxter_maintenance_msgs/msg/CalibrateArmData.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/baxter_maintenance_msgs
)
_generate_msg_lisp(baxter_maintenance_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_maintenance_msgs/msg/UpdateSource.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/baxter_maintenance_msgs
)
_generate_msg_lisp(baxter_maintenance_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_maintenance_msgs/msg/UpdateStatus.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/baxter_maintenance_msgs
)

### Generating Services
_generate_srv_lisp(baxter_maintenance_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_maintenance_msgs/srv/RMCores.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/baxter_maintenance_msgs
)
_generate_srv_lisp(baxter_maintenance_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_maintenance_msgs/srv/LSCores.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/baxter_maintenance_msgs
)

### Generating Module File
_generate_module_lisp(baxter_maintenance_msgs
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/baxter_maintenance_msgs
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(baxter_maintenance_msgs_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(baxter_maintenance_msgs_generate_messages baxter_maintenance_msgs_generate_messages_lisp)

# target for backward compatibility
add_custom_target(baxter_maintenance_msgs_genlisp)
add_dependencies(baxter_maintenance_msgs_genlisp baxter_maintenance_msgs_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS baxter_maintenance_msgs_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(baxter_maintenance_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_maintenance_msgs/msg/TareData.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/baxter_maintenance_msgs
)
_generate_msg_py(baxter_maintenance_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_maintenance_msgs/msg/CalibrateArmData.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/baxter_maintenance_msgs
)
_generate_msg_py(baxter_maintenance_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_maintenance_msgs/msg/TareEnable.msg"
  "${MSG_I_FLAGS}"
  "/home/kevin/ros_ws/src/baxter_common/baxter_maintenance_msgs/msg/TareData.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/baxter_maintenance_msgs
)
_generate_msg_py(baxter_maintenance_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_maintenance_msgs/msg/UpdateSources.msg"
  "${MSG_I_FLAGS}"
  "/home/kevin/ros_ws/src/baxter_common/baxter_maintenance_msgs/msg/UpdateSource.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/baxter_maintenance_msgs
)
_generate_msg_py(baxter_maintenance_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_maintenance_msgs/msg/CalibrateArmEnable.msg"
  "${MSG_I_FLAGS}"
  "/home/kevin/ros_ws/src/baxter_common/baxter_maintenance_msgs/msg/CalibrateArmData.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/baxter_maintenance_msgs
)
_generate_msg_py(baxter_maintenance_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_maintenance_msgs/msg/UpdateSource.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/baxter_maintenance_msgs
)
_generate_msg_py(baxter_maintenance_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_maintenance_msgs/msg/UpdateStatus.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/baxter_maintenance_msgs
)

### Generating Services
_generate_srv_py(baxter_maintenance_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_maintenance_msgs/srv/RMCores.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/baxter_maintenance_msgs
)
_generate_srv_py(baxter_maintenance_msgs
  "/home/kevin/ros_ws/src/baxter_common/baxter_maintenance_msgs/srv/LSCores.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/baxter_maintenance_msgs
)

### Generating Module File
_generate_module_py(baxter_maintenance_msgs
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/baxter_maintenance_msgs
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(baxter_maintenance_msgs_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(baxter_maintenance_msgs_generate_messages baxter_maintenance_msgs_generate_messages_py)

# target for backward compatibility
add_custom_target(baxter_maintenance_msgs_genpy)
add_dependencies(baxter_maintenance_msgs_genpy baxter_maintenance_msgs_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS baxter_maintenance_msgs_generate_messages_py)


debug_message(2 "baxter_maintenance_msgs: Iflags=${MSG_I_FLAGS}")


if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/baxter_maintenance_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/baxter_maintenance_msgs
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
add_dependencies(baxter_maintenance_msgs_generate_messages_cpp std_msgs_generate_messages_cpp)

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/baxter_maintenance_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/baxter_maintenance_msgs
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
add_dependencies(baxter_maintenance_msgs_generate_messages_lisp std_msgs_generate_messages_lisp)

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/baxter_maintenance_msgs)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/baxter_maintenance_msgs\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/baxter_maintenance_msgs
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
add_dependencies(baxter_maintenance_msgs_generate_messages_py std_msgs_generate_messages_py)
