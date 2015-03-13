#!/usr/bin/env bash

jps | while read LINE; do
    ID=`echo $LINE | awk '{print $1}'`
    NAME=`echo $LINE | awk '{print $2}'`
    #echo "$ID = $NAME"
    case $NAME in
        bootstrap.jar) ;;
        Jps) ;;
        *) kill $ID ;;
    esac
done
killall -q "$@" htraced
