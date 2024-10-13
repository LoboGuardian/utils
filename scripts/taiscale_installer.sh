#!/bin/bash

# Download and install Tailscale
curl -fsSL https://tailscale.com/install.sh | sh

# Add your custom commands here, for example:
tailscale up
tailscale login

# Completion message
echo "Tailscale installation complete."