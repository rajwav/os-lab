#!/usr/bin/env bash
# Compile a C file with gcc, make it executable, and run it
# Usage: bash 07_compile_and_create_an_executable.sh hello.c

gcc "$1" -o "${1%.c}"
chmod +x "${1%.c}"
./"${1%.c}"
