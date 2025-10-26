#!/bin/bash

APP="POMODORO"
TITLE="POMODORO - Work, repeat, healthy."

WORK=1500 # second - as default
BREAK=300 # second - as default
REPEAT=4 # times - as default

while getopts ":w:b:r" opt; do
    case "$opt" in
        w) WORK="$OPTARG" ;;
        b) BREAK="$OPTARG" ;;
        r) REPEAT="$OPTARG" ;;
        *) exit 1 ;;
    esac
done

notify-send -a "$APP" "$TITLE" \
    "  $((WORK/60)) minutes of work ($REPEAT times)\n  $((BREAK/60)) minutes of break" \
    -h string:x-canonical-private-synchronous:"$APP" \

for (( r=1; r<=REPEAT; r++ )); do
    progress=$(( (r*100) / REPEAT ))
    sleep $WORK

    # Show timer if just 5 second
    for ((i=5; i>=0; i--)); do
        time_left=$(( (i*100) / 5 ))time
        notify-send -a "$APP" "$TITLE" \
            "00:0$i to break" \
            -h string:x-canonical-private-synchronous:"$APP" \
            -h int:value:"$time_left"
        sleep 1 || true
    done

    notify-send -a "$APP" "$TITLE" \
        "Section $r compiled succesfully, caffeine detected" \
        -h string:x-canonical-private-synchronous:"$APP" \
        -h int:value:"$progress"

    if [ "$r" -lt $REPEAT ]; then
        sleep 3 || true
        notify-send -a "$APP" "$TITLE" \
            "Time break for section $r." \
            -h string:x-canonical-private-synchronous:"$APP" \
            -h int:value:"$progress"

        sleep $BREAK
        notify-send -a "$APP" "$TITLE" \
            "Time to continue your work section $(( r + 1 ))." \
            -h string:x-canonical-private-synchronous:"$APP" \
            -h int:value:"$progress"
    fi
done

sleep 1 || true
notify-send -a "$APP" "$TITLE" \
    "You are done, time to hibernate." \
    -h string:x-canonical-private-synchronous:"$APP"
    -h int:value:"100"

