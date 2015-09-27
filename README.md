#Bash Dotfiles

Script to save the compiled output files (.php etc) to static .html files.

##Dependencies

* Bash shell
* Mac OSX

##Getting Started

* Download or clone the project
* Create a bash profile if you don't already have one by typing `touch .bash_profile` in your home directory
* Either copy and paste the contents of `aliases.bash` into your `.bash_profile` or link the files to your bash profile by typing `source $path-to-repo/aliases.bash` in your `.bash_profile`
* Create an environmental variable called DOTFILES_DIR (ending with a forward slash at the end) that points to the path of the dotfiles directory in your `.bash_profile`. You can do this by adding `DOTFILES_DIR="${HOME}/bash_dotfiles/"; export DOTFILES_DIR` to your `.bash_profile`, assuming you downloaded the repository to the root of your home directory.

##License

Bash Dotfiles is released under the MIT License. See license.txt for more details.