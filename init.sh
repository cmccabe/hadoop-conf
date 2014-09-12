#!/bin/bash -x -e

# Drop mystery packets from a2424
sudo iptables -A INPUT -s 10.20.212.32 -j DROP

# Shut down other services
sudo service cloudera-scm-server stop 
sudo service cloudera-scm-agent stop
killall java python
sleep 3
killall -9 java python
