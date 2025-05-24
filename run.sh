#!/bin/bash
[ "$ENV_DIR" == "" ] && export ENV_DIR=$HOME
[ ! -d "$ENV_DIR" ] && echo ENV_DIR DOES NOT EXIST && exit 1

echo ENV_DIR "$ENV_DIR"

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

runs_dir="$(find $script_dir/runs -mindepth 1 -maxdepth 1 -type f -executable)"

if [ "$1" != "" ]; then
    if [ "$1" == "ls" ]; then
        ls "$script_dir/runs"
    else
        . "$script_dir/runs/$1.sh"
    fi
else
    for s in $runs_dir; do
        echo running $s
        . "$s"
    done
fi
