#aliases and functions for freebsd

#basic shell setup to mimic ubuntu
export PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "
LS_COLORS=$LS_COLORS:'di=0;35:' ; export LS_COLORS
export PAGER=less
export EDITOR=vim
alias grepc="grep -nr --color=always"

source "${DOTFILES_DIR}aliases_shared.bash"

alias reload="source ~/.bash_profile;"

#built ins

alias pkg="sudo pkg"

#directories
function localetc() { cddir /usr/local/etc "$1"; a; }

#nginx
alias nginx="sudo service nginx"


