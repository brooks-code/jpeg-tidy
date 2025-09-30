#!/bin/bash

# Check if the necessary dependencies are installed
if ! command -v convert &>/dev/null; then
  echo "Error: ImageMagick is not installed. Please install it before running this script. On Debian/Ubuntu you can run: sudo apt update && sudo apt install imagemagick"
  exit 1
fi

if ! command -v exiftool &>/dev/null; then
  echo "Error: exiftool is not installed. Please install it before running this script. On Debian/Ubuntu you can run: sudo apt update && sudo apt install libimage-exiftool-perl"
  exit 1
fi

# Ask for confirmation before proceeding
read -p "WARNING: original files will be overwritten. Are you in the correct directory? This script will resize all JPEG files in the current directory to 55% of their original size, rename them to a sequential numbering, and remove all EXIF metadata. Are you sure you want to proceed? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Nn]$ ]]; then
  echo "Aborting script."
  exit 1
fi

# Ask for confirmation again
read -p "Sure.. Sure?? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Nn]$ ]]; then
  echo "Aborting script."
  exit 1
fi

# Find all JPEG/JPG (case insensitive) files
FOUND_FILES=$(find . -maxdepth 1 -iregex ".*\.jpe?g$" -print)
if [ -z "$FOUND_FILES" ]; then
  echo "No pictures found."
  exit 1
fi

# Print the number of found files
NUM_FOUND_FILES=$(echo "$FOUND_FILES" | wc -l)
echo "Found $NUM_FOUND_FILES picture(s)."

# Resize the JPEG files to 55% of their original size, and overwrite the originals
find . -maxdepth 1 -iregex ".*\.jpe?g$" -exec convert {} -resize 55% {} \;

# Rename the JPEG files in the current directory to a sequential numbering (1.jpg, 2.jpg, etc.)
find . -maxdepth 1 -iregex ".*\.jpe?g$" | cat -n | while read n f; do mv -n "$f" "$(basename "$n").jpg"; done

# Remove all EXIF metadata from JPEG files in the current directory, overwriting the originals
exiftool -q -all:all= . -overwrite_original -if "$filename =~ m/\.jpe?g$/i"

# Print the number of processed files
NUM_PROCESSED_FILES=$(find . -maxdepth 1 -iregex ".*\.jpe?g$" -print | wc -l)
echo "Processed $NUM_PROCESSED_FILES picture(s)."
