#!/usr/bin/env bash

cd ~ & \
git clone https://github.com/allen-garvey/bash-dotfiles.git bash_dotfiles & \
touch .bash_profile & \
echo -e "DOTFILES_DIR=\"${HOME}/bash_dotfiles/\";\nexport DOTFILES_DIR;\nDOTFILES_DIR=\"${HOME}/bash_dotfiles/\";\nexport DOTFILES_DIR;" >> .bash_profile;