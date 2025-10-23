# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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

# Add in Powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k
# ---- UI color configuration ----
# Autosuggestions (ghost text as you type)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#AFAFAF'

# fzf-tab: visual consistency with dark palette
zstyle ':fzf-tab:*' preview-window 'right:50%:wrap'
zstyle ':fzf-tab:*' fzf-flags \
  '--color=bg+:#202020,fg+:#E1E1E1,hl+:#BAD7FF,fg:#AFAFAF,bg:#151515,hl:#BAD7FF,pointer:#BAD7FF,border:#373737,prompt:#90A959,marker:#F4BF75'

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
export FZF_DEFAULT_OPTS="--preview 'bat --color=always --style=numbers --line-range :500 {}' --preview-window=right:50%:wrap"

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

# Powerlevel10k Theme
source ~/.local/share/zinit/plugins/romkatv---powerlevel10k/powerlevel10k.zsh-theme

# Add zoxide to path
export PATH="$HOME/.local/bin:$PATH"
#Set colours for tmux 
export TERM=screen-256color

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"


