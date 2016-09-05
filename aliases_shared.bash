#SETTINGS shared between OSX and linux

#alias for bash settings
alias dotfiles="cd \"$DOTFILES_DIR\""

#set input mode to vi
set -o vi

#BUILT INS
alias a="ls -G"
alias aa="a -a"
alias aaa="a -l"

alias up="cd ../;a"

#grep for pattern in files with extension
#http://stackoverflow.com/questions/12516937/grep-but-only-certain-file-extensions
# $1 pattern $2 - directory $3 file extension
function grepx() { grepc $1 $2 --include \*.$3;  }

#find files with extension in current directory
function findex() { find . -type f -name \*.$1; }
#find file by name recursively in current directory
alias findf="find . -name"

#prints out http headers for url - arg $1 is url
#http://stackoverflow.com/questions/10060098/getting-only-response-header-from-http-post-using-curl
function curlhead() { curl -s -D - $1 -o /dev/null; }

#combine the contents of all files in directory matching extension into one merged file
#$1 is input directory; $2 is full path of output file; $3 is file extension matching files in input directory
function mergef(){ 
	#check the output file doesn't already exist, since it would be overwritten
	if [ -f $2 ]; then
		(>&2 echo "Merge files aborting: output file $2 already exists")
		kill -INT $$
	fi
	find $1 -name \*.$3 -print0 | xargs -0 -I file cat file > $2 
}

#CONFIGS
alias hosts="sudo vim /etc/hosts;"

#CUSTOM SCRIPTS

#alias for sassquatch
alias sasq="ruby \"${HOME}/Documents/Programming/Ruby/sassquatch/sassquatch.rb\""

#alias for synced
alias synced="rsync -a -p -u -v -v"

#SUBLIME

#open sublime workspace in current directory if there is one, otherwise open folder in sublime
alias sp="if [ -f *.sublime-workspace ]; then subl *.sublime-workspace; else subl .; fi"

#Directories
#generic change directory function
function cddir() { cd "$1"; cd "./$2"; }

function home() { cddir ~ "$1"; a; }

#function to cd into directory in sites dir
function sites() { cddir ~/Sites "$1"; }

#function to cd into directory in programming dir
function doc() { cddir ~/Documents "$1"; }

#function to cd into directory in programming dir
function prog() { cddir ~/Documents/Programming "$1"; a; }

#function to cd into directory in desktop
function desktop() { cddir ~/Desktop "$1"; }

function downloads() { cddir ~/Downloads "$1"; }

function etc() { cddir /etc "$1"; a; }

function osu(){ cddir ~/Documents/OSU "$1"; ls; }

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

alias gu="git pull"

#show diff between staged files and HEAD
alias gd="git diff --cached"

#function to copy git repo and gitignore
function git_copy() { cp -r ./.git $1/.git; cp ./.gitignore $1/.gitignore; }

#alias to discard all uncommited changes
alias git_discard="git clean -df && git checkout -- ."

#RAILS

#rails aliases
alias rls="./bin/rails"

alias rke="./bin/rake"

#Elixir/Phoenix aliases

#start phoenix server
alias phxs="mix phoenix.server"
#create model with scaffold
alias phxg="mix phoenix.gen.html"


#Django
alias dj="python manage.py"
#start server
alias djs="dj runserver 3000"

#Python
#alias for simple python server
#serves current directory on localhost:3000
alias simpleserver="python -m SimpleHTTPServer 3000"

#jekyll
alias jeks="jekyll serve --port 3000"

#REDIS
alias redis="redis-cli"

#OSU
alias flip="ssh garveya@access.engr.oregonstate.edu"

