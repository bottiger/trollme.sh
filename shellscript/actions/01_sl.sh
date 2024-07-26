#!/usr/bin/env bash
#
# Show sl when a new terminal is opened.
# This needs to be able to build the project using gcc

# Function to check if gcc is installed
check_gcc() {
    if command -v gcc &> /dev/null; then
        echo "gcc is installed."
        return 0
    else
        echo "gcc is not installed."
        return 1
    fi
}

# Function to build the Makefile
build_makefile() {
    makefile_path="../external/sl"

    if [ -f "$makefile_path/Makefile" ]; then
        echo "Building the Makefile located at $makefile_path..."
        cd $makefile_path
        make -f "Makefile"
    else
        echo "Makefile not found at $makefile_path."
    fi
}

# Main script logic
if check_gcc; then
    build_makefile
else
    echo "Cannot build the Makefile because gcc is not installed."
fi
