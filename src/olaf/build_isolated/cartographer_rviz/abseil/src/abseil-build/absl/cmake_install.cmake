# Install script for directory: /home/nvidia/olaf/build_isolated/cartographer_rviz/abseil/src/abseil/absl

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/nvidia/olaf/build_isolated/cartographer_rviz/abseil/src/abseil-build/absl/base/cmake_install.cmake")
  include("/home/nvidia/olaf/build_isolated/cartographer_rviz/abseil/src/abseil-build/absl/algorithm/cmake_install.cmake")
  include("/home/nvidia/olaf/build_isolated/cartographer_rviz/abseil/src/abseil-build/absl/container/cmake_install.cmake")
  include("/home/nvidia/olaf/build_isolated/cartographer_rviz/abseil/src/abseil-build/absl/debugging/cmake_install.cmake")
  include("/home/nvidia/olaf/build_isolated/cartographer_rviz/abseil/src/abseil-build/absl/hash/cmake_install.cmake")
  include("/home/nvidia/olaf/build_isolated/cartographer_rviz/abseil/src/abseil-build/absl/memory/cmake_install.cmake")
  include("/home/nvidia/olaf/build_isolated/cartographer_rviz/abseil/src/abseil-build/absl/meta/cmake_install.cmake")
  include("/home/nvidia/olaf/build_isolated/cartographer_rviz/abseil/src/abseil-build/absl/numeric/cmake_install.cmake")
  include("/home/nvidia/olaf/build_isolated/cartographer_rviz/abseil/src/abseil-build/absl/strings/cmake_install.cmake")
  include("/home/nvidia/olaf/build_isolated/cartographer_rviz/abseil/src/abseil-build/absl/synchronization/cmake_install.cmake")
  include("/home/nvidia/olaf/build_isolated/cartographer_rviz/abseil/src/abseil-build/absl/time/cmake_install.cmake")
  include("/home/nvidia/olaf/build_isolated/cartographer_rviz/abseil/src/abseil-build/absl/types/cmake_install.cmake")
  include("/home/nvidia/olaf/build_isolated/cartographer_rviz/abseil/src/abseil-build/absl/utility/cmake_install.cmake")

endif()

