source "${DOTFILES_DIR}aliases_shared.bash"

#Aliases for Ubuntu only

#built ins
alias grepc="grep -nrP --color=always"

#alias for bash settings
alias settings="subl ~/.bash_aliases ~/.bashrc ~/.vimrc \"${DOTFILES_DIR}aliases_ubuntu.bash\" \"${DOTFILES_DIR}aliases_shared.bash\""