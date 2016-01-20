#!/usr/bin/env bash

set -ex

# Build htrace.
# This will also install its build products to ~/.m2 so that
# hadoop-buildall.sh can find them.
mvn install -DskipTests -Dmaven.javadoc.skip=true
rm -rf ~/sync/htrace
mkdir -p ~/sync/htrace

# Copy golang binaries to ~/sync/htrace
cp ./htrace-htraced/go/build/htracedTool ~/sync/htrace/htracedTool
cp ./htrace-htraced/go/build/htraced ~/sync/htrace/htraced

# Copy web files to ~/sync/htrace/webapp so that htraced can find them
rsync -avi ./htrace-webapp/src/main/webapp/ ~/sync/htrace/webapp
