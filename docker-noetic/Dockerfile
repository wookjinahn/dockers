FROM osrf/ros:noetic-desktop-full

ENV NO_AT_BRIDGE=1
ENV DEBIAN_FRONTEND=noninteractive

SHELL ["/bin/bash", "-c"]

RUN apt-get update && apt-get upgrade -y \
 && apt-get install -y \
    build-essential \
    git \
    wget \
    curl \
    cmake \
    gedit \
    software-properties-common \
    ros-noetic-rviz \
    ros-noetic-rqt \
    ros-noetic-rqt-common-plugins \
    python3-wstool \
    python3-catkin-tools \
    ros-noetic-topic-tools \
    ros-noetic-cmake-modules \
    protobuf-compiler \ 
    autoconf \
    rsync \ 
    libtool \
    ros-noetic-librealsense2* \
    ros-noetic-realsense2-* \
 && rm -rf /var/lib/apt/lists/*

ENV WORKSPACE=/catkin_ws/src

RUN mkdir -p $WORKSPACE

WORKDIR $WORKSPACE

RUN echo " " >> ~/.bashrc
RUN echo " " >> ~/.bashrc
RUN echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc

# catkin config
RUN /bin/bash -c "source /opt/ros/noetic/setup.bash && catkin init \
    && catkin config --extend /opt/ros/noetic \
    && catkin config --cmake-args -DCMAKE_BUILD_TYPE=Release \
    && catkin config --merge-devel"

# voxblox
RUN /bin/bash -c "git clone https://github.com/ethz-asl/voxblox.git \
    && wstool init . ./voxblox/voxblox_https.rosinstall \
    && wstool update"

# catkin build
RUN . /opt/ros/noetic/setup.sh && cd /catkin_ws && catkin build
RUN echo "source /catkin_ws/devel/setup.bash" >> ~/.bashrc
RUN echo " " >> ~/.bashrc
RUN echo " " >> ~/.bashrc

ENTRYPOINT ["bash", "-c", "source ~/.bashrc && bash"]

