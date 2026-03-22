## Arch Linux dotfiles
The entire setup lives in two places:

- **Config files** — everything in `~/.config/`, `~/.zshrc`, etc.
- **Packages** — the list of everything you installed with pacman/yay

## Stack

- **WM**: Hyprland
- **Bar**: Waybar
- **Terminal**: Kitty
- **Shell**: Zsh + Oh My Zsh + Starship
- **Launcher**: Rofi
- **Notifications**: Dunst
- **File manager**: Yazi + Dolphin
- **Theme**: Catppuccin Mocha

```
dotfiles/
├── install.sh              # master install script
├── packages/
│   ├── pacman.txt          # official packages
│   └── aur.txt             # AUR packages
├── home/
│   └── .zshrc              # files that live in ~
└── config/
    ├── hypr/
    │   ├── hyprland.conf
    │   ├── hyprpaper.conf
    │   └── hyprlock.conf
    ├── waybar/
    │   ├── config.jsonc
    │   └── style.css
    ├── kitty/
    │   └── kitty.conf
    ├── rofi/
    │   ├── config.rasi
    │   └── powermenu.sh
    ├── dunst/
    │   └── dunstrc
    ├── yazi/
    │   ├── yazi.toml
    │   ├── keymap.toml
    │   └── theme.toml
    ├── fastfetch/
    │   └── config.jsonc
    └── starship.toml
```

## Install
```shell
git clone git@github.com:robinvanderknaap/arch-dotfiles.git

cd arch-dotfiles

./install.sh
```

## Sync
Use sync script to update this repository with you current config and packages

```shell
./sync.sh
```



