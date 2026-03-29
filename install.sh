#!/usr/bin/env bash
# ─────────────────────────────────────────────
# Dotfiles install script
# Usage: bash install.sh
# ─────────────────────────────────────────────

set -e  # exit immediately if any command fails

DOTFILES="$(cd "$(dirname "$0")" && pwd)"  # absolute path to this repo

echo "──────────────────────────────────"
echo " Dotfiles Installer"
echo "──────────────────────────────────"

# ── 1. System update ──────────────────────────
echo "[1/6] Updating system..."
sudo pacman -Syu --noconfirm

# ── 2. Install yay ────────────────────────────
# echo "[2/6] Installing yay (AUR helper)..."
# if ! command -v yay &>/dev/null; then
#     sudo pacman -S --needed --noconfirm git base-devel
#     git clone https://aur.archlinux.org/yay.git /tmp/yay
#     cd /tmp/yay && makepkg -si --noconfirm
#     cd "$DOTFILES"
# else
#     echo "  yay already installed, skipping."
# fi

# # ── 3. Install packages ───────────────────────
# echo "[3/6] Installing packages from pacman.txt..."
# sudo pacman -S --needed --noconfirm - < "$DOTFILES/packages/pacman.txt"

# echo "[3/6] Installing AUR packages from aur.txt..."
# yay -S --needed --noconfirm - < "$DOTFILES/packages/aur.txt"

# # ── 4. Copy config files ──────────────────────
# echo "[4/6] Copying config files..."
# mkdir -p ~/.config

# for dir in "$DOTFILES"/config/*/; do
#     name=$(basename "$dir")
#     echo "  → ~/.config/$name"
#     cp -r "$dir" ~/.config/
# done

# # Copy starship.toml directly to ~/.config/
# if [ -f "$DOTFILES/config/starship.toml" ]; then
#     cp "$DOTFILES/config/starship.toml" ~/.config/starship.toml
# fi

# # ── 5. Copy home dotfiles ─────────────────────
# echo "[5/6] Copying home dotfiles..."
# for file in "$DOTFILES"/home/.*; do
#     [ -f "$file" ] || continue
#     name=$(basename "$file")
#     echo "  → ~/$name"
#     cp "$file" ~/
# done

# # ── 6. Enable services ────────────────────────
# echo "[6/6] Enabling services..."
# sudo systemctl enable sddm
# sudo systemctl enable bluetooth
# sudo systemctl enable NetworkManager
# systemctl --user enable pipewire pipewire-pulse wireplumber

# # ── Set zsh as default shell ──────────────────
# if [ "$SHELL" != "/bin/zsh" ]; then
#     echo "Setting zsh as default shell..."
#     chsh -s /bin/zsh
# fi

# # ── Install Oh My Zsh ─────────────────────────
# if [ ! -d "$HOME/.oh-my-zsh" ]; then
#     echo "Installing Oh My Zsh..."
#     sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
# fi

# # ── Install Zsh plugins ───────────────────────
# ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

# [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ] && \
#     git clone https://github.com/zsh-users/zsh-syntax-highlighting \
#     "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"

# [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ] && \
#     git clone https://github.com/zsh-users/zsh-autosuggestions \
#     "$ZSH_CUSTOM/plugins/zsh-autosuggestions"

# [ ! -d "$ZSH_CUSTOM/plugins/fzf-tab" ] && \
#     git clone https://github.com/Aloxaf/fzf-tab \
#     "$ZSH_CUSTOM/plugins/fzf-tab"

# # ── Catppuccin folders for Papirus ───────────────
# echo "Applying Catppuccin Mocha folders to Papirus..."
# catppuccin-papirus-folders -C mocha -a mauve

# # ── bat theme ─────────────────────────────────
# echo "Building bat theme cache..."
# mkdir -p "$(bat --config-dir)/themes"
# curl -so "$(bat --config-dir)/themes/Catppuccin-mocha.tmTheme" \
#   "https://raw.githubusercontent.com/catppuccin/bat/main/themes/Catppuccin%20Mocha.tmTheme"
# bat cache --build

# # ── Font cache ────────────────────────────────
# echo "Refreshing font cache..."
# fc-cache -fv

# # Install Claude
# echo "Installing Claude..."
# curl -fsSL https://claude.ai/install.sh | bash

echo ""
echo "──────────────────────────────────"
echo " Done! Please reboot."
echo "──────────────────────────────────"
