#!/usr/bin/env bash

set -xe
nohup hadoop namenode &
nohup /home/cmccabe/htrace/htrace-core/src/go/build/htraced &
disown
