#!/usr/bin/env bash
export ENABLE_CORE_DUMPS=true
source /mnt/toolchain/toolchain.sh
source /home/cmccabe/conf/hadoop-env.sh
cd /home/cmccabe
statestored
