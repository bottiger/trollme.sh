#!/usr/bin/env bash
#
# This will flip the screen upside down after a ~10 min random delay
# and then flip it back after 20 seconds
#

# ensure the system has xrandr installed
if ! command -v xrandr &> /dev/null
then
    exit
fi


flip_screen() {
    echo "Flipping the screen in 20 seconds"

    # Wait for a random number of seconds between 200 and 900
    random_seconds=$(( RANDOM % 701 + 200 ))
    echo "Waited for $random_seconds seconds"
    
    # Sleep in the background to delay execution
    (sleep $random_seconds && {
        echo "Waiting over, flipping the screen"
        xrandr -o inverted
        sleep 20
        xrandr -o normal
    }) &
}

# Call the function to initiate the delayed execution
flip_screen