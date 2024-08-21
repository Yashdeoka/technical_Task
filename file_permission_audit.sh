#!/bin/bash
# file_permission_audit.sh

echo "File and Directory Permissions Audit:"
echo "-------------------------------------"

# Scan for world-writable files and directories
echo "Scanning for world-writable files and directories:"
find / -type f -perm -o+w -exec ls -l {} \; 2>/dev/null

# Check for .ssh directories with insecure permissions
echo "Checking for insecure .ssh directory permissions:"
find /home -name ".ssh" -exec ls -ld {} \; 2>/dev/null | awk '$1 !~ /^drwx------/ {print $0}'

# Report files with SUID or SGID bits set
echo "Scanning for files with SUID/SGID bits set:"
find / -perm /6000 -exec ls -l {} \; 2>/dev/null

echo "Audit completed."

