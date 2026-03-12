<h1 align="center">
  <br>
  I . A . M
  <br>
</h1>

<p align="center">
  <i>I have a mouth. And I will scream.</i><br>
  <sub>An opinionated Arch Linux rice for cybersecurity students who refuse to be ugly.</sub>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/arch-btw-1793d1?style=flat-square&logo=archlinux&logoColor=white" />
  <img src="https://img.shields.io/badge/wayland-niri-a63d4f?style=flat-square" />
  <img src="https://img.shields.io/badge/theme-noir-0e0e0e?style=flat-square" />
  <img src="https://img.shields.io/badge/license-MIT-d4d0ce?style=flat-square" />
</p>

---

## The Problem

You're studying cybersecurity. Your options are:

- **Kali Linux** — bloated, ugly, ships 600 tools you'll never touch
- **Parrot OS** — slightly better, still looks like 2012
- **Arch + ricing** — beautiful, but now you're spending hours installing security tools on top

Every "hacker distro" prioritizes tooling over experience. Every Arch rice prioritizes aesthetics over function. You shouldn't have to choose.

## The Solution

**I.A.M** is a dotfiles-first Arch Linux setup that looks stunning and works for security.

Rice-first. Security-ready. No compromises.

---

## Stack

| Layer | Choice |
|---|---|
| **Compositor** | [Niri](https://github.com/YaLTeR/niri) (scrollable tiling Wayland) |
| **Desktop Shell** | [Noctalia](https://noctalia.dev) (bar, launcher, control center) |
| **Terminal** | [Ghostty](https://ghostty.org) + custom GLSL shaders |
| **CLI Shell** | [Fish](https://fishshell.com) + [Starship](https://starship.rs) prompt |
| **Editor** | [Neovim](https://neovim.io) (LazyVim) + [Zed](https://zed.dev) |
| **File Manager** | [Yazi](https://yazi-rs.github.io) (TUI) + [Thunar](https://docs.xfce.org/xfce/thunar/start) (GUI) |
| **Browser** | [Brave](https://brave.com) |
| **Notifications** | [Mako](https://github.com/emersion/mako) |
| **Launcher** | [Fuzzel](https://codeberg.org/dnkl/fuzzel) + Noctalia launcher |
| **Lock Screen** | [swaylock-effects](https://github.com/mortie/swaylock-effects) (blur + vignette) |
| **Wallpaper** | [swww](https://github.com/LGFae/swww) (animated transitions) |
| **Login** | [SDDM](https://github.com/sddm/sddm) + Sugar Dark theme |
| **Fonts** | JetBrains Mono Nerd, Fira Code, Noto (CJK + Emoji) |
| **Icons** | Papirus |
| **Cursor** | Bibata Modern Classic |

### CLI Arsenal

```
bat  eza  fd  ripgrep  fzf  zoxide  atuin  btop  bottom
dust  duf  procs  lazygit  git-delta  jq  just  tokei  yazi
fastfetch  cava  cmatrix  cbonsai  pipes.sh  tty-clock  lolcat
```

---

## Noir Theme

A dark, desaturated palette with blood-red accents. Applied everywhere — terminal, shell, editor, GTK, lock screen.

```
 Background     #0e0e0e  ████████
 Surface        #1c1c1c  ████████
 Border         #2a2a2a  ████████
 Text           #d4d0ce  ████████
 Muted          #8a8a8a  ████████
 Accent         #a63d4f  ████████
 Accent Light   #c45c6e  ████████
 Accent Deep    #7a2e3c  ████████
 Error          #c45c5c  ████████
```

Terminal colors follow the same muted-noir aesthetic with desaturated greens, yellows, blues, and magentas.

---

## Keybinds

All keybinds use `Super` (Mod) as the modifier. Vim-style (`h/j/k/l`) navigation works alongside arrow keys.

### Essentials

| Key | Action |
|---|---|
| `Mod + Return` | Terminal (Ghostty) |
| `Mod + D` | App launcher |
| `Mod + B` | Browser (Brave) |
| `Mod + E` | File manager (Thunar) |
| `Mod + Z` | Editor (Zed) |
| `Mod + T` | System monitor (btop) |
| `Mod + Q` | Close window |
| `Mod + Tab` | Overview |

### Window Management

| Key | Action |
|---|---|
| `Mod + H/L` or `Arrows` | Focus left/right column |
| `Mod + J/K` or `Arrows` | Focus down/up window |
| `Mod + Shift + Arrows` | Move window |
| `Mod + F` | Maximize column |
| `Mod + Shift + F` | Fullscreen |
| `Mod + R` | Cycle column width (1/3, 1/2, 2/3) |
| `Mod + -/=` | Shrink/grow column 10% |

### Floating

| Key | Action |
|---|---|
| `Mod + Space` | Toggle floating |
| `Mod + Shift + Space` | Switch focus between floating/tiled |
| `Mod + drag` | Move floating window |
| `Mod + right-drag` | Resize floating window |

### Workspaces

| Key | Action |
|---|---|
| `Mod + 1-9` | Switch workspace |
| `Mod + Shift + 1-9` | Move window to workspace |
| `Mod + PgUp/PgDn` | Adjacent workspace |

### System

| Key | Action |
|---|---|
| `Mod + N` | Control center |
| `Mod + V` | Clipboard history |
| `Mod + Shift + W` | Random wallpaper (animated transition) |
| `Mod + P` | Wallpaper picker |
| `Mod + X` | Lock screen |
| `Mod + Shift + E` | Power menu |
| `Mod + S` | Screenshot (region) |
| `Mod + Shift + S` | Screenshot (screen) |
| `Mod + /` | Show all keybinds |

---

## Structure

Uses [GNU Stow](https://www.gnu.org/software/stow/) — each top-level directory is an independent stow package that symlinks into `$HOME`.

```
project-i-a-m/
├── rice/                          # stow rice → visual/desktop configs
│   └── .config/
│       ├── niri/                  # Compositor (keybinds, layout, shaders)
│       ├── ghostty/               # Terminal (Noir colors, GLSL shaders)
│       ├── noctalia/              # Shell panel (Noir colorscheme)
│       ├── cava/                  # Audio visualizer (shaders + themes)
│       ├── fastfetch/             # System info fetch
│       ├── fuzzel/                # Launcher
│       ├── mako/                  # Notifications
│       ├── wlogout/               # Power menu
│       ├── waypaper/              # Wallpaper picker
│       ├── yazi/                  # File manager theme
│       ├── btop/                  # System monitor theme
│       ├── starship.toml          # Prompt theme
│       ├── gtk-3.0/               # GTK3 theme
│       ├── gtk-4.0/               # GTK4 theme
│       ├── Thunar/                # File manager config
│       ├── xfce4/                 # Thunar XML config
│       ├── mimeapps.list          # Default applications
│       └── user-dirs.dirs         # XDG user directories
├── shell/                         # stow shell → shell/editor configs
│   └── .config/
│       ├── fish/                  # Shell (aliases, plugins, greeting)
│       ├── atuin/                 # Shell history sync
│       ├── nvim/                  # Neovim (LazyVim)
│       └── zed/                   # Editor settings
├── security/                      # stow security → security tool configs
│   └── .config/                   # (grows as tools get configured)
├── scripts/                       # stow scripts → user scripts
│   └── .local/bin/
│       ├── wallswitch             # Wallpaper switcher
│       ├── wallpaper-rotate       # Wallpaper rotation daemon
│       └── wall-fetch             # Wallpaper fetch utility
├── system/                        # NOT stowed — deployed with sudo cp
│   ├── etc/                       # System configs (SDDM, GRUB, locale)
│   └── usr/                       # SDDM theme overrides
├── packages/
│   ├── rice.txt                   # Visual/desktop packages
│   ├── shell.txt                  # Shell/CLI/dev packages
│   ├── security.txt               # Pentesting & CTF toolkit
│   └── base.txt                   # System base + drivers
└── install.sh                     # Installer (packages + stow)
```

---

## Installation

### Prerequisites

- Arch Linux installed (base + base-devel)
- An AUR helper (`yay` recommended)
- Wayland-compatible GPU (AMD recommended, NVIDIA works with caveats)

### Quick Start

```bash
git clone https://github.com/youruser/project-i-a-m.git ~/project-i-a-m
cd ~/project-i-a-m
./install.sh install                  # Install all packages + stow all configs
./install.sh system                   # Deploy system configs (requires sudo)
sudo systemctl enable sddm NetworkManager
```

### Selective Install

```bash
# Install only what you want
./install.sh packages rice shell      # Install rice + shell packages
./install.sh stow rice shell scripts  # Stow only those configs
./install.sh packages security        # Add security toolkit later

# Remove a config layer without affecting others
./install.sh unstow security
```

### Manual Stow

```bash
cd ~/project-i-a-m
stow rice                            # Symlinks rice/.config/* → ~/.config/*
stow shell                           # Symlinks shell/.config/* → ~/.config/*
stow scripts                         # Symlinks scripts/.local/bin/* → ~/.local/bin/*
stow -D rice                         # Remove rice symlinks
```

### Wallpapers

Drop your wallpapers in `~/Pictures/Wallpapers/`. Press `Mod + W` to cycle with animated transitions.

---

## Security Toolkit

HTB/THM-ready out of the box. Install with `./install.sh packages security`.

| Category | Tools |
|---|---|
| **Recon** | nmap, masscan, whois, dnsutils, whatweb, enum4linux |
| **Web** | gobuster, feroxbuster, dirb, nikto, sqlmap, burpsuite |
| **Passwords** | hashcat, john, hydra |
| **Network** | wireshark, tcpdump, netcat, socat, traceroute, net-tools |
| **Exploitation** | metasploit, exploitdb |
| **Wordlists** | seclists, wordlistctl |
| **VPN/Proxy** | openvpn, wireguard-tools, proxychains-ng, tor |

---

## Roadmap

- [x] GNU Stow-based dotfile management
- [x] Cybersecurity tool bundles
- [ ] Automated installer (omarchy-style TUI)
- [ ] Custom ISO for live USB boot
- [ ] Screenshot gallery

---

## Credits

- [Niri](https://github.com/YaLTeR/niri) — the scrollable tiling compositor that makes this possible
- [Noctalia Shell](https://github.com/noctalia-dev/noctalia-shell) — the desktop shell powering the bar, launcher, and control center
- [LazyVim](https://www.lazyvim.org/) — Neovim, configured
- Theme inspired by noir cinema and Harlan Ellison's vision of machines that think

## License

MIT
