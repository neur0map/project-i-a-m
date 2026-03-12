#!/usr/bin/env bash
#
# project-i-a-m installer
# Uses GNU Stow to deploy dotfiles as symlinks
#
set -euo pipefail

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
PACKAGES_DIR="$REPO_DIR/packages"
STOW_PACKAGES=(rice shell security scripts)

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

info()  { echo -e "${GREEN}[+]${NC} $*"; }
warn()  { echo -e "${YELLOW}[!]${NC} $*"; }
error() { echo -e "${RED}[x]${NC} $*" >&2; }

usage() {
    cat <<EOF
Usage: $(basename "$0") [command] [options]

Commands:
  install [group...]   Install packages and stow configs (default: all)
  stow [package...]    Stow config packages only (default: all)
  unstow [package...]  Remove stowed symlinks (default: all)
  packages [group...]  Install packages only (default: all)
  system               Deploy system configs (requires sudo)

Groups:  rice, shell, security, base
Stow:    rice, shell, security, scripts

Examples:
  ./install.sh install              # Install everything
  ./install.sh stow rice shell      # Only stow rice + shell configs
  ./install.sh packages security    # Only install security packages
  ./install.sh system               # Deploy /etc configs
EOF
}

check_deps() {
    if ! command -v stow &>/dev/null; then
        error "GNU Stow not found. Install with: sudo pacman -S stow"
        exit 1
    fi
    if ! command -v yay &>/dev/null; then
        warn "yay not found — using pacman (AUR packages will be skipped)"
    fi
}

install_packages() {
    local groups=("$@")
    [[ ${#groups[@]} -eq 0 ]] && groups=(base rice shell)

    local pkg_manager="yay"
    command -v yay &>/dev/null || pkg_manager="sudo pacman"

    for group in "${groups[@]}"; do
        local file="$PACKAGES_DIR/${group}.txt"
        if [[ ! -f "$file" ]]; then
            warn "Package list not found: $file"
            continue
        fi

        info "Installing ${group} packages..."
        # Strip comments and empty lines
        local pkgs
        pkgs=$(grep -v '^#' "$file" | grep -v '^$' | tr '\n' ' ')
        # shellcheck disable=SC2086
        $pkg_manager -S --needed --noconfirm $pkgs || {
            warn "Some ${group} packages may have failed — check output above"
        }
    done
}

stow_packages() {
    local packages=("$@")
    [[ ${#packages[@]} -eq 0 ]] && packages=("${STOW_PACKAGES[@]}")

    cd "$REPO_DIR"
    for pkg in "${packages[@]}"; do
        if [[ ! -d "$pkg" ]]; then
            warn "Stow package not found: $pkg"
            continue
        fi
        info "Stowing ${pkg}..."
        stow --restow --target="$HOME" "$pkg"
    done
}

unstow_packages() {
    local packages=("$@")
    [[ ${#packages[@]} -eq 0 ]] && packages=("${STOW_PACKAGES[@]}")

    cd "$REPO_DIR"
    for pkg in "${packages[@]}"; do
        if [[ ! -d "$pkg" ]]; then
            warn "Stow package not found: $pkg"
            continue
        fi
        info "Unstowing ${pkg}..."
        stow --delete --target="$HOME" "$pkg"
    done
}

deploy_system() {
    info "Deploying system configs..."
    if [[ ! -d "$REPO_DIR/system" ]]; then
        warn "No system/ directory found"
        return
    fi
    sudo cp -rv "$REPO_DIR/system/etc/"* /etc/ 2>/dev/null || true
    sudo cp -rv "$REPO_DIR/system/usr/"* /usr/ 2>/dev/null || true
    info "System configs deployed"
}

main() {
    local cmd="${1:-}"
    shift 2>/dev/null || true

    case "$cmd" in
        install)
            check_deps
            install_packages "$@"
            stow_packages "$@"
            info "Done! Configs are symlinked."
            ;;
        stow)
            check_deps
            stow_packages "$@"
            ;;
        unstow)
            check_deps
            unstow_packages "$@"
            ;;
        packages)
            install_packages "$@"
            ;;
        system)
            deploy_system
            ;;
        -h|--help|help)
            usage
            ;;
        *)
            usage
            exit 1
            ;;
    esac
}

main "$@"
