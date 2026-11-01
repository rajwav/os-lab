#!/usr/bin/env bash
# Check whether a string or number is a palindrome
# Usage: bash 02_palindrome_or_not.sh (then enter a string)

read -p "Word or number: " s
[ "$s" = "$(rev <<< "$s")" ] && echo Palindrome || echo "Not palindrome"
