#!/bin/bash

sudo pacman -Syyu
sudo pacman -Sy zed vim ghostty starship fish bottom eza bat fastfetch flatpak flatseal nerd-fonts

flatpak install -y com.brave.Browser com.github.tchx84.Flatseal com.termius.Termius com.vysp3r.ProtonPlus im.riot.Riot org.kde.kalk org.telegram.desktop

curl -fsSL https://install.danklinux.com | sh

cp -r ./DankMaterialShell/* ~/.config/DankMaterialShell/
cp -r ./fish/* ~/.config/fish/
cp -r ./ghostty/* ~/.config/ghostty/
cp -r ./niri/* ~/.config/niri/
cp -r ./zed/* ~/.config/zed/
cp -r ./starship/* ~/.config/starship/
cp ./starship/starship.toml ~/.config/starship.toml
