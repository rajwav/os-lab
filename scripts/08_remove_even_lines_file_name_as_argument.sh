#!/usr/bin/env bash
# Remove even-numbered lines from a file in-place using sed
# Usage: bash 08_remove_even_lines_file_name_as_argument.sh <file>

sed -i '2~2d' "$1"
