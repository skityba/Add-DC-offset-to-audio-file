#!/bin/bash
# Script for adding DC offset to an audio file
# Check if Sox is installed
if ! command -v sox &> /dev/null; then
    echo "SoX is not installed. Installing..."
    brew install sox
    
    # Check if installation was successful
    if ! command -v sox &> /dev/null; then
        echo "Failed to install SoX. Please install it manually: brew install sox"
        exit 1
    fi
fi
# Set DC offset value
DC_OFFSET=0.3
# File names
INPUT_FILE="filename"
OUTPUT_FILE="new_filename"
# Check if source file exists
if [ ! -f "$INPUT_FILE" ]; then
    echo "Error: File $INPUT_FILE not found!"
    echo "Make sure the file is in the same folder as the script."
    exit 1
fi
# Apply DC offset
echo "Adding DC offset $DC_OFFSET to file $INPUT_FILE..."
sox "$INPUT_FILE" "$OUTPUT_FILE" dcshift $DC_OFFSET
# Check result
if [ $? -eq 0 ]; then
    echo "Done! File with DC offset saved as $OUTPUT_FILE"
    echo "File path: $(pwd)/$OUTPUT_FILE"
else
    echo "An error occurred while processing the file."
fi