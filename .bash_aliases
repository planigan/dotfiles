# -*- mode: sh; -*-

alias a="alias"
alias grep="ag --color"
# alias grep="grep --color"
alias less="less -r" # colorize less always
alias aag="alias_grep"
alias func="function_grep"
alias hgrep="history_grep"
alias psg="ps_grep"
alias strip_colors="sed -r \"s/\x1B\[([0-9];)?([0-9]{1,2}(;[0-9]{1,2})?)?[mGK]//g\""
alias f="declare -f"
alias F="declare -F"
alias w="whois "
alias ls="ls -Alh --color=auto --group-directories-first"
alias ll="ls -l"
alias c="pygmentize -O style=monokai -f console256 -g"
alias cn="pyg"
alias monoff="sleep 1; xset dpms force off"
alias j="jobs"
alias fg="fg %" # Make zsh act like bash where fg 2 restores job 2
alias bg="bg %" # Make zsh act like bash where bg 2 restores job 2
alias hist="fc -l -10"
alias tree="tree -I '.git|bower_components|node_modules' --dirsfirst"
alias open="xdg-open"
alias disks='echo "╓───── m o u n t . p o i n t s"; echo "╙────────────────────────────────────── ─ ─ "; lsblk -a; echo ""; echo "╓───── d i s k . u s a g e"; echo "╙────────────────────────────────────── ─ ─ "; df -h;'
alias toiletlist='for i in ${TOILET_FONT_PATH:=/usr/share/figlet}/*.{t,f}lf; do j=${i##*/}; echo ""; echo "╓───── "$j; echo "╙────────────────────────────────────── ─ ─ "; echo ""; toilet -d "${i%/*}" -f "$j" "${j%.*}"; done'

alias shrug="xclip ~/Dropbox/shrug.txt"
alias weather="curl -4 wttr.in/~Knoxville"
alias sprunge="curl -F 'sprunge=<-' http://sprunge.us"
alias clbin="curl -F 'clbin=<-' https://clbin.com"

# alias git=hub
eval "$(hub alias -s)"
alias fixssh="rm ~/.ssh/sockets/*"

alias b="cd -"
alias h="cd ~"
alias ..="cd .."
alias ...="cd ../../"
alias ....="cd ../../../"
alias .....="cd ../../../../"
alias bin="cd ~/bin"
alias code="cd ~/Code"
alias emacs="cd ~/.emacs.d/"
alias p5="cd ~/Code/p5"
alias mcd="mkcdir"
alias conf="cd ~/.config"

alias caps2esc="setxkbmap -option caps:escape"
alias caps2super="setxkbmap -option caps:super"
alias superTapEscape="xcape -t 200 -e 'Super_L=Escape'"
#alias caps2caps="setxkbmap -option caps:caps" tried capsLock also, didn't work
# need to figure out how to do this for ctrl

alias mac="ssh patrick@10.0.0.23"

alias ec="emacsclient25 -nw --alternate-editor='' -s terminal"
alias emc="ec ~/.spacemacs.d/init.el"
alias vi="nvim"
alias vim="nvim"
alias aa="vi ~/.bash_aliases"
alias brc="vi ~/.bashrc"
alias zrc="vi ~/.zshrc"
alias tmc="vi ~/.tmux.conf"
alias vrc="vi ~/.vimrc"
alias grc="vi ~/.gitconfig"
alias i3c="vi ~/.config/i3/config"
alias i3b="vi ~/.config/i3/i3blocks.conf"
alias dun="vi ~/.config/dunst/dunstrc"

alias csv_without_header="tail -n +2"

alias npmlg="npm list -g --depth=0"
alias nvmlsr="nvm ls-remote | tail"
alias nodelatest="nvm ls-remote | tail -n 1"

alias agi="sudo apt install"
alias acs="apt search"
alias acsw="find_package_strict"
alias agu="sudo apt update"
alias agug="sudo apt upgrade && ~/bin/reboot-notifier.sh"
alias agugs="sudo apt upgrade -s"
# alias agdu="sudo apt-get dist-upgrade"
alias agdu="sudo apt full-upgrade"
alias agclean="echo 'apt-get autoclean...' && sudo apt-get autoclean && echo '' && echo 'apt autoremove...' && sudo apt autoremove && echo; echo 'apt-get clean...' && sudo apt-get clean && echo; echo 'Done cleaning'"
alias acp="apt-cache policy"
alias packages="confirm 'This will take a while. Are you sure? [y/N]' && dpkg -l | awk '/^ii/ {system(\"apt-cache policy \" $2)}' > ~/packages && alert 'Package file complete' && espeak 'package file complete'"
alias isinstalled="acp"

alias tma="tmux attach -t"
alias tml="tmux list-sessions"
alias tms="tmux switch -t"
alias tmn="tmux new -s"

alias handbrake="ghb %f"
alias docs="zeal"

alias bigdirs="find_big_directories"
find_big_directories() {
  sudo du -chax --max-depth=1 "${1:-/}" | command grep -E "^[0-9\.]*[MG]"
}

cpufreq_watch() {
  while true :
  do
    clear
    cpufreq-info | grep 'current cpu frequency is' | awk '{ print $5 " " $6; }'
    sleep 1
  done
}

broken_links() {
  local search_path="$1" || "/"
  find "$search_path" -type l -exec test ! -e {} \; -print 2> /dev/null
}

