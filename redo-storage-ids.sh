#!/usr/bin/env bash

for DATADIR in /data/*/cmccabe/dn
do 
    echo $DATADIR
    VERSIONFILE=$DATADIR/current/VERSION
    STID=$RANDOM$RANDOM$RANDOM
    cp -f $VERSIONFILE $VERSIONFILE.bak
    echo "New storageID for $VERSIONFILE is DS-$STID"
    sed "s/storageID.*/storageID=DS-$STID/" $VERSIONFILE.bak > $VERSIONFILE
done

