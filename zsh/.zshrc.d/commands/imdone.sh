# send a notification when command completes
function imdone {
    RVAL=$?                           # get return value of the last command
    DATE=`date`                     # get time of completion
    LAST=$history[$HISTCMD] # get current command
    LAST=${LAST%[;&|]*}      # remove "; alert" from it

    # set window title so we can get back to it
    echo -ne "\e]2;$LAST\a"

    LAST=${LAST//\"/'\"'}        # replace " for \" to not break lua format

    # check if the command was successful
    if [[ $RVAL == 0 ]]; then
        RVAL="SUCCESS"
        LEVEL="normal"
        ICON="$HOME/bin/assets/checkmark.png"
    else
        RVAL="FAILURE"
        LEVEL="critical"
        ICON="$HOME/bin/assets/cross.png"
    fi

    notify-send "Command $LAST completed" "$RVAL" --icon="$ICON" -u "$LEVEL" -t 30000
    paplay /usr/share/sounds/freedesktop/stereo/complete.oga
}
