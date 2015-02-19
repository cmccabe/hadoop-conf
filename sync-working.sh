#!/usr/bin/env bash

echo "syncing master to slaves..."

set -x
set -e

for s in $SLAVES; do
    rsync -avi --delete-after /home/cmccabe/cmccabe-hbin/ ${s}:/home/cmccabe/cmccabe-hbin
    rsync -avi --delete-after /home/cmccabe/cmccabe-bin/ ${s}:/home/cmccabe/cmccabe-bin
    rsync -avi --delete-after /home/cmccabe/cmccabe-etc/ ${s}:/home/cmccabe/cmccabe-etc
done

echo "*** done"
