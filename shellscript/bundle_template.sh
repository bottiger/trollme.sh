#!/usr/bin/env bash

# It might be tempting to read and try to understand this script, but don't bother.
# Instead, go to the code repository instead where you can find the code in a readable format.
#
# Main page: https://github.com/bottiger/trollme.sh
# Shell scripts: https://github.com/bottiger/trollme.sh/tree/main/shellscript

# Determine the temporary directory
TMPDIR=${TMPDIR:-${TEMP:-${TMP:-/tmp}}}

# Create a unique subdirectory in the temporary directory
MY_TMP_DIR=$(mktemp -d "$TMPDIR/mytempdir.XXXXXX")

# Check if the temporary directory was created successfully
if [ ! -d "$MY_TMP_DIR" ]; then
  echo "Failed to create temporary directory."
  exit 1
fi

echo "Created temporary directory: $MY_TMP_DIR"

cd $MY_TMP_DIR

# Bundle the scripts