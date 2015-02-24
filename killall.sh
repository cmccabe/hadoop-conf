#!/usr/bin/env bash

set -x
killall -q "$@" java
killall -q "$@" htraced
