if("7b46e1d31a6b08b1c6da2a13e7b151a20446fa07" STREQUAL "")
  message(FATAL_ERROR "Tag for git checkout should not be empty.")
endif()

set(run 0)

if("/home/nvidia/olaf/build_isolated/cartographer_rviz/abseil/src/abseil-stamp/abseil-gitinfo.txt" IS_NEWER_THAN "/home/nvidia/olaf/build_isolated/cartographer_rviz/abseil/src/abseil-stamp/abseil-gitclone-lastrun.txt")
  set(run 1)
endif()

if(NOT run)
  message(STATUS "Avoiding repeated git clone, stamp file is up to date: '/home/nvidia/olaf/build_isolated/cartographer_rviz/abseil/src/abseil-stamp/abseil-gitclone-lastrun.txt'")
  return()
endif()

execute_process(
  COMMAND ${CMAKE_COMMAND} -E remove_directory "/home/nvidia/olaf/build_isolated/cartographer_rviz/abseil/src/abseil"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to remove directory: '/home/nvidia/olaf/build_isolated/cartographer_rviz/abseil/src/abseil'")
endif()

# try the clone 3 times incase there is an odd git clone issue
set(error_code 1)
set(number_of_tries 0)
while(error_code AND number_of_tries LESS 3)
  execute_process(
    COMMAND "/usr/bin/git" clone --origin "origin" "https://github.com/abseil/abseil-cpp.git" "abseil"
    WORKING_DIRECTORY "/home/nvidia/olaf/build_isolated/cartographer_rviz/abseil/src"
    RESULT_VARIABLE error_code
    )
  math(EXPR number_of_tries "${number_of_tries} + 1")
endwhile()
if(number_of_tries GREATER 1)
  message(STATUS "Had to git clone more than once:
          ${number_of_tries} times.")
endif()
if(error_code)
  message(FATAL_ERROR "Failed to clone repository: 'https://github.com/abseil/abseil-cpp.git'")
endif()

execute_process(
  COMMAND "/usr/bin/git" checkout 7b46e1d31a6b08b1c6da2a13e7b151a20446fa07
  WORKING_DIRECTORY "/home/nvidia/olaf/build_isolated/cartographer_rviz/abseil/src/abseil"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to checkout tag: '7b46e1d31a6b08b1c6da2a13e7b151a20446fa07'")
endif()

execute_process(
  COMMAND "/usr/bin/git" submodule init 
  WORKING_DIRECTORY "/home/nvidia/olaf/build_isolated/cartographer_rviz/abseil/src/abseil"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to init submodules in: '/home/nvidia/olaf/build_isolated/cartographer_rviz/abseil/src/abseil'")
endif()

execute_process(
  COMMAND "/usr/bin/git" submodule update --recursive 
  WORKING_DIRECTORY "/home/nvidia/olaf/build_isolated/cartographer_rviz/abseil/src/abseil"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to update submodules in: '/home/nvidia/olaf/build_isolated/cartographer_rviz/abseil/src/abseil'")
endif()

# Complete success, update the script-last-run stamp file:
#
execute_process(
  COMMAND ${CMAKE_COMMAND} -E copy
    "/home/nvidia/olaf/build_isolated/cartographer_rviz/abseil/src/abseil-stamp/abseil-gitinfo.txt"
    "/home/nvidia/olaf/build_isolated/cartographer_rviz/abseil/src/abseil-stamp/abseil-gitclone-lastrun.txt"
  WORKING_DIRECTORY "/home/nvidia/olaf/build_isolated/cartographer_rviz/abseil/src/abseil"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to copy script-last-run stamp file: '/home/nvidia/olaf/build_isolated/cartographer_rviz/abseil/src/abseil-stamp/abseil-gitclone-lastrun.txt'")
endif()

