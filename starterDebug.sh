source /opt/ros/${ROS_DISTRO}/setup.bash
source /catkin_ws/devel/setup.bash

rosrun --prefix 'gdb --args' stella_vslam_ros run_slam --vocab /stella_data/vocab/orb_vocab.fbow -c /stella_data/2023OmniCV/test.yaml --mask /stella_data/2023OmniCV/mask_eva.png --eval-log --map-db-out /stella_data/results/hainich.map --debug
