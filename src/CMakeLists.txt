if(USE_PANGOLIN_VIEWER)
    message(STATUS "Viewer for examples: pangolin viewer")
elseif(USE_SOCKET_PUBLISHER)
    message(STATUS "Viewer for examples: socket publisher")
else()
    message(STATUS "Viewer for examples: none")
endif()

set(EXECUTABLE_TARGETS "")

include_directories(${CMAKE_CURRENT_SOURCE_DIR})
add_executable(run_slam run_slam.cc stella_vslam_ros.cc)
list(APPEND EXECUTABLE_TARGETS run_slam)

foreach(EXECUTABLE_TARGET IN LISTS EXECUTABLE_TARGETS)
    # pangolin_viewer is used on a priority basis
    if(USE_PANGOLIN_VIEWER)
        # set macro flag
        target_compile_definitions(${EXECUTABLE_TARGET}
                PRIVATE -DUSE_PANGOLIN_VIEWER)
        # link viewer
        target_link_libraries(${EXECUTABLE_TARGET} PRIVATE
                ${Pangolin_Viewer_LIB} ${Pangolin_LIBRARIES})
    elseif(USE_SOCKET_PUBLISHER)
        # set macro flag
        target_compile_definitions(${EXECUTABLE_TARGET}
                PRIVATE -DUSE_SOCKET_PUBLISHER)
        # link viewer
        target_link_libraries(${EXECUTABLE_TARGET} PRIVATE
                ${Socket_Publisher_LIB} ${SIOCLIENT_LIBRARY} ${PROTOBUF_LIBRARIES})
    endif()

    # setup stack trace logger
    if(USE_STACK_TRACE_LOGGER)
        target_compile_definitions(${EXECUTABLE_TARGET}
                PRIVATE -DUSE_STACK_TRACE_LOGGER)
        target_link_libraries(${EXECUTABLE_TARGET} PRIVATE
                ${GLOG_LIBRARIES})
    endif()

    # setup google-perftools
    if(USE_GOOGLE_PERFTOOLS)
        target_compile_definitions(${EXECUTABLE_TARGET}
                PRIVATE -DUSE_GOOGLE_PERFTOOLS)
        target_link_libraries(${EXECUTABLE_TARGET} PRIVATE
                ${GPERFTOOLS_LIBRARIES})
    endif()

    # setup yaml-cpp
    target_link_libraries(${EXECUTABLE_TARGET} PRIVATE
        yaml-cpp)

    # build
    target_include_directories(${EXECUTABLE_TARGET}
                               PRIVATE ${rclcpp_INCLUDE_DIRS} ${OpenCV_INCLUDE_DIRS})
    target_link_libraries(${EXECUTABLE_TARGET}
                          PRIVATE ${stella_vslam_LIBS} ${rclcpp_LIBRARIES} ${OpenCV_LIBRARIES})
    ament_target_dependencies(${EXECUTABLE_TARGET}
                              PUBLIC
                              rclcpp
                              cv_bridge
                              image_transport
                              message_filters
                              rcutils
                              geometry_msgs
                              nav_msgs
                              sensor_msgs
                              tf2
                              tf2_eigen
                              tf2_geometry_msgs
                              tf2_msgs
                              tf2_ros)
    install(TARGETS ${EXECUTABLE_TARGET}
            DESTINATION lib/${PROJECT_NAME})

endforeach()
