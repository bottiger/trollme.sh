#!/usr/bin/env bash
#
# Play random beeps in the terminal

sleep 120;
while true; do echo -e "\a"; sleep $((RANDOM % 10 + 1)); done &