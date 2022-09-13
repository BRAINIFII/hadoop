FROM ubuntu:22.04

# RUN adduser --system --group --no-create-home hadoop
# RUN usermod -aG sudo hadoop

# set environment vars
ENV HADOOP_HOME /opt/hadoop
ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64

# install packages
RUN \
  apt-get update && apt-get install -y \
  ssh \
  rsync \
  vim \
  default-jdk \
  nano

# download and extract hadoop, set JAVA_HOME in hadoop-env.sh, update path
RUN \
  wget https://dlcdn.apache.org/hadoop/common/hadoop-3.3.4/hadoop-3.3.4.tar.gz && \
  tar -xzf hadoop-3.3.4.tar.gz && \
  mv hadoop-3.3.4 $HADOOP_HOME && \
  echo "export JAVA_HOME=$JAVA_HOME" >> $HADOOP_HOME/etc/hadoop/hadoop-env.sh && \
  echo "PATH=$PATH:$HADOOP_HOME/bin" >> ~/.bashrc

# create ssh keys
RUN \
  ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa && \
  cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys && \
  chmod 0600 ~/.ssh/authorized_keys

# copy hadoop configs
ADD configs/*xml $HADOOP_HOME/etc/hadoop/

# copy ssh config
ADD configs/ssh_config /root/.ssh/config

# copy script to start hadoop
ADD start-hadoop.sh start-hadoop.sh

# expose various ports
EXPOSE 9870 8088 8032 50070 50075 50030 50060

# start hadoop
# RUN chmod +x start-hadoop.sh

# USER hadoop
CMD bash start-hadoop.sh