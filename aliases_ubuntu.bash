#Aliases for Ubuntu

#built ins declared before shared
alias grepc="grep -nrP --color=always"

source "${DOTFILES_DIR}aliases_shared.bash"

#alias for bash settings
alias settings="subl ~/.bash_aliases ~/.bashrc ~/.vimrc \"${DOTFILES_DIR}aliases_ubuntu.bash\" \"${DOTFILES_DIR}aliases_shared.bash\""
alias reload="source ~/.bashrc;"

#GIT
#open stack overflow to add part of file in git to staging
alias git_part="sensible-browser \"http://stackoverflow.com/questions/1085162/commit-only-part-of-a-file-in-git\";"

#APT
alias apt-get="sudo apt-get"
alias aptg="sudo apt-get install"

#alias to open current directory in file browser
alias op="nautilus .;"

#node
alias node="nodejs"

#apache
alias apache="sudo service apache2"

#nginx
alias nginx="sudo service nginx"
#function ng() { sudo systemctl $1 nginx; }

#redis
#assumes redis installed and configured from:
#https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-redis-on-ubuntu-16-04
alias redis_start="sudo systemctl start redis"
