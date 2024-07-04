#!/usr/bin/env bash

# Source the configuration file
source config.sh

echo "Removing $FOLDER_LOCATION..."
rm -rf $FOLDER_LOCATION
echo "Done"

# also cleanup the .profile file
OCCURRENCES=$(grep -x "#$RND_CHARS" "$DOTPROFILE" | wc -l)

echo "Cleaning up $DOTPROFILE..."
# Check if the unique string appears exactly twice
if [ "$OCCURRENCES" -ne 2 ]; then
    echo "Error: The unique string '#$RND_CHARS' does not appear exactly twice in $DOTPROFILE."
    exit 1
fi

# Remove the block of code between (and including) the two unique strings
sed -i "/#$RND_CHARS/,/#$RND_CHARS/d" "$DOTPROFILE"
echo "Done"