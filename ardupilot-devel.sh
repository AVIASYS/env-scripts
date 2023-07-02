```
NOTES:
1. The script is not complete
2. Change the PATH variable under Ardupilot Gazebo Plugin (Section 3.2)
```
# 1. Set configuration

# 1.1. Set Variables
WORKSPACE = ~ # Set path to workspace

# 1.2. Load initial configuration
cd $WORKSPACE

# 2. Packages

ROS="ros-humble-desktop ros-dev-tools"
ROS_GAZEBO_PLUGIN="ros-humble-ros-gz"
ROS_MAVROS="ros-humble-mavros ros-humble-mavros-extras"

# 3. Dependencies

ARDUPILOT_GAZEBO_PLUGIN_BUILD_DEPS="libgz-sim7-dev rapidjson-dev"
#ARDUPILOT_BUILD_DEPS=In the provided script (Make, GCC, GCC-ARM Cross Compiler, CCache)/In the Wiki
#QGROUNDCONTROL_DEPS=In the QGC Wiki

# 4. Building and Configuring

#ARDUPILOT_ENVRIONMENT=In the provided script/In the Wiki
#PYMAVLINK=In the provided script
#MAVPROXY=In the provided script

# 4.1. ARDUPILOT_GAZEBO_PLUGIN_BUILD:

mkdir -p gz_ws/src && cd gz_ws/src
git clone https://github.com/ArduPilot/ardupilot_gazebo
cd ardupilot_gazebo
mkdir build && cd build
cmake .. -DCMAKE_BUILD_TYPE=RelWithDebInfo
make -j4

# 4.2. ARDUPILOT_GAZEBO_PLUGIN_ENVIRONMENT:

echo 'export GZ_SIM_SYSTEM_PLUGIN_PATH=$HOME/gz_ws/src/ardupilot_gazebo/build:${GZ_SIM_SYSTEM_PLUGIN_PATH}' >> ~/.bashrc
echo 'export GZ_SIM_RESOURCE_PATH=$HOME/gz_ws/src/ardupilot_gazebo/models:$HOME/gz_ws/src/ardupilot_gazebo/worlds:${GZ_SIM_RESOURCE_PATH}' >> ~/.bashrc
