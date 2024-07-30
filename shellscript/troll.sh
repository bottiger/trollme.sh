#!/usr/bin/env bash

if [ "$(id -u)" -eq 0 ]; then
    >&2 echo "Error: This script should not be run as root."
    exit 1
fi

if [ "$TROLLMESH_DEBUG" = "true" ]; then
  echo "Executing troll.sh"
fi

show_help() {
    echo "Usage: $0 [OPTIONS] <Your name>"
    echo ""
    echo "Options:"
    echo "  -l, --list               List installed scripts"
    echo "  -s, --script FILE        Script name"
    echo "  -d, --dry-run            Run the script, but do not execute an action"
    echo "  -h, --help               Display this help and exit"
}

list_scripts() {
  local actions_dir="$1"
  local days_since_install="$2"
  local files_to_execute=()

  for file in $(find "$actions_dir" -type f -name "*"); do
    local filename=$(basename "$file")
    local file_date=$(echo "$filename" | cut -d'_' -f1)
    if [ -z "$days_since_install" ] || [ "$file_date" -le "$days_since_install" ]; then
      files_to_execute+=("$file")
    fi
  done

  # Sort the files by name before returning
  sorted_files=($(printf "%s\n" "${files_to_execute[@]}" | sort))

  # Return the array of sorted files
  echo "${sorted_files[@]}"
}

# Parse command line arguments
PARSED_ARGS=$(getopt -o ls:dh --long list,dry-run,script:,help -n "$0" -- "$@")
if [[ $? -ne 0 ]]; then
    show_help
    exit 1
fi

#echo "PARSED_ARGS: $PARSED_ARGS"
#echo "Original args: $@"

eval set -- "$PARSED_ARGS"

#echo "New args: $@"

# Default values
LIST=0
SCRIPT_TO_EXECUTE=""
DRY_RUN=0

while true; do
    case "$1" in
        -l | --list )
            LIST=1; shift ;;
        -s | --script )
            SCRIPT_TO_EXECUTE="$2"; shift 2;;
        -d | --dry-run )
            DRY_RUN=1; shift ;;
        -h | --help )
            show_help; exit 0 ;;
        -- )
            shift; break ;;
        * )
            break ;;
    esac
done

INPUT_NAME_ARG="$1"


if [ "$TROLLMESH_DEBUG" = "true" ]; then
  echo "Input name: $INPUT_NAME_ARG"
  echo "List mode: $LIST"
  echo "Script name: $SCRIPT_TO_EXECUTE"
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

#SCRIPT_TO_EXECUTE=$(echo "$SCRIPT_TO_EXECUTE" | xargs)
if [[ -n "$SCRIPT_TO_EXECUTE" ]]; then
    full_script_path="$SCRIPTS_FOLDER_FULL/$SCRIPT_TO_EXECUTE"
    if [[ -x "$full_script_path" ]]; then
        echo "Executing script: $full_script_path"
        source "$full_script_path"
        exit 0
    else
        >&2 echo "Error: Script $full_script_path is not executable or does not exist"
        exit 1
    fi
fi


# Calculate days since install
install_date=$(date) # For testing: $(date -d '-20 day')
if [ -f "$INSTALL_DATE_SCRIPT" ]; then
  install_date=$(./"$INSTALL_DATE_SCRIPT")
fi

current_date=$(date +%Y-%m-%d)
install_date=$(date -d "$install_date" +%Y-%m-%d)
# Calculate the difference in days
days_since_install=$(($(($(date -d "$current_date" +%s) - $(date -d "$install_date" +%s))) / 86400))

if [ "$TROLLMESH_DEBUG" = "true" ]; then
  echo "$days_since_install"
fi


if [ "$LIST" -eq 1 ]; then
  result=$(list_scripts "$SCRIPTS_FOLDER_FULL" )
  
  # Convert result to an array
  IFS=' ' read -r -a files_to_execute <<< "$result"

  echo "Scripts found in $SCRIPTS_FOLDER_FULL"
  for file in "${files_to_execute[@]}"; do
    echo "$(basename "$file")"
  done

  exit 1
fi

# Check for the mandatory argument
#if [[ -z "$1" ]]; then
#    >&2  echo "Error: Name missing"
#    show_help
#    exit 1
#fi



result=$(list_scripts "$SCRIPTS_FOLDER_FULL" "$days_since_install")
IFS=' ' read -r -a files_to_execute <<< "$result"

if [ "$TROLLMESH_DEBUG" = "true" ]; then
  # Print the files to execute
  for file in "${files_to_execute[@]}"; do
    echo "File to execute: $file"
  done
fi

# Only proceed if there are files to execute
if (( ${#files_to_execute[@]} > 0 )); then

  # Calculate a random number between 0 and 1
  random_number=$(awk 'BEGIN {srand(); print rand()}')

  if [ "$TROLLMESH_DEBUG" = "true" ]; then
    echo "random_number: $random_number"
    echo "SCRIPT_PROBABILITY: $SCRIPT_PROBABILITY"
  fi

  # Check if random number is less than the probability
  if (( $(awk "BEGIN {print ($random_number < $SCRIPT_PROBABILITY)}") )); then
    # Select a random file from the array
    chosen_file=${files_to_execute[RANDOM % ${#files_to_execute[@]}]}

    if [ "$TROLLMESH_DEBUG" = "true" ]; then
      echo "chosen_file: $chosen_file"
    fi

    if [ "$DRY_RUN" -eq 0 ]; then
      source "$chosen_file"
    fi
  fi
fi
