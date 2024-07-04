#!/usr/bin/env bash

if [ "$(id -u)" -eq 0 ]; then
    echo "Error: This script should not be run as root."
    exit 1
fi

script_dir="$(dirname "${BASH_SOURCE[0]}")"
source_file="$script_dir/config.sh" 
# Check if the file exists and source it
if [ -f "$source_file" ]; then
  source "$source_file"
else
  echo "Error: File '$source_file' not found."
  exit 1;
fi

# Calculate days since install
install_date=$(date) # For testing: $(date -d '-20 day')
if [ -f "$INSTALL_DATE_SCRIPT" ]; then
  install_date=$(./$INSTALL_DATE_SCRIPT)
fi

current_date=$(date +%Y-%m-%d)
install_date=$(date -d "$install_date" +%Y-%m-%d)
# Calculate the difference in days
days_since_install=$(($(($(date -d "$current_date" +%s) - $(date -d "$install_date" +%s))) / 86400))

# Output the number of days
#echo "$days_since_install"

# find all the files in the folder "actions" where the prefix is lower than $days_since_install and execute them
actions_dir="$SCRIPTS_FOLDER_FULL"
files_to_execute=()
for file in $(find "$actions_dir" -type f -name "*"); do
  filename=$(basename "$file")
  file_date=$(echo "$filename" | cut -d'_' -f1)
  if [ "$file_date" -le "$days_since_install" ]; then
    files_to_execute+=("$file")
  fi
done

# Only proceed if there are files to execute
if (( ${#files_to_execute[@]} > 0 )); then

  # Calculate a random number between 0 and 1
  random_number=$(awk 'BEGIN {srand(); print rand()}')

  # Check if random number is less than the probability
  if (( $(echo "$random_number < $SCRIPT_PROBABILITIY" | bc -l) )); then
    # Select a random file from the array
    chosen_file=${files_to_execute[RANDOM % ${#files_to_execute[@]}]}
    source "$chosen_file"
  fi
fi
