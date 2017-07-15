# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

export LOGIN_CONFIG_ORDER=".profile > ${LOGIN_CONFIG_ORDER}"

if [[ -d "$HOME/.cargo/bin" && ! $PATH =~ $HOME/.cargo/bin ]]; then
  export PATH="$HOME/.cargo/bin:$PATH"
fi

export NVM_DIR="$HOME/.nvm"
#if [[ ! $PATH =~ $NVM_DIR ]]; then
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
  [[ -r $NVM_DIR/bash_completion ]] && . "$NVM_DIR/bash_completion"
#fi

if [[ -d $HOME/.pyenv/bin && ! $PATH =~ $HOME/.pyenv/bin ]]; then
  export PATH="$HOME/.pyenv/bin:$PATH"
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

if [[ -s "$HOME/.gvm/scripts/gvm" && ! $PATH =~ $HOME/.gvm/bin ]]; then
  source "$HOME/.gvm/scripts/gvm"
  export GOPATH="$HOME/workspace"
  export PATH="$PATH:$GOPATH/bin"
fi

if [[ -d "$HOME/bin" && ! $PATH =~ $HOME/bin ]]; then
  export PATH="$HOME/bin:$PATH"
fi

if [[ -d "$HOME/.local/bin" && ! $PATH =~ $HOME/.local/bin ]]; then
  export PATH="$HOME/.local/bin:$PATH"
fi

if [[ ! $PATH =~ $HOME/.rvm/bin ]]; then
  export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
fi

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

#export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# set PATH so it includes user's private bin if it exists
#if [ -d "$HOME/bin" ] ; then
  #PATH="$HOME/bin:$PATH"
#fi


export GTAGSLABEL=ctags
