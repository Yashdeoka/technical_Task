#!/bin/bash
# log_monitoring.sh

echo "Log Monitoring:"
echo "---------------"

# Check for suspicious log entries
echo "Checking for suspicious log entries (e.g., failed SSH login attempts):"
grep "Failed password" /var/log/auth.log

echo "Log monitoring completed."

