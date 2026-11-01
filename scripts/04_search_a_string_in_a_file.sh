#!/usr/bin/env bash
# Search for a string in a file with line numbers (grep -n)
# Usage: bash 04_search_a_string_in_a_file.sh

read -p "String: " s; read -p "File: " f
grep -n "$s" "$f" || echo "Not found"
