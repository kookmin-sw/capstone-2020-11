# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "obstacle_detector: 3 messages, 0 services")

set(MSG_I_FLAGS "-Iobstacle_detector:/home/nvidia/olaf/src/obstacle_detector/msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/kinetic/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(obstacle_detector_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/nvidia/olaf/src/obstacle_detector/msg/SegmentObstacle.msg" NAME_WE)
add_custom_target(_obstacle_detector_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "obstacle_detector" "/home/nvidia/olaf/src/obstacle_detector/msg/SegmentObstacle.msg" "geometry_msgs/Point"
)

get_filename_component(_filename "/home/nvidia/olaf/src/obstacle_detector/msg/Obstacles.msg" NAME_WE)
add_custom_target(_obstacle_detector_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "obstacle_detector" "/home/nvidia/olaf/src/obstacle_detector/msg/Obstacles.msg" "obstacle_detector/CircleObstacle:geometry_msgs/Vector3:obstacle_detector/SegmentObstacle:std_msgs/Header:geometry_msgs/Point"
)

get_filename_component(_filename "/home/nvidia/olaf/src/obstacle_detector/msg/CircleObstacle.msg" NAME_WE)
add_custom_target(_obstacle_detector_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "obstacle_detector" "/home/nvidia/olaf/src/obstacle_detector/msg/CircleObstacle.msg" "geometry_msgs/Point:geometry_msgs/Vector3"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(obstacle_detector
  "/home/nvidia/olaf/src/obstacle_detector/msg/SegmentObstacle.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/obstacle_detector
)
_generate_msg_cpp(obstacle_detector
  "/home/nvidia/olaf/src/obstacle_detector/msg/Obstacles.msg"
  "${MSG_I_FLAGS}"
  "/home/nvidia/olaf/src/obstacle_detector/msg/CircleObstacle.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/home/nvidia/olaf/src/obstacle_detector/msg/SegmentObstacle.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/obstacle_detector
)
_generate_msg_cpp(obstacle_detector
  "/home/nvidia/olaf/src/obstacle_detector/msg/CircleObstacle.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/obstacle_detector
)

### Generating Services

### Generating Module File
_generate_module_cpp(obstacle_detector
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/obstacle_detector
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(obstacle_detector_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(obstacle_detector_generate_messages obstacle_detector_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/nvidia/olaf/src/obstacle_detector/msg/SegmentObstacle.msg" NAME_WE)
add_dependencies(obstacle_detector_generate_messages_cpp _obstacle_detector_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/olaf/src/obstacle_detector/msg/Obstacles.msg" NAME_WE)
add_dependencies(obstacle_detector_generate_messages_cpp _obstacle_detector_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/olaf/src/obstacle_detector/msg/CircleObstacle.msg" NAME_WE)
add_dependencies(obstacle_detector_generate_messages_cpp _obstacle_detector_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(obstacle_detector_gencpp)
add_dependencies(obstacle_detector_gencpp obstacle_detector_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS obstacle_detector_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(obstacle_detector
  "/home/nvidia/olaf/src/obstacle_detector/msg/SegmentObstacle.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/obstacle_detector
)
_generate_msg_eus(obstacle_detector
  "/home/nvidia/olaf/src/obstacle_detector/msg/Obstacles.msg"
  "${MSG_I_FLAGS}"
  "/home/nvidia/olaf/src/obstacle_detector/msg/CircleObstacle.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/home/nvidia/olaf/src/obstacle_detector/msg/SegmentObstacle.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/obstacle_detector
)
_generate_msg_eus(obstacle_detector
  "/home/nvidia/olaf/src/obstacle_detector/msg/CircleObstacle.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/obstacle_detector
)

### Generating Services

### Generating Module File
_generate_module_eus(obstacle_detector
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/obstacle_detector
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(obstacle_detector_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(obstacle_detector_generate_messages obstacle_detector_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/nvidia/olaf/src/obstacle_detector/msg/SegmentObstacle.msg" NAME_WE)
add_dependencies(obstacle_detector_generate_messages_eus _obstacle_detector_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/olaf/src/obstacle_detector/msg/Obstacles.msg" NAME_WE)
add_dependencies(obstacle_detector_generate_messages_eus _obstacle_detector_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/olaf/src/obstacle_detector/msg/CircleObstacle.msg" NAME_WE)
add_dependencies(obstacle_detector_generate_messages_eus _obstacle_detector_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(obstacle_detector_geneus)
add_dependencies(obstacle_detector_geneus obstacle_detector_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS obstacle_detector_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(obstacle_detector
  "/home/nvidia/olaf/src/obstacle_detector/msg/SegmentObstacle.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/obstacle_detector
)
_generate_msg_lisp(obstacle_detector
  "/home/nvidia/olaf/src/obstacle_detector/msg/Obstacles.msg"
  "${MSG_I_FLAGS}"
  "/home/nvidia/olaf/src/obstacle_detector/msg/CircleObstacle.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/home/nvidia/olaf/src/obstacle_detector/msg/SegmentObstacle.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/obstacle_detector
)
_generate_msg_lisp(obstacle_detector
  "/home/nvidia/olaf/src/obstacle_detector/msg/CircleObstacle.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/obstacle_detector
)

### Generating Services

### Generating Module File
_generate_module_lisp(obstacle_detector
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/obstacle_detector
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(obstacle_detector_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(obstacle_detector_generate_messages obstacle_detector_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/nvidia/olaf/src/obstacle_detector/msg/SegmentObstacle.msg" NAME_WE)
add_dependencies(obstacle_detector_generate_messages_lisp _obstacle_detector_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/olaf/src/obstacle_detector/msg/Obstacles.msg" NAME_WE)
add_dependencies(obstacle_detector_generate_messages_lisp _obstacle_detector_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/olaf/src/obstacle_detector/msg/CircleObstacle.msg" NAME_WE)
add_dependencies(obstacle_detector_generate_messages_lisp _obstacle_detector_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(obstacle_detector_genlisp)
add_dependencies(obstacle_detector_genlisp obstacle_detector_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS obstacle_detector_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(obstacle_detector
  "/home/nvidia/olaf/src/obstacle_detector/msg/SegmentObstacle.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/obstacle_detector
)
_generate_msg_nodejs(obstacle_detector
  "/home/nvidia/olaf/src/obstacle_detector/msg/Obstacles.msg"
  "${MSG_I_FLAGS}"
  "/home/nvidia/olaf/src/obstacle_detector/msg/CircleObstacle.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/home/nvidia/olaf/src/obstacle_detector/msg/SegmentObstacle.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/obstacle_detector
)
_generate_msg_nodejs(obstacle_detector
  "/home/nvidia/olaf/src/obstacle_detector/msg/CircleObstacle.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/obstacle_detector
)

### Generating Services

### Generating Module File
_generate_module_nodejs(obstacle_detector
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/obstacle_detector
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(obstacle_detector_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(obstacle_detector_generate_messages obstacle_detector_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/nvidia/olaf/src/obstacle_detector/msg/SegmentObstacle.msg" NAME_WE)
add_dependencies(obstacle_detector_generate_messages_nodejs _obstacle_detector_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/olaf/src/obstacle_detector/msg/Obstacles.msg" NAME_WE)
add_dependencies(obstacle_detector_generate_messages_nodejs _obstacle_detector_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/olaf/src/obstacle_detector/msg/CircleObstacle.msg" NAME_WE)
add_dependencies(obstacle_detector_generate_messages_nodejs _obstacle_detector_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(obstacle_detector_gennodejs)
add_dependencies(obstacle_detector_gennodejs obstacle_detector_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS obstacle_detector_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(obstacle_detector
  "/home/nvidia/olaf/src/obstacle_detector/msg/SegmentObstacle.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/obstacle_detector
)
_generate_msg_py(obstacle_detector
  "/home/nvidia/olaf/src/obstacle_detector/msg/Obstacles.msg"
  "${MSG_I_FLAGS}"
  "/home/nvidia/olaf/src/obstacle_detector/msg/CircleObstacle.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/home/nvidia/olaf/src/obstacle_detector/msg/SegmentObstacle.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/obstacle_detector
)
_generate_msg_py(obstacle_detector
  "/home/nvidia/olaf/src/obstacle_detector/msg/CircleObstacle.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/obstacle_detector
)

### Generating Services

### Generating Module File
_generate_module_py(obstacle_detector
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/obstacle_detector
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(obstacle_detector_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(obstacle_detector_generate_messages obstacle_detector_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/nvidia/olaf/src/obstacle_detector/msg/SegmentObstacle.msg" NAME_WE)
add_dependencies(obstacle_detector_generate_messages_py _obstacle_detector_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/olaf/src/obstacle_detector/msg/Obstacles.msg" NAME_WE)
add_dependencies(obstacle_detector_generate_messages_py _obstacle_detector_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/olaf/src/obstacle_detector/msg/CircleObstacle.msg" NAME_WE)
add_dependencies(obstacle_detector_generate_messages_py _obstacle_detector_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(obstacle_detector_genpy)
add_dependencies(obstacle_detector_genpy obstacle_detector_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS obstacle_detector_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/obstacle_detector)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/obstacle_detector
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(obstacle_detector_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(obstacle_detector_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/obstacle_detector)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/obstacle_detector
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(obstacle_detector_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(obstacle_detector_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/obstacle_detector)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/obstacle_detector
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(obstacle_detector_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(obstacle_detector_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/obstacle_detector)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/obstacle_detector
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(obstacle_detector_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(obstacle_detector_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/obstacle_detector)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/obstacle_detector\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/obstacle_detector
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(obstacle_detector_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(obstacle_detector_generate_messages_py geometry_msgs_generate_messages_py)
endif()
