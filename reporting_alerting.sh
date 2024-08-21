#!/bin/bash
# reporting_alerting.sh

report_file="/var/log/security_audit_report.log"
email_recipient="yashdeokar59@gmail.com"

echo "Generating Security Audit Report:"
echo "---------------------------------"

# Combine all the audit logs into one report
cat /var/log/user_group_audit.log /var/log/file_permission_audit.log /var/log/service_audit.log /var/log/firewall_network_audit.log /var/log/ip_network_check.log /var/log/security_updates.log /var/log/log_monitoring.log /var/log/server_hardening.log > $report_file

# Send email alert if critical issues are found
if grep -q "critical" $report_file; then
    mail -s "Critical Security Issues Found" $email_recipient < $report_file
fi

echo "Reporting and alerting completed."

