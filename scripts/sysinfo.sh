#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

command -v whoami >/dev/null 2>&1 || { echo "whoami command not found" >&2; exit 1; }
command -v df >/dev/null 2>&1 || { echo "df command not found" >&2; exit 1; }

echo "=== System Info ==="
echo "User: $(whoami)"
echo "Date: $(date)"
echo
echo "Disk usage:"
df -h
