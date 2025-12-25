#!/bin/bash

# Check if an input file is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <markdown_file>"
    exit 1
fi

INPUT_FILE="$1"

# Check if the file exists
if [ ! -f "$INPUT_FILE" ]; then
    echo "Error: File '$INPUT_FILE' not found."
    exit 1
fi

# Extract the filename without extension
FILENAME=$(basename -- "$INPUT_FILE")
BASE="${FILENAME%.*}"
OUTPUT_FILE="${BASE}.pdf"

echo "Converting '$INPUT_FILE' to '$OUTPUT_FILE'..."

# Call pandoc to convert MD to PDF
# --toc: Generate Table of Contents
# --toc-depth: Set the level of headers to include
# -V colorlinks=true: Make links clickable and colored
# -V CJKmainfont: Specify a font that supports Chinese characters
# -V geometry: Set page margins
# --pdf-engine: Use xelatex for CJK support
pandoc "$INPUT_FILE" \
    -o "$OUTPUT_FILE" \
    --toc \
    --toc-depth=3 \
    -V colorlinks=true \
    -V CJKmainfont="PingFang SC" \
    -V geometry:margin=1in \
    --pdf-engine=xelatex

if [ $? -eq 0 ]; then
    echo "Success! PDF generated: $OUTPUT_FILE"
else
    echo "Error: PDF conversion failed."
    exit 1
fi
