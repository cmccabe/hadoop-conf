#!/bin/bash

B="/home/cmccabe/h/bin"

$B/hadoop datanode &> /data/11/cmccabe/logs/datanode.log &
$B/yarn nodemanager &> /data/11/cmccabe/logs/nodemanager.log &

disown
