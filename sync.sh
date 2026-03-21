#!/usr/bin/env bash
# Syncs current config files back into the dotfiles repo

DOTFILES="$(cd "$(dirname "$0")" && pwd)"

# Clear directories
rm -rf "$DOTFILES/config"
rm -rf "$DOTFILES/packages"

mkdir -p config
mkdir -p packages

echo "Syncing config files to dotfiles repo..."

# Config directories
for dir in hypr waybar kitty rofi dunst yazi fastfetch; do
    echo "  → $dir"
    cp -r ~/.config/$dir "$DOTFILES/config"
done

# Standalone config files
cp ~/.config/starship.toml "$DOTFILES/config/"
cp ~/.config/kwalletrc "$DOTFILES/config/"

# Home dotfiles
cp ~/.zshrc "$DOTFILES/home/"

# Package lists
pacman -Qqen > "$DOTFILES/packages/pacman.txt"
pacman -Qqem > "$DOTFILES/packages/aur.txt"

echo "Done. Don't forget to git commit and push!"
