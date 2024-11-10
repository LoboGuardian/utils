#!/bin/bash

# Define the download URL for the 64-bit TeamViewer RPM package
TEAMVIEWER_URL="https://download.teamviewer.com/download/linux/teamviewer.x86_64.rpm"

# Define a temporary file name for the download
TEMP_FILE=/tmp/teamviewer.rpm

# Check if user has sudo privileges
if [[ $EUID -ne 0 ]]; then
  echo "This script requires sudo privileges. Please run with sudo."
  exit 1
fi

# Download the TeamViewer package
echo "Downloading TeamViewer..."
wget -O "$TEMP_FILE" "$TEAMVIEWER_URL"

# Check if download was successful
if [[ $? -ne 0 ]]; then
  echo "Error downloading TeamViewer package. Exiting..."
  exit 1
fi

# Install TeamViewer
echo "Installing TeamViewer..."
sudo yum install -y "$TEMP_FILE"

# Clean up temporary file (optional)
rm -f "$TEMP_FILE"

echo "TeamViewer installation complete!"
