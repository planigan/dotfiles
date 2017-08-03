# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
export LOGIN_CONFIG_ORDER=".bashrc > ${LOGIN_CONFIG_ORDER}"

# gpg-agent environment setting
GPG_TTY=$(tty)
export GPG_TTY

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
HISTSIZE=10000
HISTFILESIZE=20000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Disable the dang flow control that locks things up when I fat finger C-s
stty -ixon

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

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
force_color_prompt=yes

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

# MY MODS
export PAGER="less"
# tput ref: http://linux.101hacks.com/ps1-examples/prompt-color-using-tput/
# I'm not using these in the prompt anymore, but I think I used them
# somewhere in .bash_aliases. TODO: check on that/move them somewhere else
BLACK="$(tput setaf 0)"
RED="$(tput setaf 1)"
GREEN="$(tput setaf 2)"
YELLOW="$(tput setaf 3)"
BLUE="$(tput setaf 4)"
MAGENTA="$(tput setaf 5)"
CYAN="$(tput setaf 6)"
WHITE="$(tput setaf 7)"
CLEAR="$(tput sgr0)"

exit_status_prompt() {
  if [ $? = 0 ]; then echo "$GREEN ✔ "; else echo "$RED ✘ "; fi
}

# Cobbled together from:
# http://stackoverflow.com/a/6592668/6058262
# https://github.com/l0b0/tilde/blob/master/.bashrc
PROMPT_COMMAND=set_prompt
set_prompt() {
  [ -n "$TMUX_PANE" ] && \
    tmux set-environment TMUX_"$(echo $TMUX_PANE | sed 's/%//g')"_PATH "$(pwd)"
  # append to history after every command so that history is always
  # available across shell instances
  history -a
}

# Last piece of the puzzle to fix how tmux opens new windows in physical
# path rather than symlink path.
# From: http://stackoverflow.com/a/33077475/6058262
neww=$(tmux show-environment NEWW 2> /dev/null | sed 's/^[^=]*=//')
if [ "$neww" != "-NEWW" ] && [ "$neww" != "" ] ; then
    cd "$neww"
fi
tmux set-environment -r NEWW

if [ -f ~/.bash_prompt ]; then
  . ~/.bash_prompt
fi
# END MY MODS

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
    #alias ls='ls --color=auto'
    ##alias dir='dir --color=auto'
    ##alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
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

# Fix to get git completions working properly, no idea why it's broken
# otherwise, but it would have a subset of completions and break hub completions
if [ -f /usr/share/bash-completion/completions/git ]; then
  . /usr/share/bash-completion/completions/git
fi

# load hub bash completions
if [ -f ~/bin/hub-linux/etc/hub.bash_completion.sh ]; then
  . ~/bin/hub-linux/etc/hub.bash_completion.sh
fi

# history handling
#
# Erase duplicates
export HISTCONTROL=erasedups
# resize history size
export HISTSIZE=10000
# append to bash_history if Terminal.app quits
shopt -s histappend

# Enable fuzzy path completion with z
# if [ -f "$HOME/bin/z.sh" ]; then
#   . "$HOME/bin/z.sh"
# fi

# Setup npx auto shell fallback
# source <(npx --shell-auto-fallback bash)

# From: https://github.com/jweslley/rails_completion
# Source rails completion
[[ -f "$HOME/.rails.bash" ]] && source "$HOME/.rails.bash"


# Base16-shell additions
# https://github.com/chriskempson/base16-shell
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s "$BASE16_SHELL/profile_helper.sh" ] && eval "$($BASE16_SHELL/profile_helper.sh)"


# Alias definitions.
# I moved the bash_alias sourcing to the end because I was having an issue
# where the automatic git aliases from ~/.gitconfig were not being generated
# during a normal gnome-terminal opening, while tmux sessions continued to work
# and sourcing the .bashrc aplied the aliases. I temporarily set a variable to
# $( __git_aliases ) and it was empty when I echoed it after opening a terminal.
# TODO: investigate further... at some point... maybe

# make aliases work in vim
[[ $0 == *bash ]] && shopt -s expand_aliases
[[ $SHELL == *zsh ]] && [[ ! $0 == *bash ]] && setopt aliases
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi
