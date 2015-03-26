#!/usr/bin/env bash

for block in "$@"; do
    echo -n "$block: "
    for h in $SLAVES; do ssh -A $h 'find /data/*/cmccabe/dn -name '$block' -exec id.sh -n {} \;'; done
    echo ""
done
