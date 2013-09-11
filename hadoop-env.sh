# Set Hadoop-specific environment variables here.

die() {
    echo $@
    exit 1
}
[ "x$BASH_VERSION" != "x" ] || die "you must source this script in bash"
export HADOOP_CONF_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
export YARN_CONF_DIR="${HADOOP_CONF_DIR}"

# Set JAVA_HOME if it isn't already defined.
export JAVA_HOME="${JAVA_HOME-/usr/java/jdk1.6.0_29}"

# Extra Java CLASSPATH elements.  Optional.
# export HADOOP_CLASSPATH="<extra_entries>:$HADOOP_CLASSPATH"

# The maximum amount of heap to use, in MB. Default is 1000.
# export HADOOP_HEAPSIZE=2000

# Extra Java runtime options.  Empty by default.
# if [ "$HADOOP_OPTS" == "" ]; then export HADOOP_OPTS=-server; else HADOOP_OPTS+=" -server"; fi

# Command specific options appended to HADOOP_OPTS when specified
export HADOOP_NAMENODE_OPTS="-Dcom.sun.management.jmxremote $HADOOP_NAMENODE_OPTS"
export HADOOP_SECONDARYNAMENODE_OPTS="-Dcom.sun.management.jmxremote $HADOOP_SECONDARYNAMENODE_OPTS"
export HADOOP_DATANODE_OPTS="-Dcom.sun.management.jmxremote $HADOOP_DATANODE_OPTS"
export HADOOP_BALANCER_OPTS="-Dcom.sun.management.jmxremote $HADOOP_BALANCER_OPTS"
export HADOOP_JOBTRACKER_OPTS="-Dcom.sun.management.jmxremote $HADOOP_JOBTRACKER_OPTS"
# export HADOOP_TASKTRACKER_OPTS=
# The following applies to multiple commands (fs, dfs, fsck, distcp etc)
# export HADOOP_CLIENT_OPTS

# Extra ssh options.  Empty by default.
# export HADOOP_SSH_OPTS="-o ConnectTimeout=1 -o SendEnv=HADOOP_CONF_DIR"

export HADOOP_RUN="/home/cmccabe/r"
export HADOOP_HOME_BASE="/home/cmccabe/h"
#export HADOOP_HDFS_HOME="${HADOOP_HOME_BASE}"

# Where log files are stored.  $HADOOP_HOME_BASE/logs by default.
export HADOOP_LOG_DIR="${HADOOP_RUN}/logs"

# File naming remote slave hosts.  $HADOOP_HOME_BASE/conf/slaves by default.
#export HADOOP_SLAVES="${HADOOP_CONF_DIR}/slaves"

# host:path where hadoop code should be rsync'd from.  Unset by default.
# export HADOOP_MASTER=master:/home/$USER/src/hadoop

# Seconds to sleep between slave commands.  Unset by default.  This
# can be useful in large clusters, where, e.g., slave rsyncs can
# otherwise arrive faster than the master can service them.
# export HADOOP_SLAVE_SLEEP=0.1

# The directory where pid files are stored. /tmp by default.
export HADOOP_PID_DIR="${HADOOP_RUN}/pids"

# A string representing this instance of hadoop. $USER by default.
# export HADOOP_IDENT_STRING=$USER

# The scheduling priority for daemon processes.  See 'man nice'.
# export HADOOP_NICENESS=10

# disable security stuff
export HADOOP_SECURE_DN_PID_DIR=""
export HADOOP_SECURE_DN_LOG_DIR=""
export HADOOP_SECURE_DN_USER=""
export HIVE_HOME="/home/cmccabe/hive"
export HADOOP_HOME="${HADOOP_HOME_BASE}"
source /home/cmccabe/conf/nodes.sh
