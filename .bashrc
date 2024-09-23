#!/bin/bash
echo "
 ▗▄▖ ▗▖   ▗▄▄▖ ▗▖ ▗▖ ▗▄▖ ▗▄▄▖  ▗▄▖ ▗▄▄▄ ▗▄▄▄▖ ▗▄▄▖ ▗▄▖ ▗▖   
▐▌ ▐▌▐▌   ▐▌ ▐▌▐▌ ▐▌▐▌ ▐▌▐▌ ▐▌▐▌ ▐▌▐▌  █  █  ▐▌   ▐▌ ▐▌▐▌   
▐▛▀▜▌▐▌   ▐▛▀▘ ▐▛▀▜▌▐▛▀▜▌▐▛▀▚▖▐▛▀▜▌▐▌  █  █  ▐▌   ▐▛▀▜▌▐▌   
▐▌ ▐▌▐▙▄▄▖▐▌   ▐▌ ▐▌▐▌ ▐▌▐▌ ▐▌▐▌ ▐▌▐▙▄▄▀▗▄█▄▖▝▚▄▄▖▐▌ ▐▌▐▙▄▄▖
"

fastfetch --structure cpu:memory:disk:os:battery:uptime --logo none

# gets the current weather at College Park and removes "Weather report: College+Park"
curl -s wttr.in/College+Park?0 | sed '1d'

# starship prompt
eval "$(starship init bash)"

# Unzipping
alias untar='tar -xvf'
alias unbz2='tar -xvjf'
alias ungz='tar -xvzf'

alias windscribe='windscribe-cli'

# General Aliases
alias ls='ls -a --color=auto' # I hate that I have to constantly type ls -a everytime I work with dotfiles
alias wi='windscribe-cli connect best'
alias g='cd ~/Documents/Github/ && clear'
alias d='cd ~/Downloads && clear'
alias c='clear'
alias e='exit'
alias p='ping 1.1.1.1'
alias vim='nvim' 

export PATH="$PATH:/opt/nvim-linux64/bin"
export PATH="$PATH:~/.local/bin"

# Spotify API
export SPOTIPY_CLIENT_ID='' # Not for you little bro
export SPOTIPY_CLIENT_SECRET='' # Not for you little bro
export SPOTIPY_REDIRECT_URI='http://127.0.0.1:5000'

# NV Chad
export PATH="$PATH:/opt/nvim-linux64/bin"

# Gmail API
export API_KEY="" # Not for you little bro
export CLIENT_ID="" # Not for you little bro

# Install Ruby Gems to ~/gems
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"

# REACT NATIVE
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# Flutter PATH
export PATH="$PATH:$HOME/flutter/bin"


# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
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

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    # alias ls='ls --color=auto'
    # alias dir='dir --color=auto'
    # alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


export XDG_DATA_DIRS="$XDG_DATA_DIRS:/var/lib/flatpak/exports/share:/home/iyereshan/.local/share/flatpak/exports/share"

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
#
# # >>> conda initialize >>>
# # !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/home/iyereshan/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/home/iyereshan/miniconda3/etc/profile.d/conda.sh" ]; then
#         . "/home/iyereshan/miniconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/home/iyereshan/miniconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# # <<< conda initialize <<<

# conda deactivate

export PATH=$PATH:/home/iyereshan/.spicetify

PATH="/home/iyereshan/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/iyereshan/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/iyereshan/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/iyereshan/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/iyereshan/perl5"; export PERL_MM_OPT;
