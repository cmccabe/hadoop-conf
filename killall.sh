#!/usr/bin/env bash

set -xe
killall "$@" java
killall "$@" htraced
