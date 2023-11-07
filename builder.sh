source /opt/ros/${ROS_DISTRO}/setup.bash
source /catkin_ws/devel/setup.bash
catkin_make -j4 \
    -DCMAKE_BUILD_TYPE=Debug \
    -DUSE_PANGOLIN_VIEWER=OFF \
    -DUSE_SOCKET_PUBLISHER=ON \
    -DUSE_STACK_TRACE_LOGGER=ON