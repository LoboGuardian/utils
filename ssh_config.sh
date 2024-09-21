#!/bin/bash

# Check if openssh is installed
if ! pacman -Q openssh > /dev/null; then
  echo "openssh is not installed. Installing now..."
  sudo pacman -S openssh-server
fi

# Check if sshd service is enabled
if ! systemctl is-enabled sshd; then
  echo "sshd service is not enabled. Enabling now..."
  sudo systemctl enable sshd
fi

# Check if sshd service is active
if ! systemctl is-active sshd; then
  echo "sshd service is not active. Starting now..."
  sudo systemctl start sshd
fi

# Check if sshd service is running
if ! systemctl status sshd | grep -q "running"; then
  echo "sshd service is not running. Starting now..."
  sudo systemctl start sshd
fi

# Get IP address
# ifconfig | grep -Eo 'inet addr: (.*)' | cut -d ' ' -f 2
# ip addr
