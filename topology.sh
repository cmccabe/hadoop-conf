#!/usr/bin/env bash

while [ $# -gt 0 ]; do
    case $1 in
        127.0.0.1)          LOC="/rack1";;
        localhost)          LOC="/rack1";;
        keter)              LOC="/rack1";;
        haus02)                 LOC="/rack2";;
        haus02.sf.cloudera.com) LOC="/rack2";;
        *)                  LOC="/default";;
    esac
    echo -n "$LOC "
    shift
done
