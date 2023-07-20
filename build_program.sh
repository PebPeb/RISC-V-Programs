#!/bin/bash

# Get the directory where the script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Go to the script's directory
cd "$SCRIPT_DIR"

# Function to get the value of a variable from compiler.properties
get_variable_value() {
    local dir="${1%/}" # Remove trailing slash from the input directory
    local variable_name="$2"
    local variable_value

    # Check if the compiler.properties file exists in the folder
    if [ -f "$dir/compiler.properties" ]; then
        # Use grep to extract the value of the variable from compiler.properties
        variable_value=$(grep -i "\b$variable_name\b" "$dir/compiler.properties" | cut -d '=' -f 2)
        echo "$variable_value"
    else
        echo "$variable_name not found in '$dir/compiler.properties'"
    fi
}




i=0
for dir in */; do
  # Check if the entry is a directory
  if [ -d "$dir" ]; then
    dir_name="${dir%/}"                  # Remove trailing slash for a cleaner output
    build_name=$(get_variable_value "$dir_name" "BUILD_NAME")
    docker_image=$build_name-compiler

    if docker image inspect "$docker_image" &> /dev/null; then
      formatted_output=$(printf "%-15s" "$build_name")
    else
      formatted_output=$(printf "%-15s %-10s" "$build_name" "[INSTALL]")
    fi
    echo "[$i] - $formatted_output"
    # Get the BUILD_NAME from compiler.properties
    i=$((i + 1))
  fi
done
