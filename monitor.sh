#!/bin/bash

# Function to display top 10 most used applications by CPU and Memory
top_apps() {
  echo "Top 10 Applications by CPU Usage:"
  ps aux --sort=-%cpu | awk 'NR<=10{print $0}'
  echo ""
  echo "Top 10 Applications by Memory Usage:"
  ps aux --sort=-%mem | awk 'NR<=10{print $0}'
  echo ""
}

# Function to display network monitoring stats
network_monitoring() {
  echo "Network Monitoring:"

  # Number of concurrent connections
  echo "Number of concurrent connections:"
  ss -s | grep "estab" | awk '{print $4}'
  
  # Packet drops
  echo "Packet drops:"
  ip -s link | grep "RX:" -A 4 | grep "dropped" | awk '{print "RX drops:", $4, "TX drops:", $8}'

  # Network Traffic (MB in/out)
  echo "Network Traffic (MB in/out):"
  ip -s link | grep "RX:" -A 1 | awk '/RX:/ {getline; print "In:", $1/1024/1024, "MB"}'
  ip -s link | grep "TX:" -A 1 | awk '/TX:/ {getline; print "Out:", $1/1024/1024, "MB"}'

  echo ""
}

# Call the function to test it
network_monitoring


# Function to display disk usage
disk_usage() {
  echo "Disk Usage:"
  df -h | awk '$5 > 80 {print "WARNING: "$0} $5 <= 80 {print $0}'
  echo ""
}

# Function to display system load
system_load() {
  echo "System Load:"
  uptime
  echo "CPU Breakdown (user/system/idle):"
  mpstat | awk '/all/ {print "User: " $3 "%", "System: " $5 "%", "Idle: " $12 "%"}'
  echo ""
}

# Function to display memory usage
memory_usage() {
  echo "Memory Usage:"
  free -h
  echo "Swap Usage:"
  swapon --show
  echo ""
}

# Function to display process monitoring
process_monitoring() {
  echo "Process Monitoring:"
  echo "Number of Active Processes:"
  ps -e | wc -l
  echo "Top 5 Processes by CPU Usage:"
  ps aux --sort=-%cpu | awk 'NR<=5{print $0}'
  echo "Top 5 Processes by Memory Usage:"
  ps aux --sort=-%mem | awk 'NR<=5{print $0}'
  echo ""
}

# Function to display service monitoring
service_monitoring() {
  echo "Service Monitoring:"
  services=("sshd" "nginx" "apache2" "iptables")
  for service in "${services[@]}"; do
    systemctl is-active --quiet $service && echo "$service is running" || echo "$service is NOT running"
  done
  echo ""
}

# Main script functionality
main() {
  case "$1" in
    -cpu) top_apps ;;
    -network) network_monitoring ;;
    -disk) disk_usage ;;
    -load) system_load ;;
    -memory) memory_usage ;;
    -process) process_monitoring ;;
    -service) service_monitoring ;;
    *)
      top_apps
      network_monitoring
      disk_usage
      system_load
      memory_usage
      process_monitoring
      service_monitoring
      ;;
  esac
}

# Refresh dashboard every few seconds if no switch is provided
if [ -z "$1" ]; then
  while true; do
    clear
    main
    sleep 5
  done
else
  main "$1"
fi

