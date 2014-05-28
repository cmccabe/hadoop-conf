#!/usr/bin/env bash

KILL_PARAMS="$@"

jps | while read line; do
    if [[ "$line" =~ sbt-launch.jar ]]; then
        : # do nothing
    elif [[ "$line" =~ Jps ]]; then
        : # do nothing
    else
        echo "kill ${KILL_PARAMS} ${line}"
        line=${line/ */}
        kill ${KILL_PARAMS} $line
    fi
done
