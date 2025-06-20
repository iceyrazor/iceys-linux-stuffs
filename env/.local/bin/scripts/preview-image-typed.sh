preview() {
    # chafa "$@" -f sixel -s "$(($2-2))x$3" | sed 's/#/\n#/g'
    chafa "$1" --clear -f iterm -s $2x$3
}

thumbnail="/tmp/thumbnail.png"

file="$1"; shift

case "$file" in
*.avi|*.gif|*.mp4|*.mkv|*.webm|*.mov)
    ffmpegthumbnailer -i "$file" -s 0 -q 5 -o "/tmp/thumbnail.png"
    preview "$thumbnail" "$@"
    ;;
*)
    preview "$file" "$@"
esac
