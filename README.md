# Bash Dotfiles

Configuration files to setup Bash shell and Vim across various operating systems.

## Dependencies

* Bash shell
* OSX, Ubuntu or FreeBSD

## Getting Started

* Download or clone the project

* Create a bash profile if you don't already have one by typing `touch .bash_profile` in your home directory

* Create an environmental variable called DOTFILES_DIR (ending with a forward slash at the end) that points to the path of the dotfiles directory in your `.bash_profile`. You can do this by adding `DOTFILES_DIR="${HOME}/bash-dotfiles/"; export DOTFILES_DIR` to your `.bash_profile`, assuming you downloaded the repository to the root of your home directory.

* Either copy and paste the contents of `aliases.bash` into your `.bash_profile` or link the files to your bash profile by typing `source ${PATH_TO_REPO}/aliases_${OS_NAME}.bash` in your `.bash_profile`

### Example .bash_profile for OSX
`export DOTFILES_DIR="${HOME}/bash-dotfiles/"`

`source "${DOTFILES_DIR}aliases_osx.bash"`

### Example .bashrc for Ubuntu

`export DOTFILES_DIR="${HOME}/bash-dotfiles/"`

`source "${DOTFILES_DIR}aliases_ubuntu.bash"`

### Example .bash_profile for freebsd
`export DOTFILES_DIR="${HOME}/bash-dotfiles/"`
`source "${DOTFILES_DIR}aliases_freebsd.bash"`

### One-liner setup for Ubuntu

Make sure you are in the home directory first before running

`sudo apt install git && git clone https://github.com/allen-garvey/bash-dotfiles.git && echo -e '\nDOTFILES_DIR="${HOME}/bash-dotfiles/"\nexport DOTFILES_DIR\nsource "${DOTFILES_DIR}aliases_ubuntu.bash"' >> ~/.bashrc && echo ":execute 'source '.fnameescape(\$DOTFILES_DIR).'main.vim'"  >> ~/.vimrc && cat .prettierrc.json > ~/.prettierrc.json`

## Vim

To use the vim settings type this in the terminal:

`echo ":execute 'source '.fnameescape(\$DOTFILES_DIR).'main.vim'"  >> ~/.vimrc`

For more information see [https://github.com/allen-garvey/vim_config](https://github.com/allen-garvey/vim_config)

## License

Bash Dotfiles is released under the MIT License. See license.txt for more details.