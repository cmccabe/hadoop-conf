#!/usr/bin/env bash

die() {
    echo "${@}"
    exit 1
}

[ $# -lt 1 ] && die "you must supply at least one argument: the (java) name of the process to kill."

TARGET="${1}"
shift
KILL_PARAMS="$@"

jps | while read line; do
    name=$line
    name=${name/* /}
    if [[ "$name" == ${TARGET} ]]; then
        echo "kill ${KILL_PARAMS} ${line}"
        line=${line/ */}
        kill ${KILL_PARAMS} $line
    fi
done
