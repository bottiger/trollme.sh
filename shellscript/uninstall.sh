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