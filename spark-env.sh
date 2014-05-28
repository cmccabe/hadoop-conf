#!/usr/bin/env bash

die() {
    echo $@
    exit 1
}

# Add Tachyon jar to SPARK_CLASSPATH
TACHYON_JAR=( ~/tachyon/main/target/tachyon-*-jar-with-dependencies.jar )
[ -f $TACHYON_JAR ] || echo "can't find tachyon jar.  Tried $TACHYON_JAR"
TACHYON_JAR=${TACHYON_JAR[0]}
export SPARK_CLASSPATH="$TACHYON_JAR:$SPARK_CLASSPATH"

export SPARK_EXECUTOR_MEMORY=30720
export SPARK_DRIVER_MEMORY=30720
