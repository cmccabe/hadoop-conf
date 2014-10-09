#!/bin/bash

B="/home/cmccabe/h/bin"

LOG_DIR="/data/11/cmccabe/logs/"
$B/hadoop namenode &> "${LOG_DIR}/namenode.log" &
#$B/yarn resourcemanager &> "${LOG_DIR}/resource_manager.log" &
#/home/cmccabe/tachyon/bin/tachyon-start.sh master &
( cd /home/cmccabe/src/zipkin-1.1.0/ && ./bin/collector > "${LOG_DIR}/zipkin-collector.log" ) &
( cd /home/cmccabe/src/zipkin-1.1.0/ && ./bin/query > "${LOG_DIR}/zipkin-query.log" ) &
( cd /home/cmccabe/src/zipkin-1.1.0/ && ./bin/web > "${LOG_DIR}/zipkin-web.log" ) &

disown
