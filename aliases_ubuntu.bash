#built ins declared before shared
alias grepc="grep -nrP --color=always"

source "${DOTFILES_DIR}aliases_shared.bash"

#Aliases for Ubuntu only

#alias for bash settings
alias settings="subl ~/.bash_aliases ~/.bashrc ~/.vimrc \"${DOTFILES_DIR}aliases_ubuntu.bash\" \"${DOTFILES_DIR}aliases_shared.bash\""
alias reload_settings="source ~/.bashrc;"

#APT
alias apt="sudo apt-get"

#alias to open current directory in file browser
alias op="nautilus .;"

#node
alias node="nodejs"

#apache
alias apache="sudo service apache2"

#nginx
alias nginx="sudo service nginx"
#function ng() { sudo systemctl $1 nginx; }
