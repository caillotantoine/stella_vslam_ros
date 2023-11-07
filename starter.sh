source /opt/ros/${ROS_DISTRO}/setup.bash
source /catkin_ws/devel/setup.bash

echo NTM $1

rosrun stella_vslam_ros run_slam --vocab /stella_data/orb_vocab.fbow -c /stella_data/$1.yaml --mask /stella_data/mask_eva.png --eval-log
cd /catkin_ws/
mkdir -p /stella_data/output/
mv frame_trajectory.txt /stella_data/output/$1_$2.tum
cd /catkin_ws/
rm *.txt