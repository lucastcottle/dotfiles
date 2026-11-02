# Check if we're on macOS and if so add homebrew to path
if [[ "$(uname)" == "Darwin" ]] && [[ -f "/opt/homebrew/bin/brew" ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Load completions
autoload -Uz compinit && compinit

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# ---- UI color configuration ----
# Autosuggestions (ghost text as you type)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#7c6f64'

# fzf-tab: visual consistency with dark palette
zstyle ':fzf-tab:*' preview-window 'right:50%:wrap'
zstyle ':fzf-tab:*' fzf-flags \
  '--color=bg+:#2d2c2b,bg:#221f1d,spinner:#a89984,hl:#ea6962,fg:#f9f5d7,header:#ea6962,info:#7daea3,pointer:#a89984,marker:#89b482,fg+:#ebdbb2,prompt:#7daea3,hl+:#ea6962,border:#221f1d'

# Add in zsh plugins
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found
zinit snippet OMZP::sudo
zinit light Aloxaf/fzf-tab

#restore vi mode
bindkey -v  # Enables vi mode keybindings
# add preview to fzf
export FZF_DEFAULT_OPTS=" \
--color=bg+:#2d2c2b,bg:#221f1d,spinner:#a89984,hl:#ea6962 \
--color=fg:#f9f5d7,header:#ea6962,info:#7daea3,pointer:#a89984 \
--color=marker:#89b482,fg+:#ebdbb2,prompt:#7daea3,hl+:#ea6962 \
--color=border:#221f1d \
--multi \
--preview 'bat --color=always --style=numbers --line-range :500 {}' --preview-window=right:50%:wrap"

# Replay cd if necessary
zinit cdreplay -q

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
setopt autocd extendedglob nomatch notify

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':completion:*:default' list-colors \
  "ma=48;2;32;32;32;38;2;225;225;225"
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Aliases
alias ls='ls --color'
alias vim='nvim'
alias c='clear'

# Functions

# ArgoCD is behind Cloudflare Access, which challenges every request rather
# than just `login`, so the Access token has to go on all of them. A function
# rather than an alias: the alias form nests a command substitution inside
# quotes and gets mangled if it ever wraps across lines.
argocd() {
  local url="https://argocd.internal.datazoo.com"
  local tok
  tok=$(command cloudflared access token "$url" 2>/dev/null)
  if [[ -z "$tok" ]]; then
    print -u2 "argocd: no Cloudflare Access token. Run: cloudflared access login $url"
    return 1
  fi
  command argocd --grpc-web -H "cf-access-token: $tok" "$@"
}

# Add zoxide to path
export PATH="$HOME/.local/bin:$PATH"
#go bin in path/
export PATH="$HOME/go/bin:$PATH"
unset GOPATH

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(starship init zsh)"


# macOS-only machine-local settings (keep this file out of git)
if [[ "$(uname)" == "Darwin" ]] && [[ -f "$HOME/.zshrc.local" ]]; then
  source "$HOME/.zshrc.local"
fi


# Added by Antigravity CLI installer
export PATH="/Users/lucascottle/.local/bin:$PATH"
