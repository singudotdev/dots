# dotfiles

Personal dotfiles for an Arch Linux desktop running [niri](https://github.com/YaLTeR/niri) as the Wayland compositor, styled with [DankMaterialShell](https://github.com/AvengeMedia/DankMaterialShell).

## What's inside

| Directory                                  | Description                                                                                     |
| ------------------------------------------ | ----------------------------------------------------------------------------------------------- |
| [`DankMaterialShell`](./DankMaterialShell) | Configuration for the DankMaterialShell desktop shell                                           |
| [`bottom`](./bottom)                       | Config for [bottom](https://github.com/ClementTsang/bottom), a terminal system monitor          |
| [`fetch`](./fetch)                         | Config for the system info fetch tool ([fastfetch](https://github.com/fastfetch-cli/fastfetch)) |
| [`fish`](./fish)                           | Config for the [fish](https://fishshell.com/) shell                                             |
| [`ghostty`](./ghostty)                     | Config for the [Ghostty](https://ghostty.org/) terminal emulator                                |
| [`niri`](./niri)                           | Config for the [niri](https://github.com/YaLTeR/niri) scrollable-tiling Wayland compositor      |
| [`starship`](./starship)                   | Config for the [Starship](https://starship.rs/) shell prompt                                    |
| [`zed`](./zed)                             | Config for the [Zed](https://zed.dev/) editor                                                   |
| [`init.sh`](./init.sh)                     | Bootstrap script: installs packages and symlinks configs into place                             |

## What `init.sh` does

Running `init.sh` on a fresh Arch install will:

1. Update the system and install core packages via `pacman`:
   `zed`, `vim`, `ghostty`, `starship`, `fish`, `bottom`, `eza`, `bat`, `fastfetch`, `flatpak`, `flatseal`, `ttf-hack-nerd`, `ttf-input-nerd`
2. Install a set of Flatpak apps: Brave Browser, Flatseal, Termius, Element (Riot), Kalk, and Telegram Desktop
3. Install [DankMaterialShell](https://github.com/AvengeMedia/DankMaterialShell) via its official install script
4. Symlink each config directory in this repo into the appropriate location under `~/.config` (replacing anything already there)
5. Reboot the system to apply everything

## Usage

> [!WARNING]
> This script installs packages system-wide, overwrites existing configuration files/symlinks under `~/.config`, and reboots your machine at the end. Review `init.sh` before running it, and back up any existing configs you care about.

```bash
git clone https://github.com/singudotdev/dots.git
cd dots
chmod +x init.sh
./init.sh
```

### What gets symlinked

| Source                   | Target                        |
| ------------------------ | ----------------------------- |
| `DankMaterialShell/`     | `~/.config/DankMaterialShell` |
| `fish/`                  | `~/.config/fish`              |
| `ghostty/`               | `~/.config/ghostty`           |
| `niri/`                  | `~/.config/niri`              |
| `zed/`                   | `~/.config/zed`               |
| `starship/starship.toml` | `~/.config/starship.toml`     |
| `fetch/`                 | `~/.config/fetch`             |

## Requirements

- Arch Linux (or an Arch-based distro) with `pacman`
- `sudo` privileges
- An internet connection (for package installs and the DankMaterialShell install script)

## License

No license specified — all rights reserved by default. Feel free to browse for inspiration, but ask before reusing wholesale.
