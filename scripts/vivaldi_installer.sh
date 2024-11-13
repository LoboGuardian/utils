#!/bin/bash

# Set download URL for Vivaldi rpm
vivaldi_url="https://downloads.vivaldi.com/stable/vivaldi-stable-7.0.3495.11-1.x86_64.rpm"

# Download directory (modify if desired)
download_dir="/tmp"

# Filename (extracted from URL)
filename=$(basename "$vivaldi_url")

# Check if 'dnf' package manager is available
if ! command -v dnf &> /dev/null; then
  echo "Error: 'dnf' package manager not found. Exiting."
  exit 1
fi

# Check if download directory exists
if [ ! -d "$download_dir" ]; then
  echo "Download directory '$download_dir' does not exist. Creating..."
  mkdir -p "$download_dir"
fi

# Download the Vivaldi rpm
echo "Downloading Vivaldi..."
wget -q -O "$download_dir/$filename" "$vivaldi_url"

# Check download status
if [ $? -ne 0 ]; then
  echo "Error: Download failed. Exiting."
  exit 1
fi

# Install the downloaded package
echo "Installing Vivaldi..."
sudo dnf install -y "$download_dir/$filename"

# Clean up (optional)
# uncomment the following line to remove downloaded file after installation
# rm -f "$download_dir/$filename"

echo "Vivaldi installation complete!"
