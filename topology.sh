#!/usr/bin/env bash

while [ $# -gt 0 ]; do
    case $1 in
        127.0.0.1)          LOC="/dc1/rack1";;
        localhost)          LOC="/dc1/rack1";;
        keter)              LOC="/dc1/rack1";;
        *)                  LOC="/dc1/default";;
    esac
    echo -n "$LOC "
    shift
done
