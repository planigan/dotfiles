# make aliases work in vim
shopt -s expand_aliases

alias a="alias"
alias ag="alias_grep"
alias func="function_grep"
alias hgrep="history_grep"
alias f="declare -f"
alias F="declare -F"
alias w="whois "
alias ls="ls -Alh --color=auto --group-directories-first"
alias ll="ls -l"
alias c="pygmentize -O style=monokai -f console256 -g"
alias cn="pyg"
alias monoff="sleep 1; xset dpms force off"
alias j="jobs"
alias hist="history 10"
alias tree="tree -I '.git|bower_components|node_modules' --dirsfirst"
alias open="xdg-open"
alias disks='echo "╓───── m o u n t . p o i n t s"; echo "╙────────────────────────────────────── ─ ─ "; lsblk -a; echo ""; echo "╓───── d i s k . u s a g e"; echo "╙────────────────────────────────────── ─ ─ "; df -h;'
alias toiletlist='for i in ${TOILET_FONT_PATH:=/usr/share/figlet}/*.{t,f}lf; do j=${i##*/}; echo ""; echo "╓───── "$j; echo "╙────────────────────────────────────── ─ ─ "; echo ""; toilet -d "${i%/*}" -f "$j" "${j%.*}"; done'


alias weather="curl -4 wttr.in"
alias sprunge="curl -F 'sprunge=<-' http://sprunge.us"
alias clbin="curl -F 'clbin=<-' https://clbin.com"

alias git=hub

alias b="cd -"
alias h="cd ~"
alias ..="cd .."
alias ...="cd ../../"
alias ....="cd ../../../"
alias .....="cd ../../../../"
alias bin="cd ~/bin"
alias code="cd ~/Code"
alias mcd="mkcdir"

alias caps2esc="setxkbmap -option caps:escape"
alias caps2super="setxkbmap -option caps:super"
#alias caps2caps="setxkbmap -option caps:caps" tried capsLock also, didn't work
# need to figure out how to do this for ctrl

alias mac="ssh planigan@10.0.0.3"

alias aa="vi ~/.bash_aliases"
alias brc="vi ~/.bashrc"
alias tmc="vi ~/.tmux.conf"
alias vrc="vi ~/.vimrc"
alias grc="vi ~/.gitconfig"
alias i3c="vi ~/.config/i3/config"
alias i3b="vi ~/.config/i3/i3blocks.conf"
alias dun="vi ~/.config/dunst/dunstrc"
alias s="source ~/.bashrc && tmux source-file ~/.tmux.conf"

alias npmlg="npm list -g --depth=0"

alias agi="sudo apt-get install"
alias acs="apt-cache search"
alias acsw="find_package_strict"
alias agu="sudo apt-get update"
alias agdu="sudo apt-get dist-upgrade"
alias acp="apt-cache policy"
alias isinstalled="acp"

alias tma="tmux attach -t"
alias tml="tmux list-sessions"
alias tms="tmux switch -t"
alias tmn="tmux new -s"

alias handbrake="ghb %f"
alias docs="zeal"

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
  pygmentize -O style=monokai -f console256 -g $1 | less -r
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
_completemarks() {
  local curw=${COMP_WORDS[COMP_CWORD]}
  local wordlist=$(find $MARKPATH -type l -printf "%f\n")
  COMPREPLY=($(compgen -W '${wordlist[@]}' -- "$curw"))
  return 0
}

complete -F _completemarks jump unmark


eval $(thefuck --alias)
