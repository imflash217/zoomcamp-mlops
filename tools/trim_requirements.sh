#!/bin/bash

# Usage: ./strip_versions.sh requirements.txt

input_file="$1"

# Check if file exists
if [[ ! -f "$input_file" ]]; then
  echo "File not found!"
  exit 1
fi

# Get delimiter from second argument
delimiter="$2"
if [[ -z "$delimiter" ]]; then
  echo "Please provide a delimiter (e.g., ==, >=, etc.) as the second argument."
  exit 1
fi

# Escape delimiter for safe use in sed
escaped_delim=$(printf '%s\n' "$delimiter" | sed 's/[][\\.^$*]/\\&/g')

sed -i '' "s/${escaped_delim}.*$//" "$input_file"