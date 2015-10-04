#alias for sassquatch
alias sasq="ruby \"${HOME}/Documents/Programming/Ruby/sassquatch/sassquatch.rb\""

#alias for synced
alias synced="ruby \"${HOME}/Documents/Programming/Ruby/synced/synced.rb\""

#alias for sublime
alias subl="open -a \"Sublime Text 3\""

#alias for sublime packages
alias subl_settings="cd ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/sublime-snippets; open ."

#function to cd into directory in sites dir
function sites() { cd ~/Sites/; cd ./$1; }

#function to cd into directory in websites dir
function web() { cd ~/Sites/Websites/; cd ./$1; }

#function to cd into directory in programming dir
function doc() { cd ~/Documents/; cd ./$1; }

#function to cd into directory in programming dir
function prog() { cd ~/Documents/Programming/; cd ./$1; }

#alias for bash settings
alias settings="subl ~/.bash_profile \"${DOTFILES_DIR}aliases.bash\""

#alias to open current directory in finder
function op() { open ./$1; }

#function to create git repository and default .gitignore
function git_setup() { git init; echo -e ".DS_Store\n*.sublime-project\n*.sublime-workspace\n**/.sass-cache/*\n.sass-cache\n.sass-cache/*\nnode_modules/*\n" >> .gitignore; cat "${DOTFILES_DIR}license.txt" >> license.txt; }

#function to create file if not exists and open with sublime
function edit() { touch ./$1; subl ./$1; }

#alias to add all to git and check
alias g_a="git add .; git status;"
