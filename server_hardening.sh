#!/bin/bash
# server_hardening.sh

echo "Server Hardening:"
echo "-----------------"

# SSH Configuration
echo "Configuring SSH for key-based authentication and disabling root login:"
sed -i 's/PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
sed -i 's/PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
systemctl restart ssh || systemctl restart sshd

# Disabling IPv6 if not required
echo "Disabling IPv6:"
echo "net.ipv6.conf.all.disable_ipv6 = 1" >> /etc/sysctl.conf
echo "net.ipv6.conf.default.disable_ipv6 = 1" >> /etc/sysctl.conf
echo "net.ipv6.conf.lo.disable_ipv6 = 1" >> /etc/sysctl.conf
sysctl -p

# Securing the GRUB bootloader
echo "Securing the GRUB bootloader:"

# Define a password for GRUB
GRUB_PASSWORD="your_secure_password_here"

# Generate the hashed password
grub_pbkdf2_password=$(echo -e "$GRUB_PASSWORD\n$GRUB_PASSWORD" | grub-mkpasswd-pbkdf2 | grep "grub.pbkdf2" | awk '{print $7}')

# Add the password to GRUB configuration
echo "set superusers=\"root\"" >> /etc/grub.d/40_custom
echo "password_pbkdf2 root ${grub_pbkdf2_password}" >> /etc/grub.d/40_custom

# Update GRUB
update-grub

echo "Hardening completed."


