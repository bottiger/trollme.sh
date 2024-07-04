#!/usr/bin/env bash

source config.sh

# Function to check if file contains $RND_CHARS
check_file_contains_rnd_chars() {
    local file="$1"
    local search_str='#'$RND_CHARS

    if grep -qF "$search_str" "$file"; then
        return 0  # Found the string
    else
        return 1  # Did not find the string
    fi
}

# Define the start and end markers for the section
START_MARKER="#$RND_CHARS"
END_MARKER="#$RND_CHARS"

# Check if the section does not exist in .profile
if ! check_file_contains_rnd_chars "$DOTPROFILE"; then
    # If section does not exist, add it to .profile
    echo "$DOTPROFILE_CONTENT" >> $DOTPROFILE
else
    echo "The section already exists in $DOTPROFILE"
fi