#alias s="source ~/.bashrc && echo 'Reloaded .bashrc' && [ -n \"$TMUX\" ] && tmux source-file ~/.tmux.conf && echo 'Reloaded .tmux.conf'"
alias s='src_configs'
src_configs() {
  [[ $SHELL == *zsh ]] && [[ ! $0 == *bash ]]&& [ -f ~/.zshrc ] && source ~/.zshrc && echo 'Reloaded .zshrc...'
  [[ $0 == *bash ]] && [ -f ~/.bashrc ] && source ~/.bashrc && echo 'Reloaded .bashrc...'
  [ -n "$TMUX" ] && [ -f ~/.tmux.conf ] && tmux source-file ~/.tmux.conf && echo 'Reloaded .tmux.conf...'
}

kill_on_port() {
  [[ $# -ne 1 ]] && echo "Need to pass port number as an argument."
  [[ $# -eq 1 ]] && kill -9 $(lsof -t -i:$1 -sTCP:LISTEN)
}

# Use to confirm aliases
# Found: http://stackoverflow.com/a/3232082/6058262
confirm() {
  # call with a prompt string or use a default
  read -r -p "${1:-Are you sure? [y/N]} " response
  case "$response" in
    [yY][eE][sS]|[yY])
      true
      ;;
    *)
      false
      ;;
  esac
}

song_json_search() {
  grep "$1" -C 2 ~/Code/the-sixtyone-reverse/songs.json
}

# Autogenerate git aliases from .gitconfig aliases and setup completion
# From: https://gist.github.com/mwhite/6887990
function_exists() {
  declare -f -F $1 > /dev/null
  return $?
}
export GIT_ALIASES_TEST=$( __git_aliases )
for al in $( __git_aliases ); do
  alias g$al="git $al"

  complete_func="_git_$(__git_aliased_command $al)"
  function_exists $complete_fnc && __git_complete g$al $complete_func
done

# Grep aliases with a single command
alias_grep() {
  alias | grep "$1"
}

# Grep function names with a single command
function_grep() {
  declare -F | grep "$1"
}

# Grep history with a single command
history_grep() {
  history | grep "$@"
}

ps_grep() {
  ps aux | grep "$1"
}

# Better skimming of csv files on the CLI
# From: https://chrisjean.com/view-csv-data-from-the-command-line/
csv() {
  cat "$@" | sed -e 's/,,/, ,/g' | column -s, -t | less -#5 -N -S
}

# read markdown files like manpages
md() {
  pandoc -s -f markdown -t man "$*" | man -l -
}

# Colorize source output  with pygmentize and add line numbers
pyg() {
  pygmentize -O style=monokai -f console256 -g "$@" | perl -e 'print ++$i." $_" for <>'
}

# colorized less
cl() {
  pygmentize -O style=monokai -f console256 -g $1 | less
}

# Colorize man pages
man() {
    LESS_TERMCAP_mb=$'\e'"[1;31m" \
    LESS_TERMCAP_md=$'\e'"[1;31m" \
    LESS_TERMCAP_me=$'\e'"[0m" \
    LESS_TERMCAP_se=$'\e'"[0m" \
    LESS_TERMCAP_so=$'\e'"[1;44;33m" \
    LESS_TERMCAP_ue=$'\e'"[0m" \
    LESS_TERMCAP_us=$'\e'"[1;32m" \
    command man "$@"
}

find_package_strict ()
{
  acs "$1" | starts_with "$1"
}

alias sw="starts_with"
starts_with ()
{
  grep -e "^$1"
}

mkcdir ()
{
    mkdir -p -- "$1" &&
      cd -- `pwd -L`"/$1"
}

# From: http://zanshin.net/2013/09/08/how-to-display-a-neatly-formatted-path/
# Pretty output of your $PATH
path() {
  echo $PATH | tr ":" "\n" | \
    awk "{ sub(\"/usr\",   \"$GREEN/usr$CLEAR\"); \
    sub(\"/bin\",   \"$BLUE/bin$CLEAR\"); \
    sub(\"/opt\",   \"$CYAN/opt$CLEAR\"); \
    sub(\"/sbin\",  \"$MAGENTA/sbin$CLEAR\"); \
    sub(\"/local\", \"$YELLOW/local$CLEAR\"); \
    sub(\"/.rvm\",  \"$RED/.rvm$CLEAR\"); \
    print }"
}

# Setup easy jumping around the filesystem
# From: http://jeroenjanssens.com/2013/08/16/quickly-navigate-your-filesystem-from-the-command-line.html
export MARKPATH=$HOME/.marks
function jump {
  cd -P "$MARKPATH/$1" 2>/dev/null || echo "No such mark: $1"
}
function mark {
  mkdir -p "$MARKPATH"; ln -s "$(pwd)" "$MARKPATH/$1"
}
function unmark {
  local curdir=${PWD##*/}
  echo "Removing ${1-$curdir}..."
  rm -i "$MARKPATH/${1-$curdir}"
}
function marks {
  ls -l "$MARKPATH" | sed 's/  / /g' | cut -d' ' -f9- | sed 's/ -/\t-/g' && echo
}

if [[ $0 == *bash ]]; then
    _completemarks() {
    local curw=${COMP_WORDS[COMP_CWORD]}
    local wordlist=$(find $MARKPATH -type l -printf "%f\n")
    COMPREPLY=($(compgen -W '${wordlist[@]}' -- "$curw"))
    return 0
  }

  complete -F _completemarks jump unmark
fi

if [[ $SHELL == *zsh ]] && [[ ! $0 == *bash ]]; then
  function _completemarks {
    reply=($(ls $MARKPATH))
  }

  compctl -K _completemarks jump
  compctl -K _completemarks unmark
fi


eval $(thefuck --alias)
