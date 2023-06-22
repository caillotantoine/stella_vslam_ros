source /opt/ros/${ROS_DISTRO}/setup.bash
source /catkin_ws/devel/setup.bash

rosrun --prefix 'gdb --args' stella_vslam_ros run_slam --vocab /stella_data/vocab/orb_vocab.fbow -c /stella_data/2023OmniCV/stella_config_front_0p5.yaml --mask /stella_data/2023OmniCV/mask_front_0p5.png --eval-log --map-db-out /stella_data/results/hainich.map --debug --cam-id 0
