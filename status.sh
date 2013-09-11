#!/usr/bin/env bash

ps aux | while read line; do
    if [[ $line =~ .*impalad.* ]]; then
        echo $line
    elif [[ $line =~ .*statestored.* ]]; then
        echo $line
    elif [[ $line =~ .*java.* ]]; then
        echo $line
    fi
done
