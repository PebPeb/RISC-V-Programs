#!/bin/bash

# Get the directory where the script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

compiler_dirs=()                                    # Directory
compilers=()                                        # BUILD_NAME value in that directory

for dir in */; do                                  
  if [ -d "$dir" ]; then                            # If a directory
    dir_name="${dir%/}"                             # Remove trailing '/'
    build_name=
    if [ -f "$dir/compiler.properties" ]; then      # Check if the folder has a compiler.properties
      # Use grep to extract the value of the variable from compiler.properties
      build_name=$(grep -i "\bBUILD_NAME\b" "$dir/compiler.properties" | cut -d '=' -f 2)
      if [ -z "$build_name" ]; then                  # Check if the BUILD_NAME is null
        skip=
      else
        compiler_dirs+=($dir)            
        compilers+=($build_name)
      fi
    fi
  fi
done


i=0
for value in "${compilers[@]}"
do
  docker_image=$value-compiler
  if docker image inspect "$docker_image" &> /dev/null; then
    formatted_output=$(printf "%-15s" "$value")
  else
    formatted_output=$(printf "%-15s %-10s" "$value" "[INSTALL]")
  fi
  echo "[$i] - $formatted_output"
  i=$((i + 1))
done

# value="${value%/}"
# "${compilers[$i]}"  # For using a variable as the counter

