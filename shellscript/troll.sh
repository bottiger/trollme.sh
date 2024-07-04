#!/usr/bin/env bash

source config.sh

if [ "$(id -u)" -eq 0 ]; then
    echo "Error: This script should not be run as root."
    exit 1
fi