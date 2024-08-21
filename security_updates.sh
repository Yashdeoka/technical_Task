#!/bin/bash
# security_updates.sh

echo "Security Updates and Patching:"
echo "------------------------------"

# Check for available updates
echo "Checking for available updates:"
if command -v apt-get &>/dev/null; then
    sudo apt-get update && sudo apt-get upgrade -y
elif command -v yum &>/dev/null; then
    sudo yum check-update
    sudo yum update -y
fi

echo "Updates completed."

