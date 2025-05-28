#!/bin/bash
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

echo DEPLOYING FILES
cp -r $script_dir/../env/. "$DEV_ENV"
[ -d "$script_dir/../env_private/env/" ] && cp -r $script_dir/../env_private/env/. "$DEV_ENV"

path_dirs="$(find $DEV_ENV/.local/bin/scripts -type d)"

if [ ! -f "/etc/profile" ]; then
    echo NO /etc/profile
    echo SKIPPING SETTING \$PATH
else
    export PATH=""
    source /etc/profile
    paths="$PATH"
    path_dirs="$path_dirs
$(find ~/stuff/scripts/**/theme-setter -maxdepth 0 -type d)
$(find ~/stuff/scripts/**/youtube-playlist-cli -maxdepth 0 -type d)
$(find ~/stuff/scripts/system -maxdepth 2 -type d)"
    for s in $path_dirs; do
        echo "adding $s to path"
        paths="$paths:$s"
    done
    echo "export PATH=\"$paths:\"" > "$DEV_ENV/.local/bin/system/paths.sh"
    chmod u+x "$DEV_ENV/.local/bin/system/paths.sh"

fi
echo -----------------
