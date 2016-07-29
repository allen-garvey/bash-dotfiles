source "${DOTFILES_DIR}aliases_shared.bash"

#Aliases for Ubuntu only

#built ins
alias grepc="grep -nrP --color=always"

#alias for bash settings
alias settings="subl ~/.bash_aliases ~/.bashrc ~/.vimrc \"${DOTFILES_DIR}aliases_ubuntu.bash\" \"${DOTFILES_DIR}aliases_shared.bash\""

#APT
alias apt="sudo apt-get"

#alias to open current directory in file browser
alias op="nautilus .;"

#node
alias node="nodejs"

#apache
alias apache="sudo service apache2"

#nginx
function ng() { sudo systemctl $1 nginx; }