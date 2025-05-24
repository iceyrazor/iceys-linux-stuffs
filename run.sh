#!/bin/bash
echo DEV_ENV "$DEV_ENV"
[ ! -d "$DEV_ENV" ] && echo DEV_ENV DIRECTORY IS NOT FOUND && exit 1


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
