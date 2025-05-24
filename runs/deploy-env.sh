#!/bin/bash
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

echo DEPLOYING FILES
cp -r $script_dir/../env/.* "$ENV_DIR"
[ -d "$script_dir/../env_private/" ] && cp -r $script_dir/../env_private/.* "$ENV_DIR"
echo -----------------
