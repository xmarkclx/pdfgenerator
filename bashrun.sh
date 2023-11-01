#!/bin/bash

watch_dir="./html"  # Replace with the directory you want to monitor

# Function to run the command when changes are detected
run_command() {
    echo "Changes detected! Running command..."
    # Example command: run wkhtmltopdf
    output=$(windows/wkhtmltopdf --enable-local-file-access --page-size letter --margin-top 0 --margin-bottom 0 --margin-left 0 --margin-right 0 html/index.html out.pdf 2>&1)
    echo "$output"
}

# Run the command immediately
run_command

# Monitor the directory for changes
inotifywait -m -r -e modify,create,delete,move "$watch_dir" |
    while read -r directory event filename; do
        # Run the command when changes are detected
        run_command
    done