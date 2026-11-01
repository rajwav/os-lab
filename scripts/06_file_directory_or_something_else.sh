#!/usr/bin/env bash
# Identify if a given name is a file, directory, or something else
# Usage: bash 06_file_directory_or_something_else.sh

read -p "Name: " n
if [ -f "$n" ]; then echo File
elif [ -d "$n" ]; then echo Directory
elif [ -e "$n" ]; then echo "Something else (link, device...)"
else echo "Does not exist"; fi
