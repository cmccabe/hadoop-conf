#!/usr/bin/env bash

if [ "x$1" == "x-n" ]; then
    echo -n `hostname` " "
else
    echo "****" `hostname` "****"
fi
