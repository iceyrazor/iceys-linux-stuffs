#!/bin/bash
echo DEV_ENV "$DEV_ENV"
[ ! -d "$DEV_ENV" ] && echo DEV_ENV DIRECTORY IS NOT FOUND && exit 1

run_runs_all=0
list_runs=0
while getopts "al" opt; do
    case "$opt" in
        a) run_runs_all=1
            ;;
        l) list_runs=1
            ;;
    esac
done

shift $((OPTIND-1))
[ "${1:-}" = "--" ] && shift


script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

runs_dir="$(find $script_dir/runs -mindepth 1 -maxdepth 1 -type f -executable)"
runs_dir_all="$(find $script_dir/runs-all -mindepth 1 -maxdepth 1 -type f -executable)"

if [ $list_runs == 1 ]; then
    printf "  runs --------------\n"
    ls "$script_dir/runs"
    printf "\n  runs-all ----------\n"
    ls "$script_dir/runs-all"
    exit 0
fi

if [ "$1" != "" ]; then
    . "$script_dir/runs/$1.sh"
    if [ $run_runs_all == 1 ]; then
        . "$script_dir/../runs-all/$1.sh"
    fi
else
    for s in $runs_dir; do
        echo running $s
        . "$s"
    done

    if [ $run_runs_all == 1 ]; then
        for s in $runs_dir_all; do
            echo running $s
            . "$s"
        done
    fi
fi
