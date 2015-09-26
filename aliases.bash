#alias for sassquatch
alias sasq="ruby /Users/Allen\ X/Documents/Programming/Ruby/sassquatch/sassquatch.rb"

#alias for synced
alias synced="ruby /Users/Allen\ X/Documents/Programming/Ruby/synced/synced.rb"

#alias for sublime
alias subl="open -a \"Sublime Text 3\""

#function to cd into directory in sites dir
function sites() { cd ~/Sites/; cd ./$1; }

#function to cd into directory in websites dir
function web() { cd ~/Sites/Websites/; cd ./$1; }

#function to cd into directory in programming dir
function doc() { cd ~/Documents/; cd ./$1; }

#function to cd into directory in programming dir
function prog() { cd ~/Documents/Programming/; cd ./$1; }

#alias for bash settings
alias settings="subl ~/.bash_profile ~/bash_dotfiles/aliases.bash"

#alias to open current directory in finder
function op() { open ./$1; }

#function to create git repository and default .gitignore
function git_setup() { git init; touch .gitignore; echo ".DS_Store" >> .gitignore; }
