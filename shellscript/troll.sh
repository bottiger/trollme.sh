#!/usr/bin/env bash

script_dir="$(dirname "${BASH_SOURCE[0]}")"
source_file="$script_dir/config.sh" 
# Check if the file exists and source it
if [ -f "$source_file" ]; then
  source "$source_file"
else
  echo "Error: File '$source_file' not found."
  exit 1;
fi

if [ "$(id -u)" -eq 0 ]; then
    echo "Error: This script should not be run as root."
    exit 1
fi