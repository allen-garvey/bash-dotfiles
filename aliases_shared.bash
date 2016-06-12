#SETTINGS shared between OSX and linux

#alias for bash settings
alias dotfiles="cd \"$DOTFILES_DIR\""

#set input mode to vi
set -o vi

#BUILT INS
alias a="ls"
alias aa="ls -l"

alias up="cd ../;ls"

#find files with extension in current directory
function findex() { find . -type f -name \*.$1; }
#find file by name recursively in current directory
alias findf="find . -name"

#CUSTOM SCRIPTS

#alias for sassquatch
alias sasq="ruby \"${HOME}/Documents/Programming/Ruby/sassquatch/sassquatch.rb\""

#alias for synced
alias synced="rsync -a -p -u -v -v"

#SUBLIME

#open sublime workspace in current directory if there is one, otherwise open folder in sublime
alias sp="if [ -f *.sublime-workspace ]; then subl *.sublime-workspace; else subl .; fi"

#Directories
function home() { cd ~/; cd ./$1; ls; }

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


function osu(){ doc OSU; cd ./$1; }

#C++
function cppc() { g++ "$1.cpp" -o $1; }

#c
function c_c() { gcc -Wall -std=c99 -o $1 "$1.c"; }


#Git

#function to create git repository and default .gitignore
function git_setup() { git init; cat "${DOTFILES_DIR}default.gitignore" >> .gitignore; cat "${DOTFILES_DIR}default_license.txt" >> license.txt; cat "${DOTFILES_DIR}default_readme.md" >> README.md; }

#alias to add all to git and check
alias ga="git add .; git status;"

alias gm="git commit -m"

alias gp="git push"

#function to copy git repo and gitignore
function git_copy() { cp -r ./.git $1/.git; cp ./.gitignore $1/.gitignore; }

#alias to discard all uncommited changes
alias git_discard="git clean -df && git checkout -- ."

#RAILS

#rails aliases
alias rls="./bin/rails"

alias rke="./bin/rake"


#Django
alias dj="python manage.py"
#start server
alias djs="dj runserver 3000"

#jekyll
alias jeks="jekyll serve --port 3000"

#apache
alias apache="sudo apachectl"

#OSU
alias flip="ssh garveya@access.engr.oregonstate.edu"

