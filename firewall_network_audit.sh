#!/bin/bash
# firewall_network_audit.sh

echo "Firewall and Network Security Audit:"
echo "------------------------------------"

# Verify that a firewall is active
echo "Checking if firewall is active:"
if ! systemctl is-active --quiet iptables; then
    echo "Firewall (iptables) is not active."
else
    echo "Firewall (iptables) is active."
fi

# List open ports and their associated services
echo "Listing open ports:"
ss -tuln

# Check for IP forwarding
echo "Checking for IP forwarding:"
if sysctl net.ipv4.ip_forward | grep -q "1"; then
    echo "IP forwarding is enabled. It should be disabled if not required."
fi

echo "Audit completed."

