#===============================================================================
#                                     __             
#                         ____  _____/ /_  __________
#                        /_  / / ___/ __ \/ ___/ ___/
#                         / /_(__  ) / / / /  / /__  
#                        /___/____/_/ /_/_/   \___/  
#                        
#===============================================================================
#                               @cfsanderson

# Aliases moved to ~/.oh-my-zsh/custom/aliases.zsh and accessible with "confalias" alias.
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
export ZSH=$HOME/.oh-my-zsh
export TMUX_CONF=~/.config/tmux/tmux.conf

source ~/.config/zsh/.env.local

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi

# Enable Ctrl-x-e to edit command line
autoload -U edit-command-line

# Vi style:
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

ZSH_THEME="agnoster"

HIST_STAMPS="yyyy-mm-dd"
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=$HOME/.cache/zsh/history

ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="true"

plugins=(
    asdf
    git 
    npm 
    macos 
    vi-mode 
    web-search 
    zsh-completions
    zsh-syntax-highlighting
)

# source $HOME/.bash_profile
source $ZSH/oh-my-zsh.sh

# SSH key path
export SSH_KEY_PATH="~/.ssh/id_rsa"

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

# Neofetch ascii art
# neofetch --ascii $HOME/.config/neofetch/millenium-falcon.txt
fastfetch

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# . $HOME/.asdf/asdf.sh

export PATH="/opt/homebrew/bin:$PATH"
