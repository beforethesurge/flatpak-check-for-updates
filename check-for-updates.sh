#!/bin/sh

# New line to separate from other entries in potential log files
echo
# Outputs date for auditing
date

# Checks if Flatpak is installed and has updates available
echo
if command -v flatpak >/dev/null 2>&1; then
    echo "Flatpak is installed"
    flatpak_check_for_updates=$(flatpak update --noninteractive 2>&1)
    if echo "$flatpak_check_for_updates" | grep -q "Nothing to do"; then
        echo "✅ No Flatpak updates found"
    else
        echo "📦 Flatpak updates found. Downloading and installing updates..."
        flatpak update -y
    fi
else
    echo "❌ Flatpak is not installed; Skipping"
fi

echo
echo "----------------------------------"