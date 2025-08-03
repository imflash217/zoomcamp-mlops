#!/bin/bash

REQUIREMENTS_FILE="$1"

# Check if requirements.txt exists
if [ ! -f "$REQUIREMENTS_FILE" ]; then
  echo "❌ File not found: $REQUIREMENTS_FILE"
  exit 1
fi

# Read and install each package using uv add
while IFS= read -r line || [ -n "$line" ]; do
  # Skip comments and empty lines
  if [[ -z "$line" || "$line" == \#* ]]; then
    continue
  fi

  echo "📦 Installing: $line"
  uv add "$line"
  if [ $? -ne 0 ]; then
    echo "⚠️ Failed to install: $line"
  fi
done < "$REQUIREMENTS_FILE"