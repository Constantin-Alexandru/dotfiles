# Sets the directory for zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download zinit if it does not exist
if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git  "$ZINIT_HOME"
fi

# Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Adding plgins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light Aloxaf/fzf-tab

autoload -Uz compinit && compinit 

# Loading prompt look
autoload -Uz promptinit && promptinit

prompt redhat 

# Aliases setting
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias logout='hyprctl dispatch exit'
alias vim='nvim'

# Run default commands when opening the terminal
neofetch

# Command history setup 
HISTSIZE=1000
SAVEHIST=$HISTSIZE
HISTFILE=~/.histfile
HISTDUP=erase

setopt appendhistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion setup
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

# FZF integration
eval "$(fzf --zsh)"
