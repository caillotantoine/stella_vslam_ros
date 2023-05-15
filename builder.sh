source /opt/ros/${ROS_DISTRO}/setup.bash
source /catkin_ws/devel/setup.bash
catkin_make -j10 \
    -DCMAKE_BUILD_TYPE=Debug \
    -DUSE_PANGOLIN_VIEWER=ON \
    -DUSE_SOCKET_PUBLISHER=OFF \
    -DUSE_STACK_TRACE_LOGGER=ON