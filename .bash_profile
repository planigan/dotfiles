# .bash_profile < .profile < .bashrc
export LOGIN_CONFIG_ORDER=".bash_profile > ${LOGIN_CONFIG_ORDER}"

[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
