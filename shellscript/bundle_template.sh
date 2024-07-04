#!/usr/bin/env bash

# It might be tempting to read and try to understand this script, but don't bother.
# Go to the code respsitory instead where you can find the readable code instead.
#
# https://github.com/bottiger/trollme.sh

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