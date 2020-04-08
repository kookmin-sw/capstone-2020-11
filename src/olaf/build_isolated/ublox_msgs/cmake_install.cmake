# Install script for directory: /home/nvidia/olaf/src/ublox/ublox_msgs

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/nvidia/olaf/install_isolated")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
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

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  
      if (NOT EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}")
        file(MAKE_DIRECTORY "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}")
      endif()
      if (NOT EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/.catkin")
        file(WRITE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/.catkin" "")
      endif()
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/nvidia/olaf/install_isolated/_setup_util.py")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/nvidia/olaf/install_isolated" TYPE PROGRAM FILES "/home/nvidia/olaf/build_isolated/ublox_msgs/catkin_generated/installspace/_setup_util.py")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/nvidia/olaf/install_isolated/env.sh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/nvidia/olaf/install_isolated" TYPE PROGRAM FILES "/home/nvidia/olaf/build_isolated/ublox_msgs/catkin_generated/installspace/env.sh")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/nvidia/olaf/install_isolated/setup.bash;/home/nvidia/olaf/install_isolated/local_setup.bash")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/nvidia/olaf/install_isolated" TYPE FILE FILES
    "/home/nvidia/olaf/build_isolated/ublox_msgs/catkin_generated/installspace/setup.bash"
    "/home/nvidia/olaf/build_isolated/ublox_msgs/catkin_generated/installspace/local_setup.bash"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/nvidia/olaf/install_isolated/setup.sh;/home/nvidia/olaf/install_isolated/local_setup.sh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/nvidia/olaf/install_isolated" TYPE FILE FILES
    "/home/nvidia/olaf/build_isolated/ublox_msgs/catkin_generated/installspace/setup.sh"
    "/home/nvidia/olaf/build_isolated/ublox_msgs/catkin_generated/installspace/local_setup.sh"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/nvidia/olaf/install_isolated/setup.zsh;/home/nvidia/olaf/install_isolated/local_setup.zsh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/nvidia/olaf/install_isolated" TYPE FILE FILES
    "/home/nvidia/olaf/build_isolated/ublox_msgs/catkin_generated/installspace/setup.zsh"
    "/home/nvidia/olaf/build_isolated/ublox_msgs/catkin_generated/installspace/local_setup.zsh"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/nvidia/olaf/install_isolated/.rosinstall")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/nvidia/olaf/install_isolated" TYPE FILE FILES "/home/nvidia/olaf/build_isolated/ublox_msgs/catkin_generated/installspace/.rosinstall")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ublox_msgs/msg" TYPE FILE FILES
    "/home/nvidia/olaf/src/ublox/ublox_msgs/msg/Ack.msg"
    "/home/nvidia/olaf/src/ublox/ublox_msgs/msg/AidALM.msg"
    "/home/nvidia/olaf/src/ublox/ublox_msgs/msg/AidEPH.msg"
    "/home/nvidia/olaf/src/ublox/ublox_msgs/msg/AidHUI.msg"
    "/home/nvidia/olaf/src/ublox/ublox_msgs/msg/CfgANT.msg"
    "/home/nvidia/olaf/src/ublox/ublox_msgs/msg/CfgCFG.msg"
    "/home/nvidia/olaf/src/ublox/ublox_msgs/msg/CfgDAT.msg"
    "/home/nvidia/olaf/src/ublox/ublox_msgs/msg/CfgDGNSS.msg"
    "/home/nvidia/olaf/src/ublox/ublox_msgs/msg/CfgGNSS.msg"
    "/home/nvidia/olaf/src/ublox/ublox_msgs/msg/CfgGNSS_Block.msg"
    "/home/nvidia/olaf/src/ublox/ublox_msgs/msg/CfgHNR.msg"
    "/home/nvidia/olaf/src/ublox/ublox_msgs/msg/CfgINF.msg"
    "/home/nvidia/olaf/src/ublox/ublox_msgs/msg/CfgINF_Block.msg"
    "/home/nvidia/olaf/src/ublox/ublox_msgs/msg/CfgMSG.msg"
    "/home/nvidia/olaf/src/ublox/ublox_msgs/msg/CfgNAV5.msg"
    "/home/nvidia/olaf/src/ublox/ublox_msgs/msg/CfgNAVX5.msg"
    "/home/nvidia/olaf/src/ublox/ublox_msgs/msg/CfgNMEA.msg"
    "/home/nvidia/olaf/src/ublox/ublox_msgs/msg/CfgNMEA6.msg"
    "/home/nvidia/olaf/src/ublox/ublox_msgs/msg/CfgNMEA7.msg"
    "/home/nvidia/olaf/src/ublox/ublox_msgs/msg/CfgPRT.msg"
    "/home/nvidia/olaf/src/ublox/ublox_msgs/msg/CfgRATE.msg"
    "/home/nvidia/olaf/src/ublox/ublox_msgs/msg/CfgRST.msg"
    "/home/nvidia/olaf/src/ublox/ublox_msgs/msg/CfgSBAS.msg"
    "/home/nvidia/olaf/src/ublox/ublox_msgs/msg/CfgTMODE3.msg"
    "/home/nvidia/olaf/src/ublox/ublox_msgs/msg/CfgUSB.msg"
    "/home/nvidia/olaf/src/ublox/ublox_msgs/msg/EsfINS.msg"
    "/home/nvidia/olaf/src/ublox/ublox_msgs/msg/EsfMEAS.msg"
    "/home/nvidia/olaf/src/ublox/ublox_msgs/msg/EsfRAW.msg"
    "/home/nvidia/olaf/src/ublox/ublox_msgs/msg/EsfRAW_Block.msg"
    "/home/nvidia/olaf/src/ublox/ublox_msgs/msg/EsfSTATUS.msg"
    "/home/nvidia/olaf/src/ublox/ublox_msgs/msg/EsfSTATUS_Sens.msg"
    "/home/nvidia/olaf/src/ublox/ublox_msgs/msg/HnrPVT.msg"
    "/home/nvidia/olaf/src/ublox/ublox_msgs/msg/Inf.msg"
    "/home/nvidia/olaf/src/ublox/ublox_msgs/msg/MgaGAL.msg"
    "/home/nvidia/olaf/src/ublox/ublox_msgs/msg/MonGNSS.msg"
    "/home/nvidia/olaf/src/ublox/ublox_msgs/msg/MonHW.msg"
    "/home/nvidia/olaf/src/ublox/ublox_msgs/msg/MonHW6.msg"
    "/home/nvidia/olaf/src/ublox/ublox_msgs/msg/MonVER.msg"
    "/home/nvidia/olaf/src/ublox/ublox_msgs/msg/MonVER_Extension.msg"
    "/home/nvidia/olaf/src/ublox/ublox_msgs/msg/NavATT.msg"
    "/home/nvidia/olaf/src/ublox/ublox_msgs/msg/NavCLOCK.msg"
    "/home/nvidia/olaf/src/ublox/ublox_msgs/msg/NavDGPS.msg"
    "/home/nvidia/olaf/src/ublox/ublox_msgs/msg/NavDGPS_SV.msg"
    "/home/nvidia/olaf/src/ublox/ublox_msgs/msg/NavDOP.msg"
    "/home/nvidia/olaf/src/ublox/ublox_msgs/msg/NavPOSECEF.msg"
    "/home/nvidia/olaf/src/ublox/ublox_msgs/msg/NavPOSLLH.msg"
    "/home/nvidia/olaf/src/ublox/ublox_msgs/msg/NavPVT.msg"
    "/home/nvidia/olaf/src/ublox/ublox_msgs/msg/NavPVT7.msg"
    "/home/nvidia/olaf/src/ublox/ublox_msgs/msg/NavRELPOSNED.msg"
    "/home/nvidia/olaf/src/ublox/ublox_msgs/msg/NavSAT.msg"
    "/home/nvidia/olaf/src/ublox/ublox_msgs/msg/NavSAT_SV.msg"
    "/home/nvidia/olaf/src/ublox/ublox_msgs/msg/NavSBAS.msg"
    "/home/nvidia/olaf/src/ublox/ublox_msgs/msg/NavSBAS_SV.msg"
    "/home/nvidia/olaf/src/ublox/ublox_msgs/msg/NavSOL.msg"
    "/home/nvidia/olaf/src/ublox/ublox_msgs/msg/NavSTATUS.msg"
    "/home/nvidia/olaf/src/ublox/ublox_msgs/msg/NavSVIN.msg"
    "/home/nvidia/olaf/src/ublox/ublox_msgs/msg/NavSVINFO.msg"
    "/home/nvidia/olaf/src/ublox/ublox_msgs/msg/NavSVINFO_SV.msg"
    "/home/nvidia/olaf/src/ublox/ublox_msgs/msg/NavTIMEGPS.msg"
    "/home/nvidia/olaf/src/ublox/ublox_msgs/msg/NavTIMEUTC.msg"
    "/home/nvidia/olaf/src/ublox/ublox_msgs/msg/NavVELECEF.msg"
    "/home/nvidia/olaf/src/ublox/ublox_msgs/msg/NavVELNED.msg"
    "/home/nvidia/olaf/src/ublox/ublox_msgs/msg/RxmALM.msg"
    "/home/nvidia/olaf/src/ublox/ublox_msgs/msg/RxmEPH.msg"
    "/home/nvidia/olaf/src/ublox/ublox_msgs/msg/RxmRAW.msg"
    "/home/nvidia/olaf/src/ublox/ublox_msgs/msg/RxmRAWX.msg"
    "/home/nvidia/olaf/src/ublox/ublox_msgs/msg/RxmRAWX_Meas.msg"
    "/home/nvidia/olaf/src/ublox/ublox_msgs/msg/RxmRAW_SV.msg"
    "/home/nvidia/olaf/src/ublox/ublox_msgs/msg/RxmRTCM.msg"
    "/home/nvidia/olaf/src/ublox/ublox_msgs/msg/RxmSFRB.msg"
    "/home/nvidia/olaf/src/ublox/ublox_msgs/msg/RxmSFRBX.msg"
    "/home/nvidia/olaf/src/ublox/ublox_msgs/msg/RxmSVSI.msg"
    "/home/nvidia/olaf/src/ublox/ublox_msgs/msg/RxmSVSI_SV.msg"
    "/home/nvidia/olaf/src/ublox/ublox_msgs/msg/TimTM2.msg"
    "/home/nvidia/olaf/src/ublox/ublox_msgs/msg/UpdSOS.msg"
    "/home/nvidia/olaf/src/ublox/ublox_msgs/msg/UpdSOS_Ack.msg"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ublox_msgs/cmake" TYPE FILE FILES "/home/nvidia/olaf/build_isolated/ublox_msgs/catkin_generated/installspace/ublox_msgs-msg-paths.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/nvidia/olaf/devel_isolated/ublox_msgs/include/ublox_msgs")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/nvidia/olaf/devel_isolated/ublox_msgs/share/roseus/ros/ublox_msgs")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/nvidia/olaf/devel_isolated/ublox_msgs/share/common-lisp/ros/ublox_msgs")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/nvidia/olaf/devel_isolated/ublox_msgs/share/gennodejs/ros/ublox_msgs")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  execute_process(COMMAND "/usr/bin/python2" -m compileall "/home/nvidia/olaf/devel_isolated/ublox_msgs/lib/python2.7/dist-packages/ublox_msgs")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages" TYPE DIRECTORY FILES "/home/nvidia/olaf/devel_isolated/ublox_msgs/lib/python2.7/dist-packages/ublox_msgs")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/nvidia/olaf/build_isolated/ublox_msgs/catkin_generated/installspace/ublox_msgs.pc")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ublox_msgs/cmake" TYPE FILE FILES "/home/nvidia/olaf/build_isolated/ublox_msgs/catkin_generated/installspace/ublox_msgs-msg-extras.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ublox_msgs/cmake" TYPE FILE FILES
    "/home/nvidia/olaf/build_isolated/ublox_msgs/catkin_generated/installspace/ublox_msgsConfig.cmake"
    "/home/nvidia/olaf/build_isolated/ublox_msgs/catkin_generated/installspace/ublox_msgsConfig-version.cmake"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ublox_msgs" TYPE FILE FILES "/home/nvidia/olaf/src/ublox/ublox_msgs/package.xml")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libublox_msgs.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libublox_msgs.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libublox_msgs.so"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/nvidia/olaf/devel_isolated/ublox_msgs/lib/libublox_msgs.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libublox_msgs.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libublox_msgs.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libublox_msgs.so"
         OLD_RPATH "/opt/ros/kinetic/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libublox_msgs.so")
    endif()
  endif()
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/nvidia/olaf/src/ublox/ublox_msgs/include/" REGEX "/\\.svn$" EXCLUDE)
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/nvidia/olaf/build_isolated/ublox_msgs/gtest/cmake_install.cmake")

endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/home/nvidia/olaf/build_isolated/ublox_msgs/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
