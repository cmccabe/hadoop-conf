#!/usr/bin/env bash

#
# A script to rebuild Hadoop with HTrace support.
#
# It will:
# * Rebuild hadoop
# * Copy hadoop's files to ~/sync/hadoop
# * Copy htrace's files to ~/sync/hadoop so that they are always on the Hadoop CLASSPATH
# * Copy the ~/sync and ~/conf directories to all build hosts
#
# Before running this script, you should build htrace with ~/conf/htrace-buildall.sh
#

die() {
    echo $@
    exit 1
}

set -ex
HTRACE_VERSION="4.0.1-cdh5_1.0.1"

# Build hadoop
time mvn package -Drequire.fuse \
    -Pnative -Pdist -Dtar -DskipTests -Drequire.openssl -Dmaven.javadoc.skip=true

# Install hadoop tar
rm -rf ~/sync/hadoop
mkdir -p ~/sync/hadoop
res=./hadoop-dist/target/hadoop-*.tar.gz
if [ -f ${res} ]; then
    :
elif [ -f "../../${res}" ]; then
    res="../../${res}"
else
    die "can't find tar"
tar xvzf ${res} --strip-components=1 -C ~/sync/hadoop

# Install HTrace jars
cat << EOF | xargs -n 1 cp /home/cmccabe/.m2/repository/org/apache/htrace/htrace-htraced/$HTRACE_VERSION/htrace-htraced-$HTRACE_VERSION.jar
/home/cmccabe/sync/hadoop/share/hadoop/hdfs/lib/htrace-htraced-$HTRACE_VERSION.jar
/home/cmccabe/sync/hadoop/share/hadoop/tools/lib/htrace-htraced-$HTRACE_VERSION.jar
/home/cmccabe/sync/hadoop/share/hadoop/common/lib/htrace-htraced-$HTRACE_VERSION.jar
EOF
