#aliases and functions fro freebsd

#basic shell setup to mimic ubuntu
export PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "
export PAGER=less
export EDITOR=vim

source "${DOTFILES_DIR}aliases_shared.bash"

#built ins
alias grepc="grep -nrP --color=always"

alias pkg="sudo pkg"


source "${DOTFILES_DIR}aliases_shared_footer.bash"


