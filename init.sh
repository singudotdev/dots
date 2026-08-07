#!/bin/bash

# This script sets up a new Arch Linux system by updating the system, installing necessary packages, creating symlinks for configuration files, and configuring git and other tools.
echo "=== Arch Linux Setup Script ==="

# Ask for executing user confirmation
read -p "This script will update the system, install packages, and configure settings. Do you want to continue? (y/n): " confirm
if [[ "$confirm" != "y" && "$confirm" != "Y" ]]; then
    echo "Operation cancelled by user."
    exit 1
fi

# Update system and install packages
sudo pacman -Syyu --noconfirm
sudo pacman -Sy git man-db zed vim ghostty starship fish bottom eza bat fastfetch flatpak flatseal ollama opencode ttf-hack-nerd ttf-input-nerd --noconfirm

flatpak install -y com.brave.Browser com.github.tchx84.Flatseal com.termius.Termius im.riot.Riot org.kde.kalk org.telegram.desktop

# Install DankMaterialShell
curl -fsSL https://install.danklinux.com | sh

# Set directory variables
USER_HOME="$(getent passwd "$(whoami)" | cut -d: -f6)"
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Function to create symlinks and replace existing files/directories
link_replace() {
    local source="$1"
    local target="$2"

    if [ -e "$target" ] || [ -L "$target" ]; then
        rm -rf "$target"
        echo "✓ Removed: $target"
    fi

    mkdir -p "$(dirname "$target")"

    ln -sf "$source" "$target"
    echo "✓ Symlink created: $target -> $source"
}

# Create symlinks for configuration files
link_replace "${DOTFILES_DIR}/DankMaterialShell" "${USER_HOME}/.config/DankMaterialShell"
link_replace "${DOTFILES_DIR}/fish" "${USER_HOME}/.config/fish"
link_replace "${DOTFILES_DIR}/ghostty" "${USER_HOME}/.config/ghostty"
link_replace "${DOTFILES_DIR}/niri" "${USER_HOME}/.config/niri"
link_replace "${DOTFILES_DIR}/zed" "${USER_HOME}/.config/zed"
link_replace "${DOTFILES_DIR}/starship/starship.toml" "${USER_HOME}/.config/starship.toml"
link_replace "${DOTFILES_DIR}/fetch" "${USER_HOME}/.config/fetch"

# Disable bluetooth at start
sudo sed -i 's/^#AutoEnable=true/AutoEnable=false/' /etc/bluetooth/main.conf

# Set git user config
git config --global user.email "contact@singu.dev"
git config --global user.name "singudotdev"

# Install Claude Code
curl -fsSL https://claude.ai/install.sh | bash

# Echo completion message
echo ""
echo "[OK]: All configurations linked successfully!"

echo ""
echo "[INFO]: Rebooting system..."
sleep 5
sudo reboot
