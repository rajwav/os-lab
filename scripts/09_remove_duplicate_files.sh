#!/usr/bin/env bash
# Find and remove duplicate files in current directory based on MD5 checksum
# Usage: bash 09_remove_duplicate_files.sh

md5sum * 2>/dev/null |
sort |
awk 'seen[$1]++{print $2}' |
xargs -r rm -v
