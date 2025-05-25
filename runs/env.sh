#!/bin/bash
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

echo DEPLOYING FILES
cp -r $script_dir/../env/. "$DEV_ENV"
[ -d "$script_dir/../env_private/env/" ] && cp -r $script_dir/../env_private/env/. "$DEV_ENV"
echo -----------------
