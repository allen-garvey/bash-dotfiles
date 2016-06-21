cd ~ & 
git clone https://github.com/allen-garvey/bash-dotfiles.git bash_dotfiles & 
touch .bash_profile & 
echo "DOTFILES_DIR=\"${HOME}/bash_dotfiles/\"; export DOTFILES_DIR;" >> .bash_profile;