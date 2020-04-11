# opencr driver update

NEW_TERMINAL="gnome-terminal -e "

${NEW_TERMINAL} roscore

cd /home/nvidia/opencr_update
export OPENCR_PORT=/dev/ttyACM0
export OPENCR_MODEL=waffle
sudo ./update.sh ${OPENCR_PORT} ${OPENCR_MODEL}.opencr

export TURTLEBOT3_MODEL=waffle

echo "[ SLAM algorithm list ]"
echo ""
echo "  - 1. gmapping"
echo "  - 2. cartographer"
echo ""
echo -e "please choose number:"
read ALGORITHM
echo -e "wanna save map after slam? [y/N]:"
read ANSWER
if [ ${ANSWER} == "Y" ] || [ ${ANSWER} == "y" ]; then
  echo -e "enter save file path|name:"
  read SAVE_PATH
fi

# controller node
${NEW_TERMINAL} "roslaunch turtlebot3_bringup turtlebot3_robot.launch"
${NEW_TERMINAL} "rosrun turtlebot3_teleop turtlebot3_teleop_key"

if [ ${ALGORITHM} == "1" ] || [ ${ALGORITHM} == "gmapping" ]; then
  ${NEW_TERMINAL} "roslaunch turtlebot3_slam turtlebot3_slam.launch slam_methods:=gmapping"
  if [ ${ANSWER} == "Y" ] || [ ${ANSWER} == "y" ]; then
    ${NEW_TERMINAL} "rosrun map_server map_saver -f /home/nvidia/${SAVE_PATH}"
  fi
elif [ ${ALGORITHM} == "2" ] || [ ${ALGORITHM} == "cartographer" ]; then
  ${NEW_TERMINAL} "roslaunch turtlebot3_slam turtlebot3_slam.launch slam_methods:=cartographer"
  if [ ${ANSWER} == "Y" ] || [ ${ANSWER} == "y" ]; then
    ${NEW_TERMINAL} "rosrun map_server map_saver -f /home/nvidia/${SAVE_PATH}"
  fi
else
  echo "TYPING ERROR"
fi
