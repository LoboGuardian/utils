#!/bin/bash

# Define the .nanorc file location
NANORC_FILE="$HOME/.nanorc"

# Check if the .nanorc file exists; create it if not
if [ ! -f "$NANORC_FILE" ]; then
    touch "$NANORC_FILE"
fi

# Enable line numbers and soft wrap by appending to ~/.nanorc
# Append the comments and settings to the .nanorc file
{
    echo "# .nanorc Configuration File"
    echo ""
    echo "# Enable line numbers in the left margin for easier navigation"
    echo "set linenumbers"
    echo ""
    echo "# Wrap long lines at the edge of the screen for better readability"
    echo "set softwrap"
    echo ""
    echo "# Treat consecutive blank lines as a single blank line"
    echo "set atblanks"
    echo ""
    echo "# Automatically indent new lines to match the previous line's indentation"
    echo "set autoindent"
    echo ""
    echo "# Enable visual indicators for selected text and operation status"
    echo "set indicator"
    echo ""
    echo "# Show a minimized toolbar at the bottom for additional options"
    echo "set minibar"
    echo ""
    echo "# Set 'hunspell' as the spell checker for real-time spelling assistance"
    echo "set speller hunspell"
} >> "$NANORC_FILE"

echo ".nanorc has been updated."

echo "Nano has been configured. You can check your $NANORC_FILE."
