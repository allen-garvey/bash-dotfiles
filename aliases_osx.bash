#SETTINGS for OSX

#Basic Shell Setup
#PS1 to mimic Ubuntu default terminal theme (ubuntu terminal background color is: #300a24)
#export PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "

LS_COLORS=$LS_COLORS:'di=0;35:' ; export LS_COLORS
export PS1="\[\033[01;32m\]\h\[\033[00m\]:\w\$ "

#BUILT INS (declared before shared settings)
alias grepc="grep -nr --color=always"

source "${DOTFILES_DIR}aliases_shared.bash"

#alias for bash settings
alias settings="subl ~/.bash_profile \"${DOTFILES_DIR}\""
alias reload="source ~/.bash_profile;"


#REDIS
#assumes Redis is installed by homebrew
alias redis_start="redis-server /usr/local/etc/redis.conf;"


#SUBLIME

#alias for sublime
alias subl="open -a \"Sublime Text 3\""

#alias for sublime packages
alias subl_settings="cd ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/sublime-snippets; open ."

#Directories

#alias to open current directory in finder
function op() { open ./$1; }


#Postgres.app - psql command
export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"

#Git

#alias to open current directory in gitup
alias gitup="open . -a \"GitUp\""
#open stack overflow to add part of file in git to staging
alias git_part="open \"http://stackoverflow.com/questions/1085162/commit-only-part-of-a-file-in-git\";"

#RAILS

#Convenience
#start developing on existing web project in current directory (develop web)
alias dw="op;gitup;subl .;"


#Applescript for terminal commands

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

#opens current active finder window/tab directory in terminal
function opf() {
  osascript 2>/dev/null <<EOF
	tell application "Finder"
		set current_directory to quoted form of POSIX path of (target of window 1 as alias)
		tell application "Terminal"
			do script "cd " & current_directory in window 1
		end tell
	end tell
EOF
}

#apache
alias apache="sudo apachectl"
alias apache_config="cd /etc/apache2;op;prog Configuration/apache_config;subl .;gitup;"

#fonts
alias fonts="cd ~/Library/fonts;op;"

