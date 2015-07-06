#!/usr/bin/env bash

#
# Generate high disk load on a cluster node.
# This script also handles daemonization.
#

die() {
    echo $@
    exit 1
}

# Kill all the child processes we forked earlier by killing everything in our
# process group.  We run the "kill" in a new session to avoid having it kill
# itself before it finishes shutting down everything.
kill_forked() {
    PGID=$(ps -o pgid= $$ | grep -o [0-9]*)
    setsid kill -- -"${PGID}"
    exit 0
}

# Run the Linux "stress" tool on all disks.
# This will generate a high I/O load.
run_stress() {
    DIRS="/data/1/cmccabe \
/data/2/cmccabe \
/data/3/cmccabe \
/data/4/cmccabe \
/data/5/cmccabe \
/data/6/cmccabe \
/data/7/cmccabe  \
/data/8/cmccabe  \
/data/9/cmccabe  \
/data/10/cmccabe \
/data/11/cmccabe"
    for D in ${DIRS}; do
        (cd "${D}"; stress -d 40) &
    done
    trap kill_forked SIGINT SIGTERM
    wait
    exit 0
}

which stress &>/dev/null || die "You must install the 'stress' tool."
which daemonize &>/dev/null || die "You must install the 'daemonize' tool."
SCRIPT_PATH=$(cd `dirname "${BASH_SOURCE[0]}"` && pwd)/`basename "${BASH_SOURCE[0]}"`
PIDFILE="/data/11/cmccabe/pids/high-disk-load.pid"
OPERATION=$1
case "${OPERATION}" in
    run) run_stress;;
    start) /usr/sbin/daemonize -p "${PIDFILE}" -l "${PIDFILE}" \
                "${SCRIPT_PATH}" run;;
    stop) if [ -e "${PIDFILE}" ]; then
            kill `cat "${PIDFILE}"`
            rm -f "${PIDFILE}"
        else
            echo "no PID file found."
            exit 0
        fi;;
    *) die "${0}: You must specify an operation: start, stop, status"
esac
