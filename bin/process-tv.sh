#!/usr/bin/env bash

install_dir=/opt/tv-processor
entry=${install_dir}/entries

if [ $# -eq 1 ]; then
    input=$1
    node ${entry}/start.js ${input}
else
    echo "No arguments supplied"
fi

