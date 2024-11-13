#!/bin/bash

# Set URLs and directories
DOWNLOAD_URL="https://downloader.cursor.sh/linux/appImage/x64"
TMP_DIR="$HOME"
INSTALL_DIR="$HOME/.local" # Switch to .local/opt for better organization
APPIMAGE_NAME="cursor.AppImage"

# Download the AppImage to /tmp
echo "Downloading Cursor IDE to /tmp..."
wget -O "$TMP_DIR/$APPIMAGE_NAME" "$DOWNLOAD_URL"

# Check if the download was successful
if [[ $? -ne 0 ]]; then
echo "Failed to download Cursor IDE. Please check the download URL."
exit 1
fi

# Move the AppImage to the installation location
echo "Moving IDE Cursor to $INSTALL_DIR..."
sudo mv "$TMP_DIR/$APPIMAGE_NAME" "$INSTALL_DIR"

# Make the AppImage executable
chmod +x "$INSTALL_DIR/$APPIMAGE_NAME"

# Create the desktop file (with some enhancements)
echo "Creating desktop file..."
DESKTOP_FILE="$HOME/.local/share/applications/cursor.desktop"
cat << EOF > "$DESKTOP_FILE"
[Desktop Entry]
Name=Cursor
Exec=$INSTALL_DIR/$APPIMAGE_NAME
Terminal=false
Type=Application
Icon=$INSTALL_DIR/$APPIMAGE_NAME.png # Replace with correct icon
StartupWMClass=Cursor
Categories=Development
Comment=AI Code Editor
EOF

# Download an icon (optional)
# wget -O "$INSTALL_DIR/$APPIMAGE_NAME.png" "https://www.cursor.so/brand/icon.svg" # Uncomment to download the icon

# Inform the user
echo "Cursor IDE is installed in $INSTALL_DIR/$APPIMAGE_NAME"
echo "You can start it from the application menu or the terminal."
