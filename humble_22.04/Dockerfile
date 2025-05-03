FROM osrf/ros:humble-desktop-full

ENV NO_AT_BRIDGE=1
ENV DEBIAN_FRONTEND=noninteractive

# ----------------------------------------------------------------------------------------

RUN apt-get update && apt-get upgrade -y \
 && apt-get install -y \
    python3 python3-pip \
    build-essential \
    git \
    wget \
    curl \
    cmake \
    gedit \
    software-properties-common \
    ros-humble-librealsense2* \
    ros-humble-realsense2-* \
    ros-humble-rviz2 \
    ros-humble-topic-tools \
    ros-humble-gazebo-ros-pkgs \
 && rm -rf /var/lib/apt/lists/*
 
# ----------------------------------------------------------------------------------------

ENV WORKSPACE=/ros2_ws

RUN mkdir -p $WORKSPACE/src && \
    cd $WORKSPACE/src    
    
RUN echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc
RUN echo "alias gb='gedit ~/.bashrc'" >> ~/.bashrc
RUN echo "alias sb='source ~/.bashrc'" >> ~/.bashrc
RUN echo "alias rb='cd /ros2_ws && colcon build --cmake-args -DCMAKE_BUILD_TYPE=Release && source install/setup.bash'" >> ~/.bashrc
RUN apt-get update
# ----------------------------------------------------------------------------------------
    
SHELL ["/bin/bash", "-c"]
ENTRYPOINT ["/bin/bash", "-c", "source /opt/ros/humble/setup.bash && cd $WORKSPACE && colcon build && source $WORKSPACE/install/local_setup.bash && bash"]
