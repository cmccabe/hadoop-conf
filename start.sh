#!/bin/bash

P="`dirname $0`"
if [[ `hostname` == "a2402.halxg.cloudera.com" ]]; then
    echo "running master daemons"
    exec $P/master-start.sh
else
    echo "running slave daemons"
    exec $P/slave-start.sh
fi
