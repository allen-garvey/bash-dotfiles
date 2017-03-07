#SETTINGS shared between OSX and linux
SHARED_INCLUDES_DIR="${DOTFILES_DIR}shared_includes/"

#alias for bash settings
alias dotfiles="cd \"$DOTFILES_DIR\""
#update dotfiles
alias update="git -C \"$DOTFILES_DIR\" pull && reload"

#set input mode to vi
set -o vi

#BUILT INS
alias a="ls -G"
alias aa="a -a"
alias aaa="aa -l"

alias up="cd ../;a"

#grep for pattern in files with extension
#http://stackoverflow.com/questions/12516937/grep-but-only-certain-file-extensions
# $1 pattern $2 - directory $3 file extension
function grepx() { grepc $1 $2 --include \*.$3;  }

#find files with extension in current directory
function findex() { find . -type f -name \*.$1; }
#find file by name recursively in current directory
alias findf="find . -name"

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

#CUSTOM SCRIPTS

#alias for sassquatch
alias sasq="ruby \"${HOME}/Documents/Programming/Ruby/sassquatch/sassquatch.rb\""

#alias for synced
alias synced="rsync -a -p -u -v -v"

#display weather
#give zipcode as optional argument
function weather(){ curl "wttr.in/$1"; }

#SUBLIME

#open sublime workspace in current directory if there is one, otherwise open folder in sublime
alias sp="if [ -f *.sublime-workspace ]; then subl *.sublime-workspace; else subl .; fi"

source "${SHARED_INCLUDES_DIR}net.bash"
source "${SHARED_INCLUDES_DIR}directories.bash"
source "${SHARED_INCLUDES_DIR}c.bash"
source "${SHARED_INCLUDES_DIR}d.bash"
source "${SHARED_INCLUDES_DIR}git.bash"


#Music
#requires sox to be installed by package manager - it is automatically aliased to `play`
alias pinknoise="play -q -c 2 -n synth pinknoise band -n 1600 1500 tremolo .1 35;"

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


source "${SHARED_INCLUDES_DIR}ssh.bash"
