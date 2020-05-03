#!/bin/bash
# Dependency checking
#
# Simply pass in every dependency command as arguments to this script.
#
# If a command is not installed, an error message indicating its name will be
# printed to STDOUT.

# Get the array of paths defined in $PATH
IFS=':' read -a PATHS -r <<< "$PATH"

for cmd in "$@"; do
    # Check if the command exists under any path
    for path in "${PATHS[@]}"; do
        if [ -f "$path/$cmd" ]; then
            # Found
            continue 2
        fi
    done
    # Not found under any path
    echo "Could not find required command '$cmd'"
    exit 1
done
