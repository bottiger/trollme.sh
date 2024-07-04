#!/usr/bin/env bash

# Ensure a destination file path is provided as an argument
if [ $# -ne 1 ]; then
    echo "Usage: $0 <destination_file>"
    exit 1
fi

DEST_FILE="$1"

# Source the configuration file
source config.sh

README_CONTENT=$(<README.md)

# Perform substitutions
README_CONTENT=$(echo "$README_CONTENT" | \
    sed -e "s|\$SOURCE_NAMED|${SOURCE_NAMED}|g" \
        -e "s|\$INSTALL_DATE|${INSTALL_DATE}|g" \
        -e "s|\$WEBSITE_URL|${WEBSITE_URL}|g" \
        -e "s|\$FOLDER_LOCATION|${FOLDER_LOCATION}|g")

# Write the modified content to the destination file
echo "$README_CONTENT" > "$DEST_FILE"

echo "Substitution complete. Updated README.md written to $DEST_FILE."