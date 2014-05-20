# Install script for directory: /home/kevin/ros_ws/src

# Set the install prefix
IF(NOT DEFINED CMAKE_INSTALL_PREFIX)
  SET(CMAKE_INSTALL_PREFIX "/home/kevin/ros_ws/install")
ENDIF(NOT DEFINED CMAKE_INSTALL_PREFIX)
STRING(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
IF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  IF(BUILD_TYPE)
    STRING(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  ELSE(BUILD_TYPE)
    SET(CMAKE_INSTALL_CONFIG_NAME "")
  ENDIF(BUILD_TYPE)
  MESSAGE(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
ENDIF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)

# Set the component getting installed.
IF(NOT CMAKE_INSTALL_COMPONENT)
  IF(COMPONENT)
    MESSAGE(STATUS "Install component: \"${COMPONENT}\"")
    SET(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  ELSE(COMPONENT)
    SET(CMAKE_INSTALL_COMPONENT)
  ENDIF(COMPONENT)
ENDIF(NOT CMAKE_INSTALL_COMPONENT)

# Install shared libraries without execute permission?
IF(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  SET(CMAKE_INSTALL_SO_NO_EXE "1")
ENDIF(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  list(APPEND CPACK_ABSOLUTE_DESTINATION_FILES
   "/home/kevin/ros_ws/install/.catkin")
FILE(INSTALL DESTINATION "/home/kevin/ros_ws/install" TYPE FILE FILES "/home/kevin/ros_ws/build/catkin_generated/installspace/.catkin")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  list(APPEND CPACK_ABSOLUTE_DESTINATION_FILES
   "/home/kevin/ros_ws/install/_setup_util.py")
FILE(INSTALL DESTINATION "/home/kevin/ros_ws/install" TYPE PROGRAM FILES "/home/kevin/ros_ws/build/catkin_generated/installspace/_setup_util.py")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  list(APPEND CPACK_ABSOLUTE_DESTINATION_FILES
   "/home/kevin/ros_ws/install/env.sh")
FILE(INSTALL DESTINATION "/home/kevin/ros_ws/install" TYPE PROGRAM FILES "/home/kevin/ros_ws/build/catkin_generated/installspace/env.sh")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  list(APPEND CPACK_ABSOLUTE_DESTINATION_FILES
   "/home/kevin/ros_ws/install/setup.bash")
FILE(INSTALL DESTINATION "/home/kevin/ros_ws/install" TYPE FILE FILES "/home/kevin/ros_ws/build/catkin_generated/installspace/setup.bash")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  list(APPEND CPACK_ABSOLUTE_DESTINATION_FILES
   "/home/kevin/ros_ws/install/setup.sh")
FILE(INSTALL DESTINATION "/home/kevin/ros_ws/install" TYPE FILE FILES "/home/kevin/ros_ws/build/catkin_generated/installspace/setup.sh")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  list(APPEND CPACK_ABSOLUTE_DESTINATION_FILES
   "/home/kevin/ros_ws/install/setup.zsh")
FILE(INSTALL DESTINATION "/home/kevin/ros_ws/install" TYPE FILE FILES "/home/kevin/ros_ws/build/catkin_generated/installspace/setup.zsh")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  list(APPEND CPACK_ABSOLUTE_DESTINATION_FILES
   "/home/kevin/ros_ws/install/.rosinstall")
FILE(INSTALL DESTINATION "/home/kevin/ros_ws/install" TYPE FILE FILES "/home/kevin/ros_ws/build/catkin_generated/installspace/.rosinstall")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/etc/catkin/profile.d" TYPE FILE FILES "/opt/ros/groovy/share/catkin/cmake/env-hooks/05.catkin_make.bash")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/etc/catkin/profile.d" TYPE FILE FILES "/opt/ros/groovy/share/catkin/cmake/env-hooks/05.catkin_make_isolated.bash")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  INCLUDE("/home/kevin/ros_ws/build/gtest/cmake_install.cmake")
  INCLUDE("/home/kevin/ros_ws/build/moveit_robots/atlas_moveit_config/cmake_install.cmake")
  INCLUDE("/home/kevin/ros_ws/build/moveit_robots/atlas_v3_moveit_config/cmake_install.cmake")
  INCLUDE("/home/kevin/ros_ws/build/baxter_common/baxter_common/cmake_install.cmake")
  INCLUDE("/home/kevin/ros_ws/build/baxter_common/baxter_core_msgs/cmake_install.cmake")
  INCLUDE("/home/kevin/ros_ws/build/baxter_common/baxter_description/cmake_install.cmake")
  INCLUDE("/home/kevin/ros_ws/build/moveit_robots/baxter/baxter_ikfast_left_arm_plugin/cmake_install.cmake")
  INCLUDE("/home/kevin/ros_ws/build/moveit_robots/baxter/baxter_ikfast_right_arm_plugin/cmake_install.cmake")
  INCLUDE("/home/kevin/ros_ws/build/baxter_interface/cmake_install.cmake")
  INCLUDE("/home/kevin/ros_ws/build/baxter_examples/cmake_install.cmake")
  INCLUDE("/home/kevin/ros_ws/build/baxter_common/baxter_maintenance_msgs/cmake_install.cmake")
  INCLUDE("/home/kevin/ros_ws/build/moveit_robots/baxter/baxter_moveit_config/cmake_install.cmake")
  INCLUDE("/home/kevin/ros_ws/build/baxter/baxter_sdk/cmake_install.cmake")
  INCLUDE("/home/kevin/ros_ws/build/baxter_tools/cmake_install.cmake")
  INCLUDE("/home/kevin/ros_ws/build/moveit_robots/clam_moveit_config/cmake_install.cmake")
  INCLUDE("/home/kevin/ros_ws/build/moveit_robots/iri_wam_moveit_config/cmake_install.cmake")
  INCLUDE("/home/kevin/ros_ws/build/moveit_robots/r2_moveit_generated/cmake_install.cmake")

ENDIF(NOT CMAKE_INSTALL_LOCAL_ONLY)

IF(CMAKE_INSTALL_COMPONENT)
  SET(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
ELSE(CMAKE_INSTALL_COMPONENT)
  SET(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
ENDIF(CMAKE_INSTALL_COMPONENT)

FILE(WRITE "/home/kevin/ros_ws/build/${CMAKE_INSTALL_MANIFEST}" "")
FOREACH(file ${CMAKE_INSTALL_MANIFEST_FILES})
  FILE(APPEND "/home/kevin/ros_ws/build/${CMAKE_INSTALL_MANIFEST}" "${file}\n")
ENDFOREACH(file)
