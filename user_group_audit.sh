#!/bin/bash
# user_group_audit.sh

echo "User and Group Audit:"
echo "---------------------"

# List all users and groups
echo "Listing all users:"
cut -d: -f1 /etc/passwd

echo "Listing all groups:"
cut -d: -f1 /etc/group

# Check for users with UID 0 (root privileges)
echo "Checking for users with UID 0:"
awk -F: '($3 == "0") {print $1}' /etc/passwd

# Check for users without passwords
echo "Checking for users without passwords:"
awk -F: '($2 == "" || $2 == "*") {print $1}' /etc/shadow

echo "Audit completed."

