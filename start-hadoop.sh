#!/bin/bash

# start ssh server
/etc/init.d/ssh start

export HDFS_NAMENODE_USER="root"
export HDFS_DATANODE_USER="root"
export HDFS_SECONDARYNAMENODE_USER="root"
export YARN_RESOURCEMANAGER_USER="root"
export YARN_NODEMANAGER_USER="root"

# format namenode
$HADOOP_HOME/bin/hdfs namenode -format

# start hadoop
$HADOOP_HOME/sbin/stop-all.sh

# start hadoop
$HADOOP_HOME/sbin/start-all.sh
$HADOOP_HOME/sbin/start-yarn.sh

echo -e "All nodes started successfully\n\n"

# keep container running
tail -f /dev/null