<div align="center">

<img src="https://capsule-render.vercel.app/api?type=waving&color=0:0D1B2A,100:1B263B&height=180&section=header&text=dotfiles&fontSize=44&fontColor=64FFDA&fontAlignY=35&fontFamily=Courier%20New&desc=Arch%20Linux%20%C2%B7%20niri%20%C2%B7%20Hibrid%20AI&descAlignY=58&descSize=16&descColor=8892B0&animation=fadeIn" width="100%"/>

<img src="https://img.shields.io/badge/niri-0D1B2A?style=for-the-badge" />
<img src="https://img.shields.io/badge/DankMaterialShell-0D1B2A?style=for-the-badge" />
<img src="https://img.shields.io/badge/fish-0D1B2A?style=for-the-badge" />
<img src="https://img.shields.io/badge/ghostty-0D1B2A?style=for-the-badge" />
<img src="https://img.shields.io/badge/starship-0D1B2A?style=for-the-badge" />
<img src="https://img.shields.io/badge/zed-0D1B2A?style=for-the-badge" />
<img src="https://img.shields.io/badge/AI-0D1B2A?style=for-the-badge" />

</div>

Personal dotfiles for an Arch Linux desktop running [niri](https://github.com/YaLTeR/niri) as the Wayland compositor, styled with [DankMaterialShell](https://github.com/AvengeMedia/DankMaterialShell).

## What's inside

| Directory                                                                | Description                                                                                     |
| ------------------------------------------------------------------------ | ----------------------------------------------------------------------------------------------- |
| [`DankMaterialShell`](/singudotdev/dotfiles/blob/main/DankMaterialShell) | Configuration for the DankMaterialShell desktop shell                                           |
| [`bottom`](/singudotdev/dotfiles/blob/main/bottom)                       | Config for [bottom](https://github.com/ClementTsang/bottom), a terminal system monitor          |
| [`fetch`](/singudotdev/dotfiles/blob/main/fetch)                         | Config for the system info fetch tool ([fastfetch](https://github.com/fastfetch-cli/fastfetch)) |
| [`fish`](/singudotdev/dotfiles/blob/main/fish)                           | Config for the [fish](https://fishshell.com/) shell                                             |
| [`ghostty`](/singudotdev/dotfiles/blob/main/ghostty)                     | Config for the [Ghostty](https://ghostty.org/) terminal emulator                                |
| [`niri`](/singudotdev/dotfiles/blob/main/niri)                           | Config for the [niri](https://github.com/YaLTeR/niri) scrollable-tiling Wayland compositor      |
| [`starship`](/singudotdev/dotfiles/blob/main/starship)                   | Config for the [Starship](https://starship.rs/) shell prompt                                    |
| [`zed`](/singudotdev/dotfiles/blob/main/zed)                             | Config for the [Zed](https://zed.dev/) editor                                                   |
| [`init.sh`](/singudotdev/dotfiles/blob/main/init.sh)                     | Bootstrap script: installs packages and symlinks configs into place                             |

## What `init.sh` does

Running `init.sh` on a fresh Arch install will:

1. **Full system update** — `pacman -Syyu` brings the system fully up to date.
2. **Install pacman packages** — `git`, `man-db`, `zed`, `vim`, `ghostty`, `starship`, `fish`, `bottom`, `eza`, `bat`, `fastfetch`, `flatpak`, `flatseal`, `ollama`, `opencode`, `ttf-hack-nerd`, `ttf-input-nerd`.
3. **Install Flatpak applications** — Brave Browser, Flatseal, Termius, Element (Riot), KDE Kalk, and Telegram Desktop via `flatpak install`.
4. **Install DankMaterialShell** — `curl -fsSL https://install.danklinux.com | sh`.
5. **Symlink configuration files** — replaces and relinks configs from the repo into `~/.config/` (see table below).
6. **Disable Bluetooth auto-enable** — sets `AutoEnable=false` in `/etc/bluetooth/main.conf`.
7. **Set git identity** — configures `user.name` and `user.email` globally (`singudotdev` / `contact@singu.dev`).
8. **Install Claude Code** — `curl -fsSL https://claude.ai/install.sh | bash`.
9. **Reboot** — after a 5-second countdown.

> [!NOTE]
> Step 7 hardcodes `singudotdev` / `contact@singu.dev` as the global git identity. That's fine for personal use, but if this repo is ever cloned or forked by someone else, that line in `init.sh` needs to be changed to their own name/email before running it.

## Usage

> [!WARNING]
> This script installs packages system-wide, overwrites existing configuration files/symlinks under `~/.config`, and reboots your machine at the end. Review `init.sh` before running it, and back up any existing configs you care about.

If you're cloning this repo, note that a fresh Arch install doesn't ship `git` by default:bash
sudo pacman -Sy git
git clone https://github.com/singudotdev/dotfiles.git
cd dotfiles
./init.sh
Already have the repo on disk some other way (copied over, downloaded as an archive, baked into an install image)? Skip straight to `./init.sh` — `git` doesn't need to be pre-installed, it's installed for you as part of step 1 below.

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

- `pacman` (Arch Linux or an Arch-based distro)
- `sudo` privileges
- Internet connection

## License

No license specified — all rights reserved by default. Feel free to browse for inspiration, but ask before reusing wholesale.

<div align="center">
<img src="https://capsule-render.vercel.app/api?type=waving&color=0:1B263B,100:0D1B2A&height=100&section=footer"/>
</div>
