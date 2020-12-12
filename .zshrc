#===============================================================================
#                 ____                     __
#           _____/ __/________ _____  ____/ /__  ______________  ____
#          / ___/ /_/ ___/ __ `/ __ \/ __  / _ \/ ___/ ___/ __ \/ __ \
#         / /__/ __(__  ) /_/ / / / / /_/ /  __/ /  (__  ) /_/ / / / /
#         \___/_/ /____/\__,_/_/ /_/\__,_/\___/_/  /____/\____/_/ /_/
#
#                                    __
#                        ____  _____/ /_  __________
#                       /_  / / ___/ __ \/ ___/ ___/
#                        / /_(__  ) / / / /  / /__
#                       /___/____/_/ /_/_/   \___/
#
#===============================================================================

# Path to my oh-my-zsh installation
export ZSH="/Users/calebsanderson/.oh-my-zsh"

ZSH_THEME="amuse"

setopt autocd
setopt noclobber

ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="true"

HIST_STAMPS="yyyy-mm-dd"
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

plugins=(
    git
    npm
    osx
    web-search
    zsh-completions
    zsh-syntax-highlighting
)

# custom folder
ZSH_CUSTOM=$HOME/.oh-my-zsh/custom

# aliases moved to ~/.oh-my-zsh/custom/aliases.zsh

source $ZSH/oh-my-zsh.sh

# ASDF
. /usr/local/opt/asdf/asdf.sh
. /usr/local/opt/asdf/etc/bash_completion.d/asdf.bash
