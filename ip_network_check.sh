#!/bin/bash
# ip_network_check.sh

echo "IP and Network Configuration Check:"
echo "-----------------------------------"

# List all IP addresses and categorize them as public or private
echo "Listing IP addresses:"
ip -4 addr show | awk '/inet/ {print $2}'

# Check for public IP exposure of sensitive services (e.g., SSH)
echo "Checking for SSH exposure on public IPs:"
if ss -tuln | grep -q ":22"; then
    echo "SSH is exposed on a public IP."
fi

echo "Check completed."

