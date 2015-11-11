#SETTINGS

#alias for bash settings
alias settings="subl ~/.bash_profile \"${DOTFILES_DIR}aliases.bash\""

#BUILT INS

alias grepc="grep -nr --color=always"

#CUSTOM SCRIPTS

#alias for sassquatch
alias sasq="ruby \"${HOME}/Documents/Programming/Ruby/sassquatch/sassquatch.rb\""

#alias for synced
alias synced="ruby \"${HOME}/Documents/Programming/Ruby/synced/synced.rb\""

#SUBLIME

#function to create file if not exists and open with sublime
function edit() { touch ./$1; subl ./$1; }

#alias for sublime
alias subl="open -a \"Sublime Text 3\""

#alias for sublime packages
alias subl_settings="cd ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/sublime-snippets; open ."

#Directories

#function to cd into directory in sites dir
function sites() { cd ~/Sites/; cd ./$1; }

#function to cd into directory in websites dir
function web() { cd ~/Sites/Websites/; cd ./$1; }

#function to cd into directory in programming dir
function doc() { cd ~/Documents/; cd ./$1; }

#function to cd into directory in programming dir
function prog() { cd ~/Documents/Programming/; cd ./$1; }

#function to cd into directory in desktop
function desktop() { cd ~/Desktop/; cd ./$1; }

#alias to open current directory in finder
function op() { open ./$1; }

#Git

#alias to open current directory in gitup
alias gitup="open . -a \"GitUp\""

#function to create git repository and default .gitignore
function git_setup() { git init; cat "${DOTFILES_DIR}default.gitignore" >> .gitignore; cat "${DOTFILES_DIR}license.txt" >> license.txt; }

#alias to add all to git and check
alias g_a="git add .; git status;"

#function to copy git repo and gitignore
function git_copy() { cp -r ./.git $1/.git; cp ./.gitignore $1/.gitignore; }

#RAILS

#rails aliases
alias rls="./bin/rails"

alias rke="./bin/rake"

#Convenience
#start developing on existing web project in current directory (develop web)
alias dw="op;gitup;subl .;"
