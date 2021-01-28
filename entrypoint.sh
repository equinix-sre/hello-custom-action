#!/bin/bash

set -e -u -o pipefail

cd $GITHUB_WORKSPACE

echo "Running: $*"
sh -c "$*"

time=$(date)
echo "::set-output name=time::$time"