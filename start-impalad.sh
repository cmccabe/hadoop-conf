#!/usr/bin/env bash
export ENABLE_CORE_DUMPS=true
source /mnt/toolchain/toolchain.sh
source /home/cmccabe/conf/hadoop-env.sh
cd /home/cmccabe
impalad -state_store_host=a2412.halxg.cloudera.com -hostname=a2412.halxg.cloudera.com
