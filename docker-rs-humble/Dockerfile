FROM osrf/ros:humble-desktop-full

ENV NO_AT_BRIDGE=1
ENV DEBIAN_FRONTEND=noninteractive

# ----------------------------------------------------------------------------------------

RUN apt-get update && apt-get upgrade -y \
 && apt-get install -y \
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
 && rm -rf /var/lib/apt/lists/*
 
# ----------------------------------------------------------------------------------------

ENV WORKSPACE /ros2_ws

RUN mkdir -p $WORKSPACE/src && \
    cd $WORKSPACE/src    
    
RUN echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc
    
# ----------------------------------------------------------------------------------------
    
SHELL ["/bin/bash", "-c"]
ENTRYPOINT ["/bin/bash", "-c", "source /opt/ros/humble/setup.bash && cd $WORKSPACE && colcon build && source $WORKSPACE/install/local_setup.bash && bash"]
