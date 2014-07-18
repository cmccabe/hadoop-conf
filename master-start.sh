#!/bin/bash

B="/home/cmccabe/h/bin"

LOG_DIR="/data/11/cmccabe/logs/"
$B/hadoop namenode &> "${LOG_DIR}/namenode.log" &
$B/yarn resourcemanager &> "${LOG_DIR}/resource_manager.log" &
#/home/cmccabe/tachyon/bin/tachyon-start.sh master &

disown
