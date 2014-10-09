#!/usr/bin/env bash

KILL_PARAMS="$@"

jps | while read line; do
    if [[ "$line" =~ sbt-launch.jar ]]; then
        : # Don't kill the sbt shell.
    elif [[ "$line" =~ Jps ]]; then
        : # Trying to kill our own jps process is not helpful.  Do nothing
    elif [[ "$line" =~ bootstrap.jar ]]; then
        : # mvnsh uses this name (for some reason)... do nothing.
    elif [[ "$line" =~ Launcher ]]; then
        : # skip ongoing maven invocations
    else
        echo "kill ${KILL_PARAMS} ${line}"
        line=${line/ */}
        kill ${KILL_PARAMS} $line
    fi
done
