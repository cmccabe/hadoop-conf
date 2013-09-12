#!/usr/bin/env bash
hostname=`hostname`

H="/home/cmccabe/h"
L="/home/cmccabe/r/logs"
MASTER="a2412.halxg.cloudera.com"
HOSTNAME=`hostname`

export ENABLE_CORE_DUMPS=true
source /mnt/toolchain/toolchain.sh
source /home/cmccabe/conf/hadoop-env.sh
export LIBHDFS_OPTS="-Xcheck:jni -Xcheck:nabounds"

cd /home/cmccabe
if [ "x$HOSTNAME" == "x${MASTER}" ]; then
    echo "starting master services..."
    /home/cmccabe/h/bin/hadoop namenode &> "${L}/namenode.log" &
    bash -c "sleep 1; impalad -state_store_host=${MASTER} -hostname=${HOSTNAME} -logtostderr &> ${L}/impalad.log &" &
    statestored -logtostderr &> "${L}/statestored.log" &
else
    echo "starting slave services..."
    /home/cmccabe/h/bin/hadoop datanode &> "${L}/datanode.log" &
    impalad -state_store_host=${MASTER} -hostname=${HOSTNAME} -logtostderr &> "${L}/impalad.log" &
    bash -c "sleep 1; impalad -state_store_host=${MASTER} -hostname=${HOSTNAME} -logtostderr &> ${L}/impalad.log &" &
fi
echo "ready"
disown -a
