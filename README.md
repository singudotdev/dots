<div align="center">

<img src="https://capsule-render.vercel.app/api?type=waving&color=0:0D1B2A,100:1B263B&height=180&section=header&text=dotfiles&fontSize=44&fontColor=64FFDA&fontAlignY=35&fontFamily=Courier%20New&desc=Arch%20Linux%20%C2%B7%20niri%20%C2%B7%20DankMaterialShell&descAlignY=58&descSize=16&descColor=8892B0&animation=fadeIn" width="100%"/>

<img src="https://img.shields.io/badge/Arch_Linux-0D1B2A?style=for-the-badge" />
<img src="https://img.shields.io/badge/niri-0D1B2A?style=for-the-badge" />
<img src="https://img.shields.io/badge/DankMaterialShell-0D1B2A?style=for-the-badge" />
<img src="https://img.shields.io/badge/fish-0D1B2A?style=for-the-badge" />
<img src="https://img.shields.io/badge/ghostty-0D1B2A?style=for-the-badge" />
<img src="https://img.shields.io/badge/starship-0D1B2A?style=for-the-badge" />
<img src="https://img.shields.io/badge/zed-0D1B2A?style=for-the-badge" />

</div>

<br/>

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

1. Full system update, then install core packages via `pacman`: `git`, `man-db`, `zed`, `vim`, `ghostty`, `starship`, `fish`, `bottom`, `eza`, `bat`, `fastfetch`, `flatpak`, `flatseal`, `ollama`, `opencode`, `ttf-hack-nerd`, `ttf-input-nerd`
2. Install a set of Flatpak apps: Brave Browser, Flatseal, Termius, Element (Riot), Kalk, and Telegram Desktop
3. Install [DankMaterialShell](https://github.com/AvengeMedia/DankMaterialShell) via `curl -fsSL https://install.danklinux.com | sh`
4. Symlink each config directory in this repo into the appropriate location under `~/.config` (replacing anything already there)
5. Disable Bluetooth auto-enable on boot (`/etc/bluetooth/main.conf`)
6. Set the global git identity (`user.name` / `user.email`)
7. Reboot the system to apply everything

> [!NOTE]
> Step 6 hardcodes `singudotdev` / `contact@singu.dev` as the global git identity. That's fine for personal use, but if this repo is ever cloned or forked by someone else, that line in `init.sh` needs to be changed to their own name/email before running it.

## Usage

> [!WARNING]
> This script installs packages system-wide, overwrites existing configuration files/symlinks under `~/.config`, and reboots your machine at the end. Review `init.sh` before running it, and back up any existing configs you care about.

If you're cloning this repo, note that a fresh Arch install doesn't ship `git` by default:

```sh
sudo pacman -Sy git
git clone https://github.com/singudotdev/dotfiles.git
cd dotfiles
chmod +x init.sh
./init.sh
```

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

- Arch Linux (or an Arch-based distro) with `pacman`
- `git`, only if cloning this repo (not installed by default on a base Arch system — not needed if you already have the repo on disk)
- `sudo` privileges
- An internet connection (for package installs and the DankMaterialShell install script)

## License

No license specified — all rights reserved by default. Feel free to browse for inspiration, but ask before reusing wholesale.

<img src="https://capsule-render.vercel.app/api?type=waving&color=0:1B263B,100:0D1B2A&height=100&section=footer" width="100%"/>
