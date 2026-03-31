# ── Oh My Zsh ─────────────────────────────────────────────
export ZSH="$HOME/.oh-my-zsh"

# Disable Oh My Zsh's own theme (we use Starship instead)
ZSH_THEME=""

# Plugins
plugins=(
    git                       # git aliases and info
    zsh-syntax-highlighting   # colour commands as you type
    zsh-autosuggestions       # history suggestions
    fzf-tab                   # fuzzy tab completion
    archlinux                 # pacman aliases (see below)
    sudo                      # press Escape twice to add sudo
    copypath                  # copy current path to clipboard
    dirhistory                # Alt+Left/Right to navigate dir history
)

source $ZSH/oh-my-zsh.sh

# ── Starship prompt ───────────────────────────────────────
eval "$(starship init zsh)"

# ── Zoxide (smart cd) ─────────────────────────────────────
#eval "$(zoxide init zsh)"

# ── Fastfetch on start ────────────────────────────────────
# fastfetch

# ── Aliases ───────────────────────────────────────────────
#alias ls='ls --color=auto'
#alias ll='ls -lah'
#alias la='ls -A'
alias grep='grep --color=auto'
alias cat='bat --theme=Catppuccin-mocha'              # if you install bat later
#alias cd='z'                 # use zoxide instead of cd

alias ls='eza --icons'
alias ll='eza -lah --icons'
alias la='eza -A --icons'
alias tree='eza --tree --icons'

# Pacman shortcuts
alias up='sudo pacman -Syu'         # update everything
alias install='sudo pacman -S'
alias remove='sudo pacman -Rns'
alias search='pacman -Ss'
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'  # remove orphans

# Hyprland
alias conf='vim ~/.config/hypr/hyprland.conf'
alias reload='hyprctl reload'

# Pnpm
alias p=pnpm

# Kubectl
alias k=kubectl

# ── History ───────────────────────────────────────────────
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS       # don't save duplicate commands
setopt HIST_IGNORE_SPACE      # don't save commands starting with space
setopt SHARE_HISTORY          # share history between terminal sessions

# ── Yazi shell wrapper ────────────────────────────────────
function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        builtin cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="$HOME/.local/bin:$PATH"

# Editor, default for yazi
export EDITOR="/usr/bin/vim"

