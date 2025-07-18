#!/bin/bash
echo DEPLOYING ENV ALL
cp -r $script_dir/env/. "$DEV_ENV"
[ -d "$script_dir/env_private/env/" ] && cp -r $script_dir/env_private/env/. "$DEV_ENV"


if [ ! -f "/etc/profile" ]; then
    echo NO /etc/profile
    echo SKIPPING SETTING \$PATH
else
    export PATH=""
    source /etc/profile
    paths="$PATH"
    path_dirs="$(find $DEV_ENV/.local/bin/scripts -type d)"
    yt_cli_dir="$(find ~/stuff/ -name youtube-playlist-cli -type d)"

    path_dirs="$path_dirs
$yt_cli_dir
$(find ~/stuff/ -name theme-setter -type d)
$(find ~/.local/bin/blender* -maxdepth 0 -type d)
$(find $script_dir/keep/scripts -type d)
$(find $script_dir/env_private/keep/scripts -type d)"

    for s in $path_dirs; do
        echo "adding $s to path"
        paths="$paths:$s"
    done

    echo "export PATH=\"$paths:\"" > "$DEV_ENV/.local/bin/system/paths.sh"
    echo "export YT_PLAYLIST_DIR=\"$yt_cli_dir\"" >> "$DEV_ENV/.local/bin/system/paths.sh"
    chmod u+x "$DEV_ENV/.local/bin/system/paths.sh"

fi
echo -----------------
