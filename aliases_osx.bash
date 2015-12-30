#SETTINGS

#alias for bash settings
alias settings="subl ~/.bash_profile \"${DOTFILES_DIR}aliases.bash\""

alias dotfiles="cd \"$DOTFILES_DIR\""

#BUILT INS

alias grepc="grep -nr --color=always"

#find files with extension in current directory
function findex() { find . -type f -name \*.$1; }

#CUSTOM SCRIPTS

#alias for sassquatch
alias sasq="ruby \"${HOME}/Documents/Programming/Ruby/sassquatch/sassquatch.rb\""

#alias for synced
alias synced="rsync -a -p -u -v -v"

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
function git_setup() { git init; cat "${DOTFILES_DIR}default.gitignore" >> .gitignore; cat "${DOTFILES_DIR}default_license.txt" >> license.txt; }

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

#Django
#start server
alias djs="python manage.py runserver 3000"
alias dj="python manage.py"

#open new tab - add command to do it in new tab
# http://stackoverflow.com/questions/7171725/open-new-terminal-tab-from-command-line-mac-os-x
function tab() {
  osascript 2>/dev/null <<EOF
    tell application "System Events"
      tell process "Terminal" to keystroke "t" using command down
    end
    tell application "Terminal"
      activate
      do script with command "cd \"$PWD\"; $*" in window 1
    end tell
EOF
}

#apache
alias apache="sudo apachectl"

alias apache_config="cd /etc/apache2;op;prog Configuration/apache_config;subl .;gitup;"

#fonts
alias fonts="cd ~/Library/fonts;op;"
