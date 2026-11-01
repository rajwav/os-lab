#!/usr/bin/env bash
# Count regular files, directories and executables in a folder
# Usage: bash 05_count_files_directories_executables.sh [folder_path]

d=${1:-.}
echo "Files: $(find $d -maxdepth 1 -type f | wc -l)"
echo "Dirs: $(( $(find $d -maxdepth 1 -type d | wc -l) - 1 ))"
echo "Executables: $(find $d -maxdepth 1 -type f -executable | wc -l)"
