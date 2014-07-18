#!/bin/bash

if [[ `hostname` != "a2402.halxg.cloudera.com" ]]; then
    rsync --delete -avi a2402.halxg.cloudera.com:~/.bashrc-local ~/.bashrc-local 
    rsync --delete -avi a2402.halxg.cloudera.com:~/h/ ~/h/
    rsync --delete -avi --exclude logs a2402.halxg.cloudera.com:~/tachyon/ ~/tachyon/
    rsync --delete -avi a2402.halxg.cloudera.com:~/extra-native/ ~/extra-native/

    # This last one might replace this very script.
    rsync --delete -avi a2402.halxg.cloudera.com:~/conf/ ~/conf 
fi
