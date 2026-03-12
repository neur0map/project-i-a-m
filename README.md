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

Rice-first. Security-ready. No compromises.

## Quick Install

```bash
git clone https://github.com/neur0map/project-i-a-m.git ~/project-i-a-m
cd ~/project-i-a-m
./install.sh install        # packages + stow all configs
./install.sh system         # system configs (requires sudo)
sudo systemctl enable sddm NetworkManager
```

### Selective Install

```bash
./install.sh packages rice shell      # Install specific package groups
./install.sh stow rice shell scripts  # Stow specific configs
./install.sh packages security        # Add security toolkit later
./install.sh unstow security          # Remove a config layer
```

### Manual Stow

```bash
cd ~/project-i-a-m
stow rice       # rice/.config/* → ~/.config/*
stow shell      # shell/.config/* → ~/.config/*
stow scripts    # scripts/.local/bin/* → ~/.local/bin/*
stow -D rice    # remove rice symlinks
```

---

## Stack

| Layer | Choice |
|---|---|
| **Compositor** | [Niri](https://github.com/YaLTeR/niri) (scrollable tiling Wayland) |
| **Desktop Shell** | [Noctalia](https://noctalia.dev) (bar, launcher, control center) |
| **Terminal** | [Ghostty](https://ghostty.org) + custom GLSL shaders |
| **Shell** | [Fish](https://fishshell.com) + [Starship](https://starship.rs) |
| **Editor** | [Neovim](https://neovim.io) (LazyVim) + [Zed](https://zed.dev) |
| **File Manager** | [Yazi](https://yazi-rs.github.io) (TUI) + [Thunar](https://docs.xfce.org/xfce/thunar/start) (GUI) |
| **Browser** | [Brave](https://brave.com) |
| **Notifications** | [Mako](https://github.com/emersion/mako) |
| **Lock Screen** | [swaylock-effects](https://github.com/mortie/swaylock-effects) |
| **Wallpaper** | [swww](https://github.com/LGFae/swww) (animated transitions) |
| **Login** | [SDDM](https://github.com/sddm/sddm) + Sugar Dark |
| **Fonts** | JetBrains Mono Nerd, Fira Code, Noto (CJK + Emoji) |

---

## Structure

Uses [GNU Stow](https://www.gnu.org/software/stow/) — each directory is a stow package that symlinks into `$HOME`.

```
project-i-a-m/
├── rice/          .config/ → niri, ghostty, noctalia, cava, mako, fuzzel, swww ...
├── shell/         .config/ → fish, atuin, nvim, zed
├── security/      .config/ → security tool configs
├── scripts/       .local/bin/ → wallswitch, wallpaper-rotate, wall-fetch
├── system/        /etc, /usr → SDDM, GRUB, locale (deployed with sudo cp)
├── packages/      rice.txt, shell.txt, security.txt, base.txt
└── install.sh     installer (packages + stow)
```

---

<details>
<summary><strong>Keybinds</strong></summary>

All keybinds use `Super` (Mod). Vim-style (`h/j/k/l`) navigation works alongside arrow keys.

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
| `Mod + Shift + W` | Random wallpaper |
| `Mod + P` | Wallpaper picker |
| `Mod + X` | Lock screen |
| `Mod + Shift + E` | Power menu |
| `Mod + S` | Screenshot (region) |
| `Mod + Shift + S` | Screenshot (screen) |
| `Mod + /` | Show all keybinds |

</details>

<details>
<summary><strong>Noir Theme</strong></summary>

Terminal colors follow a muted-noir aesthetic with desaturated greens, yellows, blues, and magentas.

| Token | Hex |
|---|---|
| Background | `#0e0e0e` |
| Accent | `#a63d4f` |
| Text | `#d4d0ce` |

</details>

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
- [ ] [pkgtrack](https://github.com/neur0map/pkgtrack) — cross-manager package tracker TUI
- [ ] Screenshot gallery

---

## Credits

- [Niri](https://github.com/YaLTeR/niri) — scrollable tiling compositor
- [Noctalia Shell](https://github.com/noctalia-dev/noctalia-shell) — bar, launcher, control center
- [LazyVim](https://www.lazyvim.org/) — Neovim, configured
- Theme inspired by noir cinema and Harlan Ellison's vision of machines that think

## License

MIT
