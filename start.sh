#!/usr/bin/env bash

set -x

launchit() {
    name=$1
    shift
    env HADOOP_OPTS="-Dmy.hadoop.log.file=${name}.log" \
        /usr/sbin/daemonize \
            -p /data/11/cmccabe/pids/${name}.pid \
            -l /data/11/cmccabe/pids/${name}.pid \
            "${@}"
}

launch_htraced() {
    env HTRACED_CONF_DIR=/home/cmccabe/conf \
        /usr/sbin/daemonize \
            -p /data/11/cmccabe/pids/htraced.pid \
            -l /data/11/cmccabe/pids/htraced.pid \
            /home/cmccabe/htrace-htraced/src/go/build/htraced
}

if [ $IS_MASTER -ne 0 ]; then
    launchit namenode /home/cmccabe/sync/hadoop/bin/hadoop namenode
    launch_htraced
else
    launchit datanode /home/cmccabe/sync/hadoop/bin/hadoop datanode
fi
