FROM osrf/ros:melodic-desktop-full

ENV NO_AT_BRIDGE=1
ENV DEBIAN_FRONTEND=noninteractive

SHELL ["/bin/bash", "-c"]

RUN apt-get update && apt-get upgrade -y \ 
 && apt-get install -y \ 
    build-essential \ 
    gdb \
    git \ 
    wget \ 
    curl \ 
    cmake \ 
    gedit \ 
    software-properties-common \ 
    ros-melodic-rviz \ 
    ros-melodic-rqt \ 
    ros-melodic-rqt-common-plugins \ 
    python3-wstool \ 
    python3-catkin-tools \ 
    ros-melodic-topic-tools \ 
    ros-melodic-cmake-modules \ 
    protobuf-compiler \ 
    autoconf \ 
    rsync \ 
    libtool \ 
    ros-melodic-librealsense2* \ 
    ros-melodic-realsense2-* \ 
    mesa-utils \
    libgl1-mesa-glx \
    libgl1-mesa-dri \
    x11-apps \
 && rm -rf /var/lib/apt/lists/*

ENV WORKSPACE=/catkin_ws/src

RUN mkdir -p $WORKSPACE

WORKDIR $WORKSPACE

RUN echo " " >> ~/.bashrc
RUN echo " " >> ~/.bashrc
RUN echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc

# catkin config
RUN /bin/bash -c "source /opt/ros/melodic/setup.bash && catkin init \
    && catkin config --extend /opt/ros/melodic \
    && catkin config --cmake-args -DCMAKE_BUILD_TYPE=Release \
    && catkin config --merge-devel"

# catkin build
RUN . /opt/ros/melodic/setup.sh && cd /catkin_ws && catkin build
RUN echo "source /catkin_ws/devel/setup.bash" >> ~/.bashrc
RUN echo " " >> ~/.bashrc
RUN echo " " >> ~/.bashrc

ENTRYPOINT ["bash", "-c", "source ~/.bashrc && bash"]

