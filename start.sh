#!/usr/bin/env bash

set -x

launchit() {
    name=$1
    shift
    env HADOOP_OPTS="-Dmy.hadoop.log.file=${name}.log" \
        YARN_OPTS="-Dmy.hadoop.log.file=${name}.log" \
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
            /home/cmccabe/htrace/htrace-htraced/go/build/htraced
}

launch_dn() {
    name=$1
    shift
    env HADOOP_OPTS="-Dmy.hadoop.log.file=datanode${name}.log" \
        HADOOP_CONF_DIR="/home/cmccabe/conf/dn${name}" \
        /usr/sbin/daemonize \
            -p /data/11/cmccabe/pids/${name}.pid \
            -l /data/11/cmccabe/pids/${name}.pid \
            /home/cmccabe/sync/hadoop/bin/hadoop datanode
}

# YARN won't log to /data/11/cmccabe/logs, but instead always wants to log in /home/cmccabe/sync/hadoop/logs 
[ -e /home/cmccabe/sync/hadoop/logs ] || ln -s /data/11/cmccabe/logs /home/cmccabe/sync/hadoop/logs

if [ $IS_MASTER -ne 0 ]; then
    launchit namenode /home/cmccabe/sync/hadoop/bin/hadoop namenode
    launchit resourcemanager /home/cmccabe/sync/hadoop/bin/yarn resourcemanager
    launch_htraced
else
    launch_dn A
    launch_dn B
    launch_dn C
    launch_dn D
    launch_dn E
    launch_dn F
    launch_dn G
    launch_dn H
    launch_dn I
    launchit nodemanager /home/cmccabe/sync/hadoop/bin/yarn nodemanager
fi
