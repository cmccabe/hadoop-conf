#!/usr/bin/env bash

echo "syncing master to slaves..."

set -x
set -e

for s in $SLAVES; do
    rsync -avi --delete-after /home/cmccabe/conf/ ${s}:/home/cmccabe/conf
    rsync -avi --delete-after /home/cmccabe/sync/ ${s}:/home/cmccabe/sync
done

echo "*** done"
