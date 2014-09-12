#!/usr/bin/env bash

die() {
    echo $@
    exit 1
}

# Native library stuff
export JAVA_LIBRARY_PATH="/home/cmccabe/h/lib/native/:/home/cmccabe/extra-native:"
export SPARK_SUBMIT_LIBRARY_PATH="$JAVA_LIBRARY_PATH"
export SPARK_SUBMIT_CLASSPATH="$JAVA_LIBRARY_PATH"
export HADOOP_HOME="/home/cmccabe/h"
#export LD_LIBRARY_PATH="$JAVA_LIBRARY_PATH"
#export HADOOP_COMMON_LIB_NATIVE_DIR="/home/cmccabe/h/lib/native"
#export HADOOP_OPTS="-Djava.library.path=$HADOOP_COMMON_LIB_NATIVE_DIR"

# For the spark-on-YARN build
#export SPARK_HADOOP_VERSION="2.3.0-cdh5.1.0-SNAPSHOT" # "3.0.0-SNAPSHOT"
#export SPARK_HADOOP_VERSION="2.3.0-cdh5.0.0" # "3.0.0-SNAPSHOT"
#export SPARK_YARN=true

#export SPARK_JAVA_OPTS="-Pyarn.resourcemanager.scheduler.address=a2402.halxg.cloudera.com:9095 -Pjava.library.path=/home/cmccabe/h/lib/native/"

# Add Tachyon jar to SPARK_CLASSPATH
#TACHYON_JAR=( ~/tachyon/main/target/tachyon-*-jar-with-dependencies.jar )
#[ -f $TACHYON_JAR ] || echo "can't find tachyon jar.  Tried $TACHYON_JAR" 1>&2
#TACHYON_JAR=${TACHYON_JAR[0]}
#export SPARK_CLASSPATH="$TACHYON_JAR:$SPARK_CLASSPATH"

#export SPARK_EXECUTOR_MEMORY=12288M
#export SPARK_DRIVER_MEMORY=12288M
export TACHYON_JAVA_OPTS="-Dtachyon.worker.memory.size=512MB"
#export SPARK_YARN_USER_ENV="LD_LIBRARY_PATH=/home/cmccabe/h/lib/native"

# Make Tachyon accessible to Hadoop.
export HADOOP_CLASSPATH="$TACHYON_JAR:$HADOOP_CLASSPATH"

#-Dtachyon.worker.data.folder=
