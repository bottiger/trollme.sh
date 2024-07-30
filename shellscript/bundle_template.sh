#!/usr/bin/env bash
#
# It might be tempting to read and try to understand this script, but don't bother.
# Instead, go to the code repository instead where you can find the code in a readable format.
#
# Main page: https://github.com/bottiger/trollme.sh
# Shell scripts: https://github.com/bottiger/trollme.sh/tree/main/shellscript
#
# Generation date: 2024-07-30T10:18:06 CEST
# Git hash:        443611ff32ed28ecc84aedb439cdeda66946803c

# Determine the temporary directory
TMPDIR=${TMPDIR:-${TEMP:-${TMP:-/tmp}}}

# Create a unique subdirectory in the temporary directory
MY_TMP_DIR=$(mktemp -d "$TMPDIR/trollme.XXXXXX")

# Check if the temporary directory was created successfully
if [ ! -d "$MY_TMP_DIR" ]; then
  echo "Failed to create temporary directory."
  exit 1
fi

cd $MY_TMP_DIR

# Bundle the scripts