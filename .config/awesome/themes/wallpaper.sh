#!/bin/bash

function cerr() {
    echo "$*" 1>&2
}

function extension() {
    local input="$1"
    local ext=$(file --brief --mime-type "$input" | tr '/' ' ' | awk '{ print $2; }')
    echo "$ext"
}

function set_gif_wp() {
    local gif="$1"
    xwinwrap -g 1920x1200+0+0 -ov -nf -fs -- \
        gifview -w WID -a "$gif" \
        2>&1 >/dev/null &
    local pid="$!"
    echo "$pid"
}

function set_webm_wp() {
    local webm="$1"
    xwinwrap -g 1920x1200+0+0 -ov -nf -fs -- \
        mplayer -wid WID -quiet -noconsolecontrols -loop 0 "$webm" \
        2>&1 >/dev/null &
    local pid="$!"
    echo "$pid"
}

function set_wp() {
    local background="$1"
    if [[ -L "$1" ]]; then
        background=$(readlink $1)
    fi
    ln -sf $background ~/.wallpaper
    case $(extension "$background") in
        png|jpeg)
            feh --bg-scale "$background"
            ;;
        gif)
            set_gif_wp "$background"
            ;;
        webm|mp4)
            set_webm_wp "$background"
            ;;
        *)
            cerr "Error: Unknown file type."
            exit 4
            ;;
    esac
}

## Main logic
if [[ -z $# ]]
then
    cerr "Error: No inputs specified."
    exit 1
fi

action="$1"
file="$2"

case "$action" in
    set)
        if [[ -n "$file" ]]
        then
            set_wp "$file"
        else
            cerr "Error: No file specified."
            exit 3
        fi
        ;;
    quit)
        # nuke everything
        kill -15 $(pidof xwinwrap)
        kill -15 $(pidof gifview)
        kill -15 $(pidof mplayer)
        ;;
    *)
        cerr "Error: Unknown action."
        exit 2
        ;;
esac
