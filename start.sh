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
            /home/cmccabe/cdh/repos/cdh5/htrace/htrace-htraced/go/build/htraced
}

# YARN won't log to /data/11/cmccabe/logs, but instead always wants to log in /home/cmccabe/sync/hadoop/logs 
[ -e /home/cmccabe/sync/hadoop/logs ] || ln -s /data/11/cmccabe/logs /home/cmccabe/sync/hadoop/logs

if [ $IS_MASTER -ne 0 ]; then
    launchit namenode /home/cmccabe/sync/hadoop/bin/hadoop namenode
    launchit resourcemanager /home/cmccabe/sync/hadoop/bin/yarn resourcemanager
else
    launchit datanode /home/cmccabe/sync/hadoop/bin/hadoop datanode
    launchit nodemanager /home/cmccabe/sync/hadoop/bin/yarn nodemanager
fi

if [[ `hostname` =~ a2404 ]]; then
    launch_htraced
fi
