#!/bin/bash
# service_audit.sh

echo "Service Audit:"
echo "--------------"

# List all running services
echo "Listing all running services:"
systemctl list-units --type=service --state=running

# Check for unauthorized services
echo "Checking for unauthorized services:"
unauthorized_services=("telnet" "ftp" "rlogin")
for service in "${unauthorized_services[@]}"; do
    if systemctl is-active --quiet $service; then
        echo "$service is running and should be disabled."
    fi
done

# Ensure critical services are running
echo "Ensuring critical services are running:"
critical_services=("sshd" "iptables")
for service in "${critical_services[@]}"; do
    if ! systemctl is-active --quiet $service; then
        echo "$service is not running and should be started."
    fi
done

echo "Audit completed."

