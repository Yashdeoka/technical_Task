# Proxy Server Monitoring Script
Overview
This script is designed to monitor various system resources on a proxy server. It presents the data in a dashboard format, refreshing every few seconds to provide real-time insights. The script also allows you to view specific parts of the dashboard individually using command-line switches.

Features
Top 10 Most Used Applications: Displays the top 10 applications consuming the most CPU and memory.
Network Monitoring: Shows the number of concurrent connections, packet drops, and network traffic (MB in/out).
Disk Usage: Displays disk space usage by mounted partitions and highlights partitions using more than 80% of the space.
System Load: Shows the current load average and a breakdown of CPU usage (user, system, idle).
Memory Usage: Displays total, used, and free memory, as well as swap memory usage.
Process Monitoring: Displays the number of active processes and shows the top 5 processes by CPU and memory usage.
Service Monitoring: Monitors the status of essential services like sshd, nginx/apache, and iptables.
Usage
Run the Entire Dashboard:

bash
Copy code
./monitor.sh
This will display all the monitoring sections and refresh every 5 seconds.

View Specific Sections:

Top CPU/Memory applications:

Copy code
./monitor.sh -cpu
Network statistics:

Copy code
./monitor.sh -network
Disk usage:

Copy code
./monitor.sh -disk
System load:

Copy code
./monitor.sh -load
Memory usage:

Copy code
./monitor.sh -memory
Process monitoring:

Copy code
./monitor.sh -process
Service monitoring:

Copy code
./monitor.sh -service

# Seconed Task 
# Security Audit and Server Hardening Script
Overview
This Bash script automates the security audit and hardening process on Linux servers. It checks for common security vulnerabilities, ensures proper network configurations, and applies necessary hardening measures. The script is modular, allowing it to be easily reused across multiple servers to maintain stringent security standards.

Features
User and Group Audits: Lists all users and groups, identifies users with root privileges, and checks for weak or missing passwords.
File and Directory Permissions: Scans for world-writable files, insecure .ssh directories, and files with SUID/SGID bits.
Service Audits: Lists running services, checks for unauthorized services, and ensures critical services are properly configured.
Firewall and Network Security: Verifies firewall status, lists open ports, and checks for insecure network configurations.
IP and Network Configuration Checks: Identifies public and private IP addresses and ensures sensitive services are not exposed on public IPs.
Security Updates and Patching: Checks for available security updates and ensures automatic security updates are enabled.
Log Monitoring: Scans logs for suspicious activity, such as failed SSH login attempts.
Server Hardening: Implements SSH key-based authentication, disables IPv6 if not needed, secures the GRUB bootloader, and configures the firewall.
Custom Security Checks: Allows for the addition of custom security checks via a configuration file.
Reporting and Alerting: Generates a summary report and sends email alerts if critical issues are found.
Usage
Run the Script:

Copy code
sudo ./user_group_audit.sh
sudo ./file_permission_audit.sh
sudo ./service_audit.sh
sudo ./firewall_network_audit.sh
sudo ./ip_network_check.sh
sudo ./security_updates.sh
sudo ./log_monitoring.sh
sudo ./server_hardening.sh
sudo ./custom_security_checks.sh
sudo ./reporting_alerting.sh

This will perform a comprehensive security audit and apply hardening measures.

Email Alerts:

Update the ALERT_EMAIL variable in the script with your email address to receive alerts.
Custom Checks:

Define additional security checks in the /etc/custom_security_checks.conf file if needed.
Log File:

The script logs all actions and findings to /var/log/security_audit.log.
Scheduling:

Schedule the script to run periodically using cron for continuous monitoring and hardening.
Requirements
The script requires root privileges to perform security checks and apply hardening measures.
The server should have email configured for sending alerts.
Customization

