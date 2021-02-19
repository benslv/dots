# Path to your oh-my-zsh installation.
export ZSH="/home/ben/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME=""

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=250'

# Aliases 
alias ls="exa -lhgbHm --git"
alias vi"nvim"
alias vim="nvim"
alias mv="mv -v"
alias cp="cp -v"
alias rm="rm -rv"
alias neofetch="clear; neofetch"
alias open="xdg-open"
alias gs="git status"
alias yarn="yarn --emoji true"
alias pypy="pypy3"
alias cat="bat"

[ -z "$NVM_DIR" ] && export NVM_DIR="$HOME/.nvm"
source /usr/share/nvm/nvm.sh
source /usr/share/nvm/bash_completion
source /usr/share/nvm/install-nvm-exec

export EDITOR=nvim;
export PATH="$(yarn global bin):$PATH"

eval $(starship init zsh)
