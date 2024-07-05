#!/usr/bin/env bash
#
# Send notifications to the user every minute

while true; do notify-send "Reminder" "Don't forget to lock your computer!"; sleep 60; done &
