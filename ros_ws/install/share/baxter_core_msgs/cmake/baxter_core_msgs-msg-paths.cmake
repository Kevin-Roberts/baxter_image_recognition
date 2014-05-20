# generated from genmsg/cmake/pkg-msg-paths.cmake.em

# message include dirs in installspace
_prepend_path("${baxter_core_msgs_DIR}/.." "msg" baxter_core_msgs_MSG_INCLUDE_DIRS UNIQUE)
set(baxter_core_msgs_MSG_DEPENDENCIES geometry_msgs;sensor_msgs;std_msgs)
