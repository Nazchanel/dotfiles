#!/bin/bash

### ─── Splash Banner ───────────────────────────────────────────────
echo "
 ▗▄▖ ▗▖   ▗▄▄▖ ▗▖ ▗▖ ▗▄▖ ▗▄▄▖  ▗▄▖ ▗▄▄▄ ▗▄▄▄▖ ▗▄▄▖ ▗▄▖ ▗▖
▐▌ ▐▌▐▌   ▐▌ ▐▌▐▌ ▐▌▐▌ ▐▌▐▌ ▐▌▐▌ ▐▌▐▌  █  █  ▐▌   ▐▌ ▐▌▐▌
▐▛▀▜▌▐▌   ▐▛▀▘ ▐▛▀▜▌▐▛▀▜▌▐▛▀▚▖▐▛▀▜▌▐▌  █  █  ▐▌   ▐▛▀▜▌▐▌
▐▌ ▐▌▐▙▄▄▖▐▌   ▐▌ ▐▌▐▌ ▐▌▐▌ ▐▌▐▌ ▐▌▐▙▄▄▀▗▄█▄▖▝▚▄▄▖▐▌ ▐▌▐▙▄▄▖
"

### ─── PATH Setup ──────────────────────────────────────────────────
export PATH="$HOME/.cargo/bin:/opt/utd-firefox:/opt/nvim-linux64/bin:$HOME/flutter/bin:$HOME/.local/bin:$HOME/.spicetify:$HOME/gems/bin:$PATH"

# Perl environment
export PATH="/home/iyereshan/perl5/bin${PATH:+:${PATH}}"
export PERL5LIB="/home/iyereshan/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"
export PERL_LOCAL_LIB_ROOT="/home/iyereshan/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"
export PERL_MB_OPT="--install_base \"/home/iyereshan/perl5\""
export PERL_MM_OPT="INSTALL_BASE=/home/iyereshan/perl5"

# Ruby environment
export GEM_HOME="$HOME/gems"

# Android/React Native
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator:$ANDROID_HOME/platform-tools

### ─── Fastfetch with Pokemon ──────────────────────────────────────
pokeget "taillow" --hide-name | fastfetch --structure cpu:memory:disk:os:battery:uptime --file-raw - --logo-padding-right 2 --separator ":  "

# NVM
# export NVM_DIR="${XDG_CONFIG_HOME:-$HOME/.nvm}"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Lazy Load NVM

# load_nvm() {
#   # export NVM_DIR="${XDG_CONFIG_HOME:-$HOME/.nvm}"
#   [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
#   [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
# }

# LM Studio
export PATH="$PATH:/home/iyereshan/.lmstudio/bin"

# Flatpak data
export XDG_DATA_DIRS="$XDG_DATA_DIRS:/var/lib/flatpak/exports/share:/home/iyereshan/.local/share/flatpak/exports/share"

# Cargo env (Rust)
. "$HOME/.cargo/env"

### ─── Prompt and Shell Features ───────────────────────────────────
# Starship prompt
eval "$(starship init bash)"

# Virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3.10
source /home/iyereshan/.local/bin/virtualenvwrapper.sh

# Prompt customization
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        color_prompt=yes
    else
        color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# Set terminal title
case "$TERM" in
    xterm*|rxvt*)
        PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
        ;;
esac



### ─── Useful Aliases ──────────────────────────────────────────────
# General navigation
alias ls='ls -a --color=auto --group-directories-first'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias g='cd ~/Documents/Github/ && clear'
alias d='cd ~/Downloads && clear'
alias c='clear'
alias e='exit'
alias p='ping 1.1.1.1'
alias explorer='dolphin'

# Vim/Nvim
alias vim='nvim'
alias vi='nvim'
alias nvchad='nvim'

# Extract shortcuts
alias untar='tar -xvf'
alias unbz2='tar -xvjf'
alias ungz='tar -xvzf'

# Lazy aliases
# alias nvm="load_nvm; nvm"
# alias node="load_nvm; node"
# alias npm="load_nvm; npm"
# alias yarn="load_nvm; yarn"

# Windscribe VPN
alias windscribe='windscribe-cli'
alias wi='windscribe-cli connect best'
alias vpnon="sudo systemctl start windscribe-helper.service && windscribe connect"
alias vpnoff="windscribe disconnect && sudo systemctl stop windscribe-helper.service"

# Show Aliases
# alias | grep -E '^(alias g=|alias d=|alias c=|alias p=|alias v|alias n|alias l)'

# Alert for long commands
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'' )"'

# Load custom aliases file
[ -f ~/.bash_aliases ] && . ~/.bash_aliases

### ─── Shell Behavior and Completion ───────────────────────────────
# History
HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s checkwinsize

# Better less handling
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Bash completion
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

### ─── Interactive Shell Guard ─────────────────────────────────────
case $- in
    *i*) ;;
      *) return;;
esac

# Show alias cheat sheet on new terminal, auto-clear after 5 seconds
# if [ -t 1 ]; then
#   cat ~/.alias_cheatsheet
#   sleep 5
#   clear
# fi

# source ~/.local/share/blesh/ble.share

