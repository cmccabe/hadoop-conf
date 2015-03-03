#!/usr/bin/env bash

jps
HTRACED_PID=`/sbin/pidof htraced`
[ $? -eq 0 ] && echo "$HTRACED_PID htraced"